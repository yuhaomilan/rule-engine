<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    
    <jmxConfigurator />
    <substitutionProperty name="default_pattern" value="%date %-5level %logger{30} - %msg%n" />

    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoding>UTF-8</encoding>
        <layout class="ch.qos.logback.classic.PatternLayout">
            <pattern>${default_pattern}</pattern>
        </layout>
    </appender>

    <appender name="fileAppender" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <encoding>UTF-8</encoding>
        <file>/opt/logs/tomcat/ruleengine-ws.log</file>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>/opt/logs/tomcat/ruleengine-ws.log.%d{yyyy-MM-dd}</fileNamePattern>
            <maxHistory>2</maxHistory>
        </rollingPolicy>
        <layout class="ch.qos.logback.classic.PatternLayout">
            <pattern>${default_pattern}</pattern>
        </layout>
    </appender>
    
    <!-- Output to central logging -->
    <appender name="CLoggingAppender" class="com.ctrip.framework.clogging.agent.appender.CLoggingAppender">
        <appId>100000558</appId>
        <serverIp>{$CLogging.serverIp}</serverIp>
        <serverPort>{$CLogging.serverPort}</serverPort>
    </appender>
    
    <logger name="com.ctrip.infosec.rule" additivity="false">
        <level value="INFO" />
        <appender-ref ref="fileAppender" />
        <appender-ref ref="CLoggingAppender" />
    </logger>
    <logger name="com.ctrip.infosec.configs" additivity="false">
        <level value="INFO" />
        <appender-ref ref="fileAppender" />
        <appender-ref ref="CLoggingAppender" />
    </logger>
    <logger name="com.ctrip.infosec.sars.monitor" additivity="false">
        <level value="WARN" />
        <appender-ref ref="fileAppender" />
    </logger>
    
    <logger name="org.springframework">
        <level value="ERROR" />
    </logger>
    
    <logger name="org.mybatis">
        <level value="WARN" />
    </logger>

    <logger name="java.sql">
        <level value="WARN" />
    </logger>
    
    <logger name="org.apache.commons">
        <level value="ERROR" />
    </logger>
    
    <logger name="org.eclipse.jetty">
        <level value="INFO" />
    </logger>

    <root level="WARN">
        <appender-ref ref="STDOUT" />
        <appender-ref ref="fileAppender" />
        <appender-ref ref="CLoggingAppender" />
    </root>
    
</configuration>
