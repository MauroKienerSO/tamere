package tamere

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.ROLE_ADMIN)
class OrderController {

    def index() {
        log.debug "$actionName -> $params"

        List<ShopOrder> orders = ShopOrder.list([sort: 'date', order: 'desc'])

        [orders: orders]
    }

    def shipOrder() {
        log.debug "$actionName -> $params"

        ShopOrder order = ShopOrder.get(params.long('id'))
        if(!order){
            redirect action: 'index'
            return
        }

        order.shipped = true
        order.save(flush: true)

        List<ShopOrder> orders = ShopOrder.list([sort: 'date', order: 'desc'])

        render view: '/order/index', model: [orders: orders]
    }

    def paymentReceived() {
        log.debug "$actionName -> $params"

        ShopOrder order = ShopOrder.get(params.long('id'))
        if(!order){
            redirect action: 'index'
            return
        }

        order.paymentReceived = true
        order.save(flush: true)

        List<ShopOrder> orders = ShopOrder.list([sort: 'date', order: 'desc'])

        render view: '/order/index', model: [orders: orders]
    }
}
