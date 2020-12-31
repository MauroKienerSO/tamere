package tamere

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest

@Transactional
class FileService {

    ImageService imageService
    GrailsApplication grailsApplication
    def messageSource

    /**
     * stores an image on the file System
     * If the image already exists, generates a new UUID for the image
     */
    Map saveImage(StandardMultipartHttpServletRequest.StandardMultipartFile file, Image image){

        Map result = [
                success: false,
                image: null
        ]

        String fileContentType = file.getContentType()
        if(!grailsApplication.config.grails.image.allowed.content.types.contains(fileContentType)){
            result['message'] = messageSource.getMessage('image.save.content.type.not.supported', [].toArray(), LocaleContextHolder.getLocale())
            return result
        }

        // Get a UUID Code representing the image
        String fileName = getUUIDCodeForFileName(fileContentType)

        // Define the path and the name with which the file should be saved
        String basePath = grailsApplication.config.grails.image.basepath

        // make a directory if it doesn't exist
        File directory = new File(basePath)
        if(!directory.exists()){
            directory.mkdir()
        }

        String imagePath = "${basePath}/${fileName}"
        file.transferTo(new File("${imagePath}"))

        image.fileName = fileName

        try {
            imageService.save(image)
        } catch (ValidationException e) {
            log.error "Error storing image"
            result['message'] = image.errors
            return result
        }

        result['success'] = true
        result['image'] = image

        return result
    }

    /**
     * saves a list of images on the filesSystem and inside the database
     */
    def saveImages(def fileList){

        List<Image> images = []

        fileList.each { file ->
            Image image = new Image()

            // Save the image on the file System
            Map result = saveImage(file, image)
            images.push(result['image'])
        }

        return images
    }

    /**
     * returns a UUID Id for the ImageFileName
     */
    String getUUIDCodeForFileName(String contentType){
        String id = UUID.randomUUID().toString()
        String fileEnding = contentType.split('/')[1]

        return "${id}.${fileEnding}"
    }

    /**
     * deletes an image on the fileSystem
     */
    void deleteImage(String fileName){
        String basePath = grailsApplication.config.grails.image.basepath
        File imageToDelete = new File("${basePath}/${fileName}")

        if(imageToDelete.exists()){
            imageToDelete.delete()
        }
    }
}
