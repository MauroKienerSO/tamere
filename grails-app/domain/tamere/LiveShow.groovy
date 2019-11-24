package tamere

class LiveShow {

    Date date
    String venue
    String city
    String tickets

    Date dateCreated
    Date lastUpdated

    static constraints = {
        date    nullable: false
        venue   nulleble: true
        city    nullable: false
        tickets nullable: true, url: true
    }
}
