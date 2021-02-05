package tamere

class Image {

    String fileName
    Integer orderEntry

    static constraints = {
        fileName         nullable: false
        orderEntry       nullable: true
    }
}
