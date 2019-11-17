package tamere

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class LiveShowServiceSpec extends Specification {

    LiveShowService liveShowService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new LiveShow(...).save(flush: true, failOnError: true)
        //new LiveShow(...).save(flush: true, failOnError: true)
        //LiveShow liveShow = new LiveShow(...).save(flush: true, failOnError: true)
        //new LiveShow(...).save(flush: true, failOnError: true)
        //new LiveShow(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //liveShow.id
    }

    void "test get"() {
        setupData()

        expect:
        liveShowService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<LiveShow> liveShowList = liveShowService.list(max: 2, offset: 2)

        then:
        liveShowList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        liveShowService.count() == 5
    }

    void "test delete"() {
        Long liveShowId = setupData()

        expect:
        liveShowService.count() == 5

        when:
        liveShowService.delete(liveShowId)
        sessionFactory.currentSession.flush()

        then:
        liveShowService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        LiveShow liveShow = new LiveShow()
        liveShowService.save(liveShow)

        then:
        liveShow.id != null
    }
}
