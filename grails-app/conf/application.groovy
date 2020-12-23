// Spring Actuator Endpoints are Disabled by Default
endpoints{
    enabled = false
    jmx{
        enabled = true
    }
}

grails{
    profile = 'web'
    codegen{
        defaultPackage = 'tamere'
    }
    gorm{
        reactor{
            //Whether to translate GORM events into Reactor events
            //Disabled by default for performance reasons
            events = false
        }
    }
    mime{
        disable{
            accept{
                header{
                    userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
                }
            }
        }
        types = [
                all: '*/*',
                atom: "application/atom+xml",
                css: "text/css",
                csv: "text/csv",
                form: "application/x-www-form-urlencoded",
                html: ['text/html', 'application/xhtml+xml'],
                js: 'text/javascript',
                json: ['application/json', 'text/json'],
                multipartForm: 'multipart/form-data',
                pdf: 'application/pdf',
                rss: 'application/rss+xml',
                text: 'text/plain',
                oms: 'application/octet-stream',
                hal: ['application/hal+json','application/hal+xml'],
                xml: ['text/xml', 'application/xml']
        ]
    }
    urlmapping{
        cache{
            maxsize = 1000
        }
    }
    controllers{
        defaultScope = "singleton"
        upload{
            maxFileSize = 26214400 // 25 * 1024 * 1024 = 26.214.400 bytes = 25MB
            maxRequestSize = 26214400
        }
    }
    converters{
        encoding = "UTF-8"
    }
    messageSource.defaultEncoding = "UTF-8"
    views.default.codec = 'html'
    views{
        gsp{
            encoding = "UTF-8"
            htmlcodec = "xml"
            codecs{
                expression = "html"
                scriptlets = "none"
                taglib = "none"
                staticparts = "none"
            }
            sitemesh{
                preprocess = true
            }
        }
    }
}

spotify {
    clientId = 'f9a6a037ba9b43ed8fe4a05fb1d58401'
    clientSecret = '8547190fb7f241878203d3de23912a38'
}

hibernate{
    cache{
        queries = false
        use_second_level_cache = false
        use_query_cache = false
    }
}
grails {
    mail {
        host = "smtp.live.com"
        port = 587
        username = "tamereband@hotmail.com"
        password = "Plexian2020?"
        props = ["mail.smtp.starttls.enable":"true",
                 "mail.smtp.port":"587"]
    }
}
grails.mail.default.from = "tamereband@hotmail.com"
grails.mail.default.to = "tamereband@hotmail.com"

grails.image.default.width=300
grails.image.default.height=250
grails.image.allowed.content.types = ['image/jpeg', 'image/png']

dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "com.mysql.jdbc.Driver"
    dbCreate = "update"
    username = "tamere"
    password = "solothurn"
}

environments{
    development{
        dataSource{
            dbCreate = "update"
            url = "jdbc:mysql://localhost/tamere"
            username = "tamere"
            password = "solothurn"
        }
        server.contextPath = "/tamere"
        grails.image.basepath = "C:/dev/workspace/tamere-data"
    }
    test{
        dataSource{
            dbCreate = "update"
            url = "jdbc:mysql://localhost/tamere"
            username = "tamere"
            password = "solothurn"
        }
        server.contextPath = "/tamere"
    }
    production{
        dataSource{
            dbCreate = "update"
            url = "jdbc:mysql://localhost/tamere"
            username = "tamere"
            password = "solothurn"
            properties {
                jmxEnabled = "true"
                initialSize = "5"
                maxActive = "50"
                minIdle = "5"
                maxIdle = "25"
                maxWait = "10000"
                maxAge = "600000"
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = "ConnectionState"
                defaultTransactionIsolation = 2 // TRANSACTION_READ_COMMITTED
            }
        }
    }
}


// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'tamere.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'tamere.UserRole'
grails.plugin.springsecurity.authority.className = 'tamere.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

