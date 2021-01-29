package tamere

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'home', action:"index")
        "/home"(controller: 'home', action:"index")
        "500"(view:'/error')
        "404"(view:'/notFound')

        "/live"(controller: 'live', action: 'index')
        "/band"(controller: 'band', action: 'index')
        "/music"(controller: 'music', action: 'index')
        "/video"(controller: 'video', action: 'index')
        "/shop"(controller: 'shop', action: 'index')
        "/shop/body"(controller: 'shop', action: 'body')
        "/shop/$alias"(controller: 'shop', action: 'showArticleAjax', params: [alias: alias])
        "/contact"(controller: 'contact', action: 'index')
    }
}
