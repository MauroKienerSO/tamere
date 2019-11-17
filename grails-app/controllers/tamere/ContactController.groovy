package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ContactController {

    static scaffold = Contact

    def body(){
        log.debug "$actionName -> $params"

        render template: 'contactTemplate'
    }
}
