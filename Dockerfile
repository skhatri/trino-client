FROM openjdk:17-jdk-alpine3.13

RUN apk update && apk --no-cache add curl && apk --update add less

RUN mkdir /opt/app && addgroup -g 1000 -S app && adduser -u 1000 -G app -S app \
&& chown -R app:app /opt/app

WORKDIR /opt/app
USER app

ENV PRESTO_PAGER=more

RUN curl -S -o trino https://repo1.maven.org/maven2/io/trino/trino-cli/353/trino-cli-353-executable.jar && chmod +x trino

CMD ["/bin/sh"]












