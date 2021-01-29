package tamere

import grails.gorm.transactions.Transactional

import javax.servlet.http.HttpSession

@Transactional
class StoreService {

    /**
     * loads the shoppingCart from the Session
     */
    def loadShoppingCart(HttpSession session) {

        //ShoppingCart anhand der in der Session abgelegten ID suchen
        ShoppingCart shoppingCart = session?.shoppingCart?ShoppingCart.findById(session.shoppingCart):null

        if(!shoppingCart){
            log.info "Creating a new Shopping Cart"
            shoppingCart = new ShoppingCart().save(flush: true)
        }

        session.shoppingCart = shoppingCart.id
        session.shoppingAmount = shoppingCart.cartItems?.size()?:0

        return shoppingCart
    }
}
