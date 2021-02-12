package tamere

class Article {

    String title
    String description
    String additionalInfo
    Double price

    String alias

    Boolean download = false
    Boolean active

    static hasMany = [sizes: Size, images: Image]

    static constraints = {
        title           nullable: false
        description     nullable: false
        additionalInfo  nullable: true, widget: 'textarea'
        alias           nullable: false
        price           nullable: false
        download        nullable: false
        active          nullable: false
    }
}
