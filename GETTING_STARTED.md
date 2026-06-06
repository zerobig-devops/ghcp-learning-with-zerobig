# 시작 가이드 — GitHub Copilot 빠른 시작 (한국어)

이 문서는 Azure 시스템 관리자(SA)와 시민개발자(코드에 익숙하지 않은 사용자)를 위해 Copilot을 빠르게 설치하고 사용해보는 단계별 안내입니다.

사전 준비
- GitHub 계정
- VS Code 권장 (또는 GitHub Codespaces/Visual Studio)
- 인터넷 연결

Copilot 설치 (VS Code 기준)
1. VS Code 확장 마켓플레이스에서 "GitHub Copilot"을 검색해 설치합니다.
2. 설치 후 확장에서 "Sign in to GitHub"를 클릭하여 로그인합니다.
3. 권한 요청이 나오면 조직 또는 개인 액세스를 승인합니다.

간단 사용 예시
- 새 파일을 열고 한글 주석으로 요구사항을 작성합니다 (예: "HTTP POST를 받아 name을 echo하는 Azure Function 스켈레톤을 만들어줘").
- Copilot 제안이 뜨면 Tab 또는 Enter로 수락하고, 필요하면 수정을 합니다.

초보자를 위한 실습 흐름
- 예제 1: Hello World (코드 최소) — examples/01-hello-world
- 예제 2: Azure Function 스켈레톤 — examples/02-azure-function
- 실습과 해답은 exercises/에 위치합니다.

팁
- 짧고 명확한 한글 지시문을 사용하세요: "Azure Function을 만들고 HTTP 트리거를 추가해줘"
- 단계별로 요구사항을 나눠서 요청하면 더 정확한 제안이 나옵니다.
