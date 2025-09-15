FROM eclipse-temurin:8-jre-noble

ENV JAVA_OPTS="-Xms2G -Xmx8G -XX:+UseG1GC"

WORKDIR /opt/otp

# Download OTP
RUN wget https://repo1.maven.org/maven2/org/opentripplanner/otp/1.5.0/otp-1.5.0-shaded.jar -O otp.jar

EXPOSE 8080
ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar otp.jar --server --port 8080 --analyst --graphs graphs $@", "--"]
CMD ["--router", "default"]
