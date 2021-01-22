package tamere

class Video {

    String title
    String youtubeVideoCode

    static constraints = {
        title               nullable: true
        youtubeVideoCode    nullable: true
    }
}
