package tamere

class BootStrap {

    def init = {

        initRoles()

        initAdminUser()

        initSizes()
    }

    void initRoles(){
        log.info "init Roles"

        Role admin = Role.findOrSaveWhere(authority: Role.ROLE_ADMIN)
    }

    void initAdminUser(){
        log.debug "init Users"

        Role admin = Role.findByAuthority(Role.ROLE_ADMIN)
        User tamereAdmin = User.findByUsername("tamere")

        if(!tamereAdmin) {
            tamereAdmin = new User()
            tamereAdmin.username = "tamere"
            tamereAdmin.password = "Plexian2020?"
            if (!tamereAdmin.save(flush: true)) {
                log.error "Could not create person $tamereAdmin"
                tamereAdmin.errors.allErrors.each {
                    log.error it.toString()
                }
            }
            UserRole.create(tamereAdmin, admin)
        }
    }

    void initSizes(){
        log.debug "init Sizes"

        List<Size> sizes = Size.list()

        if(!sizes){

            ['S', 'M', 'L', 'XL'].each { sizeValue ->
                Size sizeDomain = new Size()
                sizeDomain.size = sizeValue

                if (!sizeDomain.save(flush: true)) {
                    log.error "Could not create size $sizeDomain"
                    sizeDomain.errors.allErrors.each {
                        log.error it.toString()
                    }
                }

            }
        }
    }

    def destroy = {
    }
}
