class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?" {
			constraints {
				// apply constraints here
			}
		}

        "/$id" {
            controller = "view"
            action = "show"
            constraints {
            }
        }

        "/~$id" {
            controller = "person"
            action = "show"
            constraints {
            }
        }

        "/th/$id" {
            controller = "theme"
            action = "show"
            constraints {
            }
        }

        "/info/$slug" {
            controller = "flatpage"
            action = "show"
            constraints {
            }
        }

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
