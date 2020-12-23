package tamere

class Image {

    String title
    String alt
    String fileName

    static constraints = {
        fileName nullable: false
    }
}
