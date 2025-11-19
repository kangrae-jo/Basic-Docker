# 1. 자바 21 런타임이 있는 이미지 사용
FROM eclipse-temurin:21-jdk-alpine

# 2. 컨테이너 안에서 작업할 디렉터리
WORKDIR /app

# 3. 빌드된 jar 파일을 컨테이너 안으로 복사
COPY build/libs/Basic-Docker-0.0.1-SNAPSHOT.jar app.jar

# 4. 포트
EXPOSE 8080

# 5. 컨테이너 시작 시 실행할 명령
ENTRYPOINT ["java", "-jar", "app.jar"]