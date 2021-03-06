package us.jnsq.openart

class IssueController {
    def authenticateService
    def marketService
    def messagingService

    static defaultAction = "list"

    def list = {
        def list = Issue.withCriteria {
            and {
                if (params.status) {
                    eq("status", Integer.parseInt(params.status))
                }
                if (params.type) {
                    if (params.type in 0..2) {
                        eq("type", Integer.parseInt(params.type))
                    }
                } else {
                    between("type", 0, 2)
                }
            }
            if (params['sort']) {
                order(params['sort'], params.order ?: 'asc')
            }
        }

        [issueList: list]
    }

    def show = {
        def issue = Issue.get(Integer.parseInt(params.id))
        if (!issue) {
            // TODO i18n
            response.sendError(404)
            return
        }

        [issue: issue]
    }

    def create = {
        if (params.id) {
            params.id = null
        }
    }

    def save = {
        def issueInstance
        if (params.id) {
            issueInstance = Issue.get(params.id)
        } else {
            issueInstance = new Issue()
        }
        issueInstance.properties = params
        def owner = authenticateService.principal().domainClass
        issueInstance.submitter = owner
        issueInstance.votes = 1

        if (issueInstance.save(flush: true)) {
            if (!params.id) {
                def issueVoteInstance = new IssueVote()
                issueVoteInstance.voter = owner
                issueVoteInstance.issue = issueInstance
                issueVoteInstance.save(flush: true)
            }
            redirect(action: "show", params: [id: issueInstance.id])
        } else {
            render(view: "create", model: [instance: issueInstance])
        }
    }

    def edit = {
        if (!authenticateService.ifAnyGranted("ROLE_ADMIN,ROLE_STAFF,ROLE_GOVERNOR")) {
            response.sendError(403) // TODO i18n
        }
        def issueInstance = Issue.get(params.id)
        if (issueInstance) {
            render(view: "create", model: [instance: issueInstance])
        } else {
            response.sendError(404) // TODO i18n
        }
    }

    def vote = {
        def issue = Issue.get(params.id)
        if (!issue) {
            response.sendError(404) // TODO i18n
            return
        }
        def user = authenticateService.principal().domainClass

        // Make sure user hasn't already voted on the issue
        def issueVote = IssueVote.withCriteria {
            and {
                eq('issue', issue)
                eq('voter', user)
            }
        }
        if(issueVote) {
            messagingService.transientMessage(
                user,
                grailsApplication.config.openart.user.messageTypes.failure,
                "openart.messages.issue.voteTwice",
                "You cannot vote twice on the same issue"
            )
            render(view: 'show', model: [issue: issue])
            return
        }

        // Increment vote count
        issue.votes++
        issue.save()

        // Create issue vote
        issueVote = new IssueVote(
            issue: issue,
            voter: user
        )
        issueVote.save()

        // charge the user
        marketService.transact(user, "Issue.vote(memberClass:${user.memberClass})")
        messagingService.transientMessage(
            user,
            grailsApplication.config.openart.user.messageTypes.success,
            "openart.messages.issue.vote",
            "Vote cast"
        )
        messagingService.transientMessage(
            issue.submitter,
            grailsApplication.config.openart.user.messageTypes.success,
            "openart.messages.issue.voted",
            "{1} voted on your issue, {0}",
            issue.class.toString().split("\\.")[-1],
            issue.id,
            user
        )

        // Show success, message, issue
        render(view: 'show', model: [issue: issue])
    }
}
