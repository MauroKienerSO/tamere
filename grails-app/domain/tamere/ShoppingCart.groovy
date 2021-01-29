package tamere

class ShoppingCart {

    static hasMany = [cartItems: CartItem]
    Double price = 0

    static constraints = {
        price       nullable: true
    }

    Double calculatePrice(){
        return this.cartItems ? this.cartItems*.price.sum() : 0
    }
}
