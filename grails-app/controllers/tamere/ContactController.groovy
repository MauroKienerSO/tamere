package tamere

import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured
import grails.plugins.mail.MailService

@Secured('permitAll')
class ContactController {

    MailService mailService
    GrailsApplication grailsApplication

    def body(){
        log.debug "$actionName -> $params"
        render template: 'contactTemplate'
    }

    def sendMessage(){
        log.debug "$actionName -> $params"

        String fromEmail = grailsApplication.config.grails.mail.default.from

        // DOC: http://gpc.github.io/grails-mail/guide/3.%20Sending%20Email.html
        mailService.sendMail {
            multipart true
            from fromEmail
            subject "Hello Ta Mère"
            html view: "/emails/contactMessage"
            text view: "/emails/plain/contactMessage"
        }

        Boolean messageSent = true

        render template: 'contactTemplate', model: [messageSent: messageSent]
    }

    def index() {
        log.debug "$actionName -> $params"
        render view: '/home/index', model: [templateLocation: '/contact/contactTemplate', headerActive: 'contact']
    }

    def messages(){
        log.debug "$actionName -> $params"
    }
}
