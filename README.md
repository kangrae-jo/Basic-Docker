# Docker 명령어 가이드
 
## 1. 프로젝트 빌드

### Gradle 빌드

```bash
./gradlew bootJar
```

빌드 결과물 확인:

```bash
ls build/libs
# Basic-Docker-0.0.1-SNAPSHOT.jar
```

## 2. Docker 이미지 빌드

### 로컬 이미지 빌드

```bash
docker build -t basic-docker .
```

### 멀티 플랫폼 이미지 빌드 (권장)

```bash
# buildx 빌더 생성
docker buildx create --use

# linux/amd64, linux/arm64 모두 지원하는 이미지 빌드
docker buildx build --platform linux/amd64,linux/arm64 \
  -t kng0501/basic-docker:latest --push .
```

## 3. 이미지 확인

```bash
docker images
```

## 4. 컨테이너 실행

### 백그라운드로 실행

```bash
docker run -d -p 8080:8080 --name basic-docker-container basic-docker
```

옵션 설명:

- `-d`: 백그라운드 실행
- `-p 8080:8080`: 포트 매핑 (호스트:컨테이너)
- `--name`: 컨테이너 이름 지정

### 실행 중인 컨테이너 확인

```bash
docker ps
```

### 컨테이너 중지

```bash
docker stop basic-docker-container
```

## 5. Docker Hub에 푸시

### Docker Hub 로그인

```bash
docker login
```

### 이미지 태그 지정

```bash
docker tag basic-docker kng0501/basic-docker:latest
```

### 이미지 푸시

```bash
docker push kng0501/basic-docker:latest
```

## 6. Docker Hub에서 이미지 받기

### 다른 서버에서 이미지 다운로드

```bash
sudo docker pull kng0501/basic-docker:latest
```

### 다운로드한 이미지 실행

```bash
sudo docker run -d -p 8080:8080 kng0501/basic-docker:latest
```

## 트러블슈팅

### "no matching manifest for linux/amd64" 에러

멀티 플랫폼 빌드를 사용하여 amd64와 arm64를 모두 지원하는 이미지를 빌드하세요:

```bash
docker buildx build --platform linux/amd64,linux/arm64 \
  -t kng0501/basic-docker:latest --push .
```

### "no space left on device" 에러

Docker 불필요한 데이터 정리:

```bash
sudo docker system prune -a --volumes
```

### "Cannot connect to the Docker daemon" 에러

Docker Desktop을 실행하거나 Docker daemon을 시작하세요.
