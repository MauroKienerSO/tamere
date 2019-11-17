package tamere

class BootStrap {

    def init = {

        initRoles()

        initAdminUser()
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
            tamereAdmin.password = "solothurn"
            if (!tamereAdmin.save(flush: true)) {
                log.error "Could not create person $tamereAdmin"
                tamereAdmin.errors.allErrors.each {
                    log.error it.toString()
                }
            }
            UserRole.create(tamereAdmin, admin)
        }
    }

    def destroy = {
    }
}
