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
}
