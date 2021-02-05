import grails.util.BuildSettings
import grails.util.Environment
import org.springframework.boot.logging.logback.ColorConverter
import org.springframework.boot.logging.logback.WhitespaceThrowableProxyConverter

import java.nio.charset.Charset

conversionRule 'clr', ColorConverter
conversionRule 'wex', WhitespaceThrowableProxyConverter

// See http://logback.qos.ch/manual/groovy.html for details on configuration
appender('STDOUT', ConsoleAppender) {
    encoder(PatternLayoutEncoder) {
        charset = Charset.forName('UTF-8')

        pattern =
                '%clr(%d{yyyy-MM-dd HH:mm:ss.SSS}){faint} ' + // Date
                        '%clr(%5p) ' + // Log level
                        '%clr(---){faint} %clr([%15.15t]){faint} ' + // Thread
                        '%clr(%-40.40logger{39}){cyan} %clr(:){faint} ' + // Logger
                        '%m%n%wex' // Message
    }
}

def targetDir = BuildSettings.TARGET_DIR
if (Environment.isDevelopmentMode() && targetDir != null) {
    targetDir = "C:/dev/workspace/grails"
    appender("FULL_STACKTRACE", FileAppender) {
        file = "${targetDir}/tamere.log"
        append = true
        encoder(PatternLayoutEncoder) {
            pattern = "%level %logger - %msg%n"
        }
    }
    logger "tamere", DEBUG
    //Spring Security Plugin Logging
    logger 'org.springframework.security', ERROR, ['STDOUT'], false
    logger 'grails.plugin.springsecurity', ERROR, ['STDOUT'], false
}
if (Environment.getCurrent() == Environment.PRODUCTION) {
    targetDir = "/usr/local/tomcat/logs"
    appender("ROLLING", RollingFileAppender) {
        encoder(PatternLayoutEncoder) {
            pattern = "%d{dd.MM.yyyy HH:mm:ss.SSS} - %level %logger - %msg%n"
        }
        rollingPolicy(TimeBasedRollingPolicy) {
            fileNamePattern = "${targetDir}/ch.tamere-%d{yyyy-MM-dd}.log"
            maxHistory = 180
            totalSizeCap = "100MB"
        }
    }
    logger "StackTrace", ERROR, ['ROLLING'], false
    logger "tamere", INFO, ['ROLLING'], false

    //Spring Security Plugin
    logger 'org.springframework.security', ERROR, ['ROLLING'], false
    logger 'grails.plugin.springsecurity', ERROR, ['ROLLING'], false
}
root(ERROR, ['STDOUT'])
