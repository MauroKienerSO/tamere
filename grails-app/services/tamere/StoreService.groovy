package tamere

import grails.gorm.transactions.Transactional

import javax.servlet.http.HttpSession

@Transactional
class StoreService {

    /**
     * loads the shoppingCart from the Session
     */
    def loadShoppingCart(HttpSession session, Boolean createNew = true) {

        //ShoppingCart anhand der in der Session abgelegten ID suchen
        ShoppingCart shoppingCart = session?.shoppingCart?ShoppingCart.findById(session.shoppingCart):null

        if(!shoppingCart && createNew){
            log.info "Creating a new Shopping Cart"
            shoppingCart = new ShoppingCart().save(flush: true)
        }

        session.shoppingCart = shoppingCart?.id?:null

        return shoppingCart
    }

    /**
     * returns the number of items inside the shopping Cart
     */
    Integer getNumberOfItemsInShoppingCart(HttpSession session){
        ShoppingCart shoppingCart = loadShoppingCart(session, false)
        Integer amountOfItemsInShoppingCart = 0
        if(shoppingCart){
            log.debug "shopping Cart exists"
            amountOfItemsInShoppingCart = shoppingCart.amountOfItems()
        }
        return amountOfItemsInShoppingCart
    }

    void removeShoppingCartFromSession(HttpSession session){
        session.shoppingCart = null
    }


}
