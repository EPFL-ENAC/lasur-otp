FROM eclipse-temurin:8-jre-noble

ENV JAVA_OPTS="-Xms2G -Xmx8G -XX:+UseG1GC"
ENV ROUTER="default"
ENV ROUTER_ALT=""

WORKDIR /opt/otp

# Download OTP
RUN wget https://repo1.maven.org/maven2/org/opentripplanner/otp/1.5.0/otp-1.5.0-shaded.jar -O otp.jar

# Copy entrypoint script
COPY entrypoint.sh /opt/otp/
RUN chmod +x entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["./entrypoint.sh"]
