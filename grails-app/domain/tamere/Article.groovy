package tamere

class Article {

    String title
    String description
    Double price

    Boolean download = false
    Boolean active

    static hasMany = [sizes: Size, images: Image]

    static constraints = {
        title           nullable: false
        description     nullable: false
        price           nullable: false
        download        nullable: false
        active          nullable: false
    }
}
