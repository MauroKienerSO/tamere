package tamere

class ShopOrder {

    ShoppingCart shoppingCart
    String name
    String address
    Integer plz
    String city

    String email

    AccessToken accessToken

    static constraints = {
        name           nullable: false
        address        nullable: false
        plz            nullable: false
        city           nullable: false
        email          nullable: false
        accessToken    nullable: true
    }

    /**
     * returns true if the Order contains the album
     */
    Boolean containsAlbum() {
        if(!this.shoppingCart){
            return false
        }
        def articles = shoppingCart.cartItems*.article
        Article plexian = articles.find { article ->
            if(article.alias == 'plexian'){
                return article
            }
        }

        if(plexian){
            return true
        }
        return false
    }
}
