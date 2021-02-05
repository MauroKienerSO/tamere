package tamere

import grails.converters.JSON
import grails.core.GrailsApplication
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ShopController {

    GrailsApplication grailsApplication
    MailHelperService mailHelperService
    StoreService storeService

    def index() {
        log.debug "$actionName -> $params"

        Integer amountOfItemsInShoppingCart = storeService.getNumberOfItemsInShoppingCart(session)

        render view: '/home/index', model: [templateLocation: '/shop/shopTemplate', headerActive: 'shop', amountOfItemsInShoppingCart: amountOfItemsInShoppingCart]
    }

    def body() {
        log.debug "$actionName -> $params"
        render template: 'shopTemplate'
    }

    def showArticleAjax() {
        log.debug "$actionName -> $params"

        Article article = Article.findByAlias(params.alias)
        if(!article){
            render template: 'shopTemplate'
            return
        }

        if(params.boolean('ajax')){
            log.debug "ajax is true"
            render template: 'showArticle', model: [article: article]
            return
        }

        Integer amountOfItemsInShoppingCart = storeService.getNumberOfItemsInShoppingCart(session)

        render view: '/home/index', model: [templateLocation: '/shop/showArticle', headerActive: 'shop', pushState: createLink(controller: 'shop', action: 'showArticleAjax', params: [alias: article.alias]), article: article, amountOfItemsInShoppingCart: amountOfItemsInShoppingCart]
    }

    /**
     * Loads the shopping cart
     */
    def loadShoppingCartAjax() {
        log.debug "$actionName -> $params"

        ShoppingCart shoppingCart = storeService.loadShoppingCart(session, false)
        if(!shoppingCart){
            log.info "Couldn't load Shopping Cart"
            response.status = 400
            render 'not ok'
            return
        }

        render template: '/shop/cartModal', model: [shoppingCart: shoppingCart]
    }

    /**
     * adds a cartItem to the ShoppingCart
     */
    def addToCartAjax(){
        log.debug "$actionName -> $params"

        ShoppingCart shoppingCart = storeService.loadShoppingCart(session)

        Article article = Article.get(params.long('id'))
        if(!article){
            response.status = 400
            render 'not ok'
            return
        }
        Size size = null
        if(params.size){
            size = Size.findBySize(params.size)
        }

        Integer amount = params.int('amount')
        if(!amount){
            response.status = 400
            render 'not ok'
            return
        }

        CartItem cartItem = shoppingCart.cartItems.find { cartItem ->
            if(cartItem.article.id == article.id){
                if(cartItem.size){
                    if(cartItem.size.id == size.id){
                        return cartItem
                    }
                } else {
                    return cartItem
                }
            }
        }

        if(cartItem){
            cartItem.amount += amount
            cartItem.price = (double) cartItem.amount * article.price
            cartItem.save(flush: true)
        } else {
            log.debug "Creating a new CartItem"
            Double cartItemPrice = (double) amount * article.price
            cartItem = new CartItem(amount: amount, article: article, size: size, price: cartItemPrice)
            shoppingCart.addToCartItems(cartItem)

            if(!cartItem.save(flush: true)){
                log.info "Couldn't Save cartItem"
                log.info "${cartItem.errors}"
                response.status = 400
                render 'not ok'
                return
            }
        }

        shoppingCart.price = shoppingCart.calculatePrice()
        if(!shoppingCart.save(flush: true)){
            log.info "Couldn't Save shoppingCart"
            log.info "${shoppingCart.errors}"
            response.status = 400
            render 'not ok'
            return
        }

        render template: '/shop/cartModal', model: [shoppingCart: shoppingCart]
    }

    /**
     * increments or decrements the amount of the cartItem and ths also the price and the shoppingCart Total Price
     * @return
     */
    def changeArticleAmountAjax() {
        log.debug "$actionName -> $params"

        CartItem cartItem = CartItem.get(params.long('id'))
        if(!cartItem){
            response.status = 400
            render 'not ok'
            return
        }

        ShoppingCart shoppingCart = ShoppingCart.get(params.long('shoppingCartId'))
        if(!shoppingCart){
            response.status = 400
            render 'not ok'
            return
        }

        Integer changeAmount = params.int('changeAmount')
        cartItem.amount += changeAmount

        if(cartItem.amount == 0){
            shoppingCart.removeFromCartItems(cartItem)
            try {
                cartItem.delete(flush: true)
            } catch(Exception e){
                log.info "couldn't delete cartItem"
                log.info "${e.message}"
            }
        } else {
            cartItem.price = (double) cartItem.amount * cartItem.article.price
            try {
                cartItem.save(flush: true)
            } catch(Exception e){
                log.info "couldn't save cartItem"
                log.info "${e.message}"
            }
        }

        shoppingCart.price = shoppingCart.calculatePrice()
        if(!shoppingCart.save(flush: true)){
            log.info "Couldn't Save shoppingCart"
            log.info "${shoppingCart.errors}"
            response.status = 400
            render 'not ok'
            return
        }

        def cartItemAmount = cartItem?.amount?:0
        def cartItemPrice = cartItem?.price?:0
        def totalPrice = shoppingCart.price
        def amountOfItems = shoppingCart.amountOfItems()

        def responseData = [
                'cartItemAmount': cartItemAmount,
                'cartItemPrice': cartItemPrice,
                'totalPrice': totalPrice,
                'amountOfItems': amountOfItems
        ]

        render responseData as JSON
    }

    /**
     * Loads the ckeckout View
     */
    def checkout(){
        log.debug "$actionName -> $params"

        ShoppingCart shoppingCart = storeService.loadShoppingCart(session, false)
        if(!shoppingCart){
            log.info "No ShoppingCart is present"
            redirect action: 'index'
            return
        }

        render view: '/home/index', model: [templateLocation: '/shop/checkout', headerActive: 'shop', pushState: createLink(controller: 'shop', action: 'checkout'), shoppingCart: shoppingCart, order: new ShopOrder()]
    }

    /**
     * creates an order
     */
    def createOrderAjax(){
        log.debug "$actionName -> $params"

        ShoppingCart shoppingCart = storeService.loadShoppingCart(session, false)
        if(!shoppingCart){
            log.info "No ShoppingCart is present"
            redirect action: 'index'
            return
        }

        ShopOrder order = new ShopOrder()
        bindData(order, params,  ['exclude': ['plz']])
        order.plz = params.int('plz')
        order.shoppingCart = shoppingCart

        try {
            order.save(flush: true)
        } catch(Exception e){
            log.debug "Couldn't save order"
            log.debug "${e.message}"
            response.status = 400
            render 'not ok'
            return
        }

        if(order.containsAlbum()){
            log.debug "Creating New Access Token for downloading the album"
            AccessToken accessToken = new AccessToken(token: UUID.randomUUID().toString(), valid: true).save(flush: true)
            order.accessToken = accessToken
            order.save(flush: true)
        }

        try {
            mailHelperService.sendOrderConfirmationMailToUser(order)
        } catch(Exception e){
            log.info "There was an exception"
            log.info "${e.message}"
            response.status = 400
            render 'not ok'
            return
        }

        storeService.removeShoppingCartFromSession(session)

        render template: 'orderDone'
    }

    def downloadPlexian(){
        log.debug "$actionName -> $params"

        AccessToken accessToken = AccessToken.findByToken(params.token)
        if(!accessToken){
            redirect controller: 'home', action: 'index'
            return
        }
        if(accessToken && !accessToken.valid){
            render view: '/shop/downloadPlexian', model: [hideNavbar: true, alreadyDownloaded: true]
            return
        }

        [hideNavbar: true, accessToken: accessToken]
    }

    def donwloadZipFilePlexian(){
        log.debug "$actionName -> $params"

        AccessToken accessToken = AccessToken.findByToken(params.token)
        if(!accessToken){
            redirect controller: 'home', action: 'index'
            return
        }
        if(accessToken && !accessToken.valid){
            render view: '/shop/downloadPlexian', model: [hideNavbar: true, alreadyDownloaded: true]
            return
        }

        String filePath = grailsApplication.config.grails.album.basepath
        File file = new File(filePath)

        if(!file.exists()){
            log.info "Plexian Zip File could not be found"
            render view: '/shop/downloadPlexian', model: [hideNavbar: true, problemFindingFile: true]
            return
        } else {
            accessToken.valid = false
            accessToken.save(flush: true)
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.name}")
            file.withInputStream { response.outputStream << it }
            return
        }

    }
}
