package tamere

class AccessToken {

    String token
    Boolean valid = true

    static constraints = {
        token       nullable: false
        valid       nullable: false
    }
}
