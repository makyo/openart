import openfurry.*

class BootStrap {

    def authenticateService

    def init = { servletContext ->

        /**
         * Role definitions
         */
        def roleAdmin = new Role(authority: "ROLE_ADMIN", description: "Site administrator")
        roleAdmin.save()

        def roleStaff = new Role(authority: "ROLE_STAFF", description: "Staff member")
        roleStaff.save()

        def roleGovernor = new Role(authority: "ROLE_GOVERNOR", description: "Governing board member")
        roleGovernor.save()

        def roleUser  = new Role(authority: "ROLE_USER", description: "Authenticated user")
        roleUser.save()

        /**
         * Species definitions
         */
        def speciesDeity = new Species(speciesName: "Anthropomorphic Deity")
        speciesDeity.save()
        
        def speciesTestSubject = new Species(speciesName: "Crash test dummy")
        speciesTestSubject.save()

        /**
         * Category definitions
         */
        def categoryVisual = new Category(categoryName: "Visual art")
        categoryVisual.save()

        def categoryPhotography = new Category(categoryName: "Photography", parent: categoryVisual)
        categoryPhotography.save(flush: true)

        def categoryPainting = new Category(categoryName: "Painting", parent: categoryVisual)
        categoryPainting.save(flush: true)

        categoryVisual.save(flush: true)

        /**
         * License definitions
         */
        def licenseCopyright = new License(
            title: "Copyright",
            description: "All rights reserved",
            display: "&copy;",
            url: "http://loc.gov"
        )
        licenseCopyright.save()


        /**
         * User definitions
         */
        def userGod = new Person(
            username: "god",
            userRealName: "God Almighty",
            enabled: true,
            emailShow: true,
            email: "god@openfurry.com",
            passwd: authenticateService.encodePassword('god'),
            memberType: "Lurker",
            maxViewableRating: "Adult",
            preferedLicense: licenseCopyright,
            species: speciesDeity
        )
        userGod.save()

        roleAdmin.addToPeople(userGod)
        roleStaff.addToPeople(userGod)
        roleGovernor.addToPeople(userGod)
        roleUser.addToPeople(userGod)

        def userSlave = new Person(
            username: "slave",
            userRealName: "Slave",
            enabled: true,
            emailShow: true,
            email: "slave@hotmail.com",
            passwd: authenticateService.encodePassword('slave'),
            memberType: "Lurker",
            preferedLicense: licenseCopyright,
            species: speciesTestSubject
        )
        userSlave.save()
        
        roleUser.addToPeople(userSlave)
        
        roleUser.save(flush: true)
        roleGovernor.save(flush: true)
        roleStaff.save(flush: true)
        roleAdmin.save(flush: true)
        licenseCopyright.save(flush: true)

        /**
         * Request mapping definitions
         */
        // Acegi requests
        def secureUser = new Requestmap(url: '/person/**', configAttribute: 'ROLE_STAFF').save()
        def secureRole = new Requestmap(url: '/authority/**', configAttribute: 'ROLE_ADMIN').save()
        def secureRequestmap = new Requestmap(url: '/requestmap/**', configAttribute: 'ROLE_ADMIN').save()

        // Issue requests
        def secureIssueEdit = new Requestmap(url: '/issue/edit/**', configAttribute: 'ROLE_GOVERNOR,ROLE_STAFF').save()
        def secureIssueCreate = new Requestmap(url: '/issue/create/**', configAttribute: 'ROLE_USER').save()
        def secureIssueVote = new Requestmap(url: '/issue/vote/**', configAttribute: 'ROLE_USER').save()
        def secureIssueDelete = new Requestmap(url: '/issue/delete/**', configAttribute: 'ROLE_STAFF').save()
        
        // Submission request
        def secureSubmit = new Requestmap(url: '/submit/**', configAttribute: 'ROLE_USER').save()

        // Flatpage request
        def secureFlatpageCreate = new Requestmap(url:'/flatpage/**', configAttribute: 'ROLE_STAFF').save()
    }
    def destroy = {
    }
}
