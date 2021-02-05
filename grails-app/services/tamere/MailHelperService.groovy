package tamere

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional
import grails.plugins.mail.MailService
import grails.util.Environment

@Transactional
class MailHelperService {

    MailService mailService
    GrailsApplication grailsApplication

    def sendOrderConfirmationMailToUser(ShopOrder order){
        log.debug "Send Order mail to User"

        String htmlTemplate = "/emails/orderConfirmationMail"
        String textTemplate = "/emails/plain/orderConfirmationMail"

        Map model = [
                order: order
        ]

        String subject = "Order tamere"
        sendMailTemplate(order.email, subject, htmlTemplate, textTemplate, model)

        sendOrderMailAdmin(order)
    }

    def sendOrderMailAdmin(ShopOrder order){
        log.debug "Send order mail to Admin"

        String htmlTemplate = "/emails/orderMessage"
        String textTemplate = "/emails/plain/orderMessage"

        Map model = [
                order: order
        ]

        String adminEmail = grailsApplication.config.grails.mail.default.to

        String subject = "Order received Confirmation"
        sendMailTemplate(adminEmail, subject, htmlTemplate, textTemplate, model)
    }

    def sendContactConfirmationMailToUser(Contact contact){
        log.debug "Send contact mail to User"

        String htmlTemplate = "/emails/contactConfirmationMail"
        String textTemplate = "/emails/plain/contactConfirmationMail"

        Map model = [
                contact: contact
        ]

        String subject = "Message received confirmation"
        sendMailTemplate(contact.email, subject, htmlTemplate, textTemplate, model)

        sendContactMailAdmin(contact)
    }

    def sendContactMailAdmin(Contact contact){
        log.debug "Send contact mail to Admin"

        String htmlTemplate = "/emails/contactMessage"
        String textTemplate = "/emails/plain/contactMessage"

        Map model = [
                contact: contact
        ]

        String adminEmail = grailsApplication.config.grails.mail.default.to

        sendMailTemplate(adminEmail, contact.title, htmlTemplate, textTemplate, model)
    }

    def sendMailTemplate(String toEmail, String subjectText, String htmlTemplate, String textTemplate, Map model){

        // Who receives this email?
        toEmail = receiverPerEnv(toEmail)

        // Who sends the mail?
        String fromEmail = grailsApplication.config.grails.mail.default.from

        log.debug "Sending mail from ${fromEmail} to ${toEmail} with subject ${subjectText} and templates ${htmlTemplate} and ${textTemplate}"
        log.debug "Model is ${model}"

        // DOC: http://gpc.github.io/grails-mail/guide/3.%20Sending%20Email.html
        mailService.sendMail {
            multipart true
            from fromEmail
            to toEmail
            subject subjectText
            html view: htmlTemplate, model: model
            text view: textTemplate, model: model
        }
    }

    String receiverPerEnv(String toEmail){
        if(Environment.current != Environment.PRODUCTION){
            log.debug "We are not in production Environment"
            return grailsApplication.config.grails.mail.default.from
        } else {
            return toEmail
        }
    }


}
