package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ShopController {

    StoreService storeService

    def index() {
        log.debug "$actionName -> $params"
        render view: '/home/index', model: [templateLocation: '/shop/shopTemplate', headerActive: 'shop']
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

        render view: '/home/index', model: [templateLocation: '/shop/showArticle', headerActive: 'shop', pushState: createLink(controller: 'shop', action: 'showArticleAjax', params: [alias: article.alias]), article: article]
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
}
