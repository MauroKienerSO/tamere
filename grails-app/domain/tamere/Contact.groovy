package tamere

class Contact {

    String email
    String name
    String title
    String message

    static constraints = {
        email   nullable: false, email: true
        name    nullable: true
        title   nullable: true
        message nullable: true, maxSize: 7000
    }
}
