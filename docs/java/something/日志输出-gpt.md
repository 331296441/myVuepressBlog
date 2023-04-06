# log4j2.xml


以下是一个符合要求的`log4j2.xml`文件的示例：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN">
  <Appenders>
    <RollingFile name="businessLog" fileName="./logs/business.log"
                 filePattern="./logs/business.log.%d{yyyyMMddHH}">
      <PatternLayout>
        <Pattern>[%p][%d{yyyy-MM-dd'T'HH:mm:ss.SSS}][%F:%L] %dg%pm%n</Pattern>
      </PatternLayout>
      <Policies>
        <TimeBasedTriggeringPolicy interval="1" modulate="true"/>
      </Policies>
    </RollingFile>
    <RollingFile name="errorLog" fileName="./logs/error.log"
                 filePattern="./logs/error.log.%d{yyyyMMddHH}">
      <PatternLayout>
        <Pattern>[%p][%d{yyyy-MM-dd'T'HH:mm:ss.SSS}][%F:%L] %dg%pm%n</Pattern>
      </PatternLayout>
      <Filters>
        <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"/>
      </Filters>
      <Policies>
        <TimeBasedTriggeringPolicy interval="1" modulate="true"/>
      </Policies>
    </RollingFile>
    <RollingFile name="debugLog" fileName="./logs/debug.log"
                 filePattern="./logs/debug.log.%d{yyyyMMddHH}">
      <PatternLayout>
        <Pattern>[%p][%d{yyyy-MM-dd'T'HH:mm:ss.SSS}][%F:%L] %dg%pm%n</Pattern>
      </PatternLayout>
      <Filters>
        <ThresholdFilter level="debug" onMatch="ACCEPT" onMismatch="DENY"/>
      </Filters>
      <Policies>
        <TimeBasedTriggeringPolicy interval="1" modulate="true"/>
      </Policies>
    </RollingFile>
  </Appenders>
  <Loggers>
    <Root level="info">
      <AppenderRef ref="businessLog"/>
      <AppenderRef ref="errorLog"/>
    </Root>
    <Logger name="com.example" level="debug" additivity="false">
      <AppenderRef ref="debugLog"/>
    </Logger>
  </Loggers>
</Configuration>
```

该配置文件定义了三个`RollingFile`类型的日志输出器，分别对应业务日志、错误日志和调试日志。其中，每个日志输出器的日志输出格式为`[%p][%d{yyyy-MM-dd'T'HH:mm:ss.SSS}][%F:%L] %dg%pm%n`，其中：

- `%p`：输出日志级别。
- `%d{yyyy-MM-dd'T'HH:mm:ss.SSS}`：输出日志时间，格式为`yyyy-MM-dd'T'HH:mm:ss.SSS`。
- `%F:%L`：输出日志所在的Java源文件名和行号。
- `%d`：输出调试信息。
- `%g`：输出线程组信息。
- `%pm`：输出日志消息。
- `%n`：输出换行符。

您可以将该配置文件保存为`log4j2.xml`，并将其放置在您的应用程序的类路径下，以便使用Log4j 2框架记录日志。