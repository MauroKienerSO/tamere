package tamere

class Video {

    String title
    String youtubeVideoCode

    String dateCreated
    String lastUpdated

    static constraints = {
        title               nullable: true
        youtubeVideoCode    nullable: true
    }
}
