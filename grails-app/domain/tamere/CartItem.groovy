package tamere

class CartItem {

    Article article
    Size size
    Double price
    Integer amount

    static hasMany = [accessTokens: AccessToken]

    static constraints = {
        amount      nullable: false
        price       nullable: false
        size        nullable: true
        article     nullable: false
    }

    /**
     * returns true if cartItem includes the album
     */
    Boolean containsAlbum(){
        if(!this.article){
            return false
        }
        if(this.article.alias == 'plexian'){
            return true
        }
        return false
    }
}
