FROM eclipse-temurin:17-jre-jammy

ADD --chmod=0444 \
    https://github.com/alibaba/Sentinel/releases/download/1.8.6/sentinel-dashboard-1.8.6.jar \
    /opt/sentinel-dashboard.jar

EXPOSE 8060

ENTRYPOINT ["java", "-Xms128m", "-Xmx256m", "-Dserver.port=8060", "-Dcsp.sentinel.dashboard.server=localhost:8060", "-Dproject.name=sentinel-dashboard", "-jar", "/opt/sentinel-dashboard.jar"]
