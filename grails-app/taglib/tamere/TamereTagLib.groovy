package tamere

import grails.core.GrailsApplication

class TamereTagLib {

    GrailsApplication grailsApplication

    def imageDisplay = { attrs, body ->

        Image image = attrs.image
        if(!image){
            out << ""
        }

        def width = attrs.width?:grailsApplication.config.grails.image.default.width
        def height = attrs.height?:grailsApplication.config.grails.image.default.height

        String title = attrs.title?:"Ta Mère Band Bild"
        String alt = attrs.alt?:"Ta Mère Band Solothurn Bild"

        out << render(template: "/tagLib/displayTemplate", model: [image: attrs.image, width: width, height: height, title: title, alt: alt])
    }

    def checkboxDisplay = { attrs, body ->
        out << render(template: "/tagLib/checkbox", model: [checked: attrs.checked, id: attrs.id, name: attrs.name, value: attrs.value])
    }
}
