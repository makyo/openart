package openfurry

class IssuesController {

    def index = { }

    def list = {
        def list = Issue.withCriteria {
            and {
                if (params.status) {
                    eq('status', Integer.parseInt(params.status))
                }
                if (params.type) {
                    eq('type', Integer.parseInt(params.type))
                }
            }
        }

        [issueList: list]
    }

    def view = {
        def issue = Issue.get(Integer.parseInt(params.id))
        if (!issue) {
            // TODO i18n
            response.sendError 404
            return
        }
    }

    def create = {}

    def save = {}

    def edit = {}

    def vote = {}
}
