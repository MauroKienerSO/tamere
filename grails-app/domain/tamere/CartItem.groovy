package tamere

class CartItem {

    Article article
    Size size
    Double price
    Integer amount

    static constraints = {
        amount      nullable: false
        price       nullable: false
    }
}
