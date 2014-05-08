package skymall

import grails.transaction.Transactional

class AutomobileController {

    def index() {
    }

    def list(){
        //render params.id
        def automobileList = Apparel.findAllByStoreID(params.id)
        flash.storeID = params.id
        render(view:"index", model: [AutomobileInstanceList: automobileList])
    }

    def  create(){
        if(session.user.userRole != "Tenant") {
            flash.error = message(code: 'default.not.authorized')
            redirect(action: "list")
            return
        }

        def storeid = flash.storeID
        respond new Automobile(storeID:storeid);
    }

    def update() {
        if(session.user.userRole != "Tenant") {
            flash.error = message(code: 'default.not.authorized')
            redirect(action: "list")
            return
        }
        def automobileInstance = Automobile.get( params.id )
        if(automobileInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(automobileInstance.version > version) {
                    automobileInstance.errors.rejectValue("version", "", "Another user has updated this product while you were editing.")
                    render(view:'edit',model:[AutomobileInstanceList:automobileInstance])
                    return
                }
            }

            // Getting the file
            def f = request.getFile('image')

            // List of OK mime-types
            if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
                flash.message = "File must be one of: ${ProductController.okcontents}"
                respond automobileInstance.errors, view:'create'
                return
            }
            if (f.size > 0){
                // Save the image and mime type
                automobileInstance.image = f.bytes
                automobileInstance.imageType = f.contentType
            }

            automobileInstance.properties = params
            def _toBeDeleted = automobileInstance.variants.findAll {it._deleted}
            if (_toBeDeleted) {
                automobileInstance.variants.removeAll(_toBeDeleted)
            }

            if(!automobileInstance.hasErrors() && automobileInstance.save()) {
                flash.message = "Automobile ${params.id} updated"
                render (view:'show',model:[AutomobileInstance:automobileInstance])
            }
            else {
                render(view:'edit',model:[AutomobileInstance: automobileInstance])
            }
        }
        else {
            flash.message = "product not found with id ${params.id}"
            redirect(action:list)
        }
    }


//    def show(Automobile automobileInstance) {
//        respond automobileInstance
//    }

    def save(Automobile automobileInstance) {
        if (automobileInstance == null) {
            notFound()
            return
        }

        if (automobileInstance.hasErrors()) {
            respond automobileInstance.errors, view:'create'
            return
        }

        // Getting the file
        def f = request.getFile('image')

        // List of OK mime-types
        if (f != null && f.size > 0 && !ProductController.okcontents.contains(f.getContentType())) {
            flash.message = "File must be one of: ${ProductController.okcontents}"
            respond automobileInstance.errors, view:'create'
            return
        }
        if (f.size > 0){
            // Save the image and mime type
            automobileInstance.image = f.bytes
            automobileInstance.imageType = f.contentType
        }

        automobileInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [
                        message(code: 'automobileInstance.label', default: 'Automobile'),
                        automobileInstance.id
                ])
                redirect automobileInstance
            }
            '*' { respond automobileInstance, [status: CREATED] }
        }
    }

    def getImage() {
        def automobile = Automobile.get(params.id)
        if (!automobile || !automobile.image || !automobile.imageType) {
            response.sendError(404)
            return
        }
        response.contentType = automobile.imageType
        response.contentLength = automobile.image.size()
        OutputStream out = response.outputStream
        out.write(automobile.image)
        out.close()
    }

    def scaffold = Automobile
}
