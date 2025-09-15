# GH-300

GH-300 수업 데모용 - .NET 8.0 API 클라이언트-서버 통신 예제

## 프로젝트 개요

이 프로젝트는 .NET 8.0을 사용한 간단한 클라이언트-서버 아키텍처를 보여주는 교육용 데모입니다. ASP.NET Core Minimal API와 콘솔 애플리케이션 간의 HTTP 통신을 학습할 수 있습니다.

## 프로젝트 구조

```
GH-300/
├── WebApi/              # ASP.NET Core Minimal API 서버
│   ├── Program.cs       # API 엔드포인트 및 구성
│   ├── wwwroot/         # 정적 웹 콘텐츠
│   │   └── health.html  # 대화형 API 테스트 인터페이스
│   ├── WebApi.csproj    # 프로젝트 파일
│   └── WebApi.http      # HTTP 요청 샘플
├── ConsoleApp/          # .NET 콘솔 애플리케이션 클라이언트
│   ├── Program.cs       # HTTP 클라이언트 구현
│   └── ConsoleApp.csproj # 프로젝트 파일
├── ARCHITECTURE.md      # 상세한 아키텍처 가이드
├── LICENSE
└── README.md
```

## 주요 기능

### WebApi (.NET 8.0 Minimal API)
- **`/cities`** - 10개 한국 도시 리스트를 JSON 배열로 반환
  - 반환 도시: Seoul, Busan, Incheon, Daegu, Daejeon, Gwangju, Suwon, Ulsan, Changwon, Goyang
- **`/weatherforecast`** - 5일간의 샘플 날씨 예보 데이터 반환
- **`/health`** - 단순 상태 확인 엔드포인트
- **Swagger UI** - 개발 환경에서 자동 API 문서화
- **정적 파일 서빙** - 웹 인터페이스 제공

### ConsoleApp (.NET 8.0 Console Application)
- WebApi의 `/cities` 엔드포인트 호출
- JSON 응답을 문자열 배열로 역직렬화
- 받은 도시 리스트를 콘솔에 한국어로 출력
- HTTP 클라이언트 사용법 및 오류 처리 예제

### 웹 인터페이스 (health.html)
- 실시간 API 상태 모니터링
- 각 엔드포인트를 테스트할 수 있는 대화형 버튼
- JSON 응답 형식화하여 표시
- 한국어 사용자 인터페이스

## 빠른 시작

### 1. WebApi 실행
```bash
cd WebApi
dotnet run
```
서버가 `http://localhost:5000`에서 시작됩니다.

### 2. ConsoleApp 실행
```bash
cd ConsoleApp
dotnet run
```

### 3. 웹 인터페이스 접속
브라우저에서 `http://localhost:5000/health.html`에 접속하여 대화형 테스트 인터페이스를 사용할 수 있습니다.

## API 엔드포인트 테스트

### cURL 사용:
```bash
# 도시 리스트 조회
curl http://localhost:5000/cities

# 날씨 예보 조회
curl http://localhost:5000/weatherforecast

# 상태 확인
curl http://localhost:5000/health
```

### Swagger UI:
개발 환경에서 `http://localhost:5000/swagger`에서 Swagger UI를 통해 API를 테스트할 수 있습니다.

## 학습 목표

이 프로젝트를 통해 다음을 학습할 수 있습니다:

- .NET 8.0 Minimal API 개발
- HTTP 클라이언트 프로그래밍
- JSON 직렬화/역직렬화
- 비동기 프로그래밍 (async/await)
- API 문서화 (Swagger/OpenAPI)
- 오류 처리 및 예외 관리
- 웹 인터페이스와 API 통합

## 기술 스택

- **.NET 8.0** - 최신 LTS 버전
- **ASP.NET Core Minimal APIs** - 경량 API 개발
- **System.Text.Json** - JSON 처리
- **Swagger/OpenAPI** - API 문서화
- **HTML/CSS/JavaScript** - 웹 인터페이스

## 추가 문서

자세한 아키텍처 설명과 기술적 세부사항은 [ARCHITECTURE.md](ARCHITECTURE.md)를 참고하세요.

