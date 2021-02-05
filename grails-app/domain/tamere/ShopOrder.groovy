package tamere

class ShopOrder {

    ShoppingCart shoppingCart
    String name
    String address
    Integer plz
    String city

    String email

    static constraints = {
        name           nullable: false
        address        nullable: false
        plz            nullable: false
        city           nullable: false
        email          nullable: false
    }

    /**
     * returns true if the Order contains the album
     */
    Boolean containsAlbum() {
        if(!this.shoppingCart){
            return false
        }
        CartItem cartItem = shoppingCart.cartItems.find { cartItem ->
            if(cartItem.containsAlbum()){
                return cartItem
            }
        }

        if(cartItem){
            return true
        }
        return false
    }

    CartItem getPlexianCartItem(){
        if(!this.shoppingCart){
            return null
        }

        CartItem cartItem = shoppingCart.cartItems.find { cartItem ->
            if(cartItem.containsAlbum()){
                return cartItem
            }
        }

        return cartItem
    }
}
