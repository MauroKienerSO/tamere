package tamere

import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ContactController {

    MailHelperService mailHelperService

    def body(){
        log.debug "$actionName -> $params"
        Contact contact = new Contact()
        render template: 'contactTemplate', model: [contact: contact]
    }

    def sendMessage(){
        log.debug "$actionName -> $params"

        Contact contact = new Contact()
        bindData(contact, params)

        if(!contact.save(flush: true)){
            log.debug "Couldn't save Contact"
            log.debug "${contact.errors}"
            String errorMessage = "We could not send the email, did you provide a valid email-adress and a Message?"
            render template: 'contactTemplate', model: [contact: contact, errorMessage: errorMessage]
            return
        }

        log.debug "contact has been saved"

        mailHelperService.sendContactConfirmationMailToUser(contact)

        Boolean messageSent = true

        render template: 'contactTemplate', model: [messageSent: messageSent]
    }

    def index() {
        log.debug "$actionName -> $params"
        Contact contact = new Contact()
        render view: '/home/index', model: [templateLocation: '/contact/contactTemplate', headerActive: 'contact', contact: contact]
    }

    def messages(){
        log.debug "$actionName -> $params"
    }
}
