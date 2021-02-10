package tamere

import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ContactController {

    def storeService
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

        contact.date = new Date()

        if(!contact.save(flush: true)){
            log.debug "Couldn't save Contact"
            log.debug "${contact.errors}"
            String errorMessage = "We could not send the email, did you provide a valid email-adress and a Message?"
            render template: 'contactTemplate', model: [contact: contact, errorMessage: errorMessage]
            return
        }

        try {
            mailHelperService.sendContactConfirmationMailToUser(contact)
        } catch(Exception e){
            log.error "There was an Exception during sending a mail"
            log.error "ERROR: ${e.message}"
            String errorMessage = "We could not send the email, did you provide a valid email-adress and a Message?"
            render template: 'contactTemplate', model: [contact: contact, errorMessage: errorMessage]
            return
        }

        Boolean messageSent = true

        render template: 'contactTemplate', model: [messageSent: messageSent]
    }

    def index() {
        log.debug "$actionName -> $params"

        Integer amountOfItemsInShoppingCart = storeService.getNumberOfItemsInShoppingCart(session)

        Contact contact = new Contact()
        render view: '/home/index', model: [templateLocation: '/contact/contactTemplate', headerActive: 'contact', contact: contact, amountOfItemsInShoppingCart: amountOfItemsInShoppingCart]
    }

    def messages(){
        log.debug "$actionName -> $params"
    }

    def respondToMessage(){
        log.debug "$actionName -> $params"

        Contact contact = Contact.get(params.long('id'))
        if(!contact){
            redirect action: 'messages'
            return
        }

        contact.responded = true
        contact.save(flush: true)

        render view: '/contact/messages'
    }
}
