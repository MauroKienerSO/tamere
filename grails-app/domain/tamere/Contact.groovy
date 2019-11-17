package tamere

class Contact {

    String email
    String phone

    static constraints = {
        email   nullable: false, unique: true, email: true
        phone()
    }
}
