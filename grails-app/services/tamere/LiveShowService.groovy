package tamere

import grails.gorm.services.Service

@Service(LiveShow)
interface LiveShowService {

    LiveShow get(Serializable id)

    List<LiveShow> list(Map args)

    Long count()

    void delete(Serializable id)

    LiveShow save(LiveShow liveShow)

}