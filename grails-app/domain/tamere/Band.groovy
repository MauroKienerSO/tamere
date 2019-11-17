package tamere

class Band {

    String name
    String explanation
    Integer countMembers

    static hasMany = [members: User]

    static constraints = {
        name    nullable: false
        explanation()
        members()
    }
}
