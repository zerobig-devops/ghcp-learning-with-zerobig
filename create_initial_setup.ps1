# create_initial_setup.ps1
# 실행: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\create_initial_setup.ps1

# 디렉터리 생성
$dirs = @(
  "docs",
  "examples\01-hello-world",
  "examples\02-azure-function",
  "examples\03-power-apps-integration",
  "examples\04-chatbot",
  "examples\05-data-processing",
  "exercises\exercise-1",
  "exercises\exercise-2",
  "exercises\exercise-3",
  "exercises\solutions",
  "resources",
  ".github\workflows"
)
foreach($d in $dirs){ New-Item -ItemType Directory -Path $d -Force | Out-Null }

# 파일 작성 함수
function Write-File([string]$path, [string]$content){
  $dir = Split-Path $path
  if(!(Test-Path $dir) -and $dir -ne ""){ New-Item -ItemType Directory -Path $dir -Force | Out-Null }
  $content | Out-File -FilePath $path -Encoding utf8
  Write-Host "Wrote $path"
}

# LICENSE
Write-File "LICENSE" @'
MIT License

Copyright (c) 2026 zerobig-devops

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
'@

# GETTING_STARTED.md
Write-File "GETTING_STARTED.md" @'
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
'@

# docs
Write-File "docs\01-copilot-basics.md" @'
# Copilot 기초 (한국어)

이 문서는 Copilot의 핵심 기능과 초보자가 알아야 할 사용 팁을 설명합니다.

목차
- Copilot이란?
- 제안 수락/거부 방법
- 프롬프트 작성 요령
- 안전 및 보안 고려사항

Copilot이란?
- GitHub Copilot은 AI 기반 코드 보조 도구로, 주석이나 함수 시그니처 등을 바탕으로 코드를 제안합니다.

프롬프트 작성 요령
- 요구사항을 간결하게 작성합니다.
- 예시 입력과 기대출력을 제공하면 더 정확한 제안이 나옵니다.

보안 고려사항
- 민감한 정보(시크릿 키, 비밀번호)를 코드에 직접 넣지 마세요.
- 제안된 코드는 항상 검토하고 테스트하세요.
'@

Write-File "docs\02-azure-integration.md" @'
# Azure 통합 가이드 (한국어)

이 문서에서는 Copilot을 사용해 Azure 서비스(Azure Functions, Logic Apps, Power Platform 등)와 연동하는 기본 흐름을 설명합니다.

주요 내용
- Azure Function 스켈레톤 생성
- Logic Apps / Power Automate 워크플로우 설명
- 배포 안내 (Azure CLI 간단 예시)

배포 예시 (az CLI)
- 로그인: az login
- 리소스 그룹 생성: az group create --name my-rg --location koreacentral
- Function App 배포: az functionapp create --resource-group my-rg --consumption-plan-location koreacentral --name my-function-app --runtime node

참고: 실제 배포 전에는 Copilot이 생성한 코드의 보안/입력 검증을 반드시 확인하세요.
'@

Write-File "docs\03-citizen-developer-guide.md" @'
# 시민개발자 가이드 (한국어)

이 문서는 코드에 익숙하지 않은 시민개발자를 위한 Copilot 사용 사례와 실무 팁을 제공합니다.

핵심 포인트
- Low-code/No-code와 Copilot 결합: Power Apps, Power Automate와의 연동
- 작은 자동화부터 시작: 일정 자동화, 이메일 템플릿 생성 등
- 템플릿 활용: Copilot에게 템플릿 문구를 만들어 달라고 요청

사례
- Power Automate를 이용해 SharePoint에 파일이 추가되면 승인 요청 이메일 자동 발송
- Copilot으로 이메일 템플릿 생성 및 수정
'@

Write-File "docs\04-faq.md" @'
# 자주 묻는 질문 (FAQ)

Q: Copilot이 생성한 코드를 그대로 사용해도 되나요?
A: 기본적으로 제안된 코드는 반드시 검토하고 테스트해야 합니다. 보안, 입력 검증, 라이선스 문제 등을 확인하세요.

Q: Copilot은 어떤 언어를 지원하나요?
A: 대부분의 일반적인 프로그래밍 언어를 지원합니다. 초보자용 문서는 주로 JavaScript/Python 예시를 포함합니다.

Q: 조직에서 Copilot을 사용하려면?
A: 조직 관리자가 Copilot 라이선스와 접근 권한을 설정해야 합니다.
'@

# examples
Write-File "examples\01-hello-world\README.md" @'
# 예제 01 — Hello World (스켈레톤 + 가이드)

목표: Copilot으로 간단한 안내 문구/스크립트를 생성해보며 제안 수락·수정 흐름을 익힌다.

따라하기:
1. 새 파일 hello.md 생성
2. 첫 줄에 목표를 한글로 작성: "한글로 간단한 인사 메시지와 사용 방법을 만들어줘"
3. Copilot의 제안을 살펴보고 적절히 수락/수정

해설:
- 제안된 결과물의 구조(제목, 본문, 사용법)와 간단한 편집 팁 제공
'@

Write-File "examples\02-azure-function\README.md" @'
# 예제 02 — Azure Function 스켈레톤 (스켈레톤 + 가이드)

목표: Azure Function의 기본 구조(HTTP 트리거) 스켈레톤을 Copilot 도움으로 생성하고 배포 준비를 이해한다.

따라하기:
1. `func init` 또는 포털에서 Function 생성(간략 가이드 포함)
2. `index.js` 또는 `__init__.py`에 주석으로 요구사항 작성:
   - "HTTP POST를 받아 JSON 응답으로 처리하는 스켈레톤 코드를 만들어줘"
3. Copilot 제안 수락 후 로컬에서 테스트(예: func start)
4. 간단한 배포 방법 안내(az cli 또는 포털)

해설:
- 트리거, 바인딩, 응답 처리 구조 설명
- 보안(입력 검증, 인증) 기본 주의사항
'@

Write-File "examples\03-power-apps-integration\README.md" @'
# 예제 03 — Power Apps 통합 (스켈레톤 + 가이드)

목표: Power Apps와 Copilot을 활용해 간단한 폼과 연결된 데이터 처리 흐름을 설계한다.

따라하기:
1. Power Apps에서 새 캔버스 앱 생성
2. 폼 필드와 저장 버튼을 디자인
3. 저장 이벤트에 대해 Power Automate 흐름을 생성하고, Copilot에게 흐름 요약/설명 문구를 요청

해설:
- Data source 연결, 폼 유효성 검사, 간단한 자동화 팁
'@

Write-File "examples\04-chatbot\README.md" @'
# 예제 04 — 간단 챗봇 (스켈레톤 + 가이드)

목표: Azure Bot Service 또는 간단한 QnA 기반 챗봇의 구조를 이해하고 기본 스켈레톤을 생성한다.

따라하기:
1. QnA Maker 또는 Azure Bot Service 시작 가이드
2. 간단한 질문-응답 세트를 준비하고 Copilot으로 응답 템플릿 생성
3. 로컬에서 테스트하거나 Azure에 배포

해설:
- 인텐트 분리, 기본 보안, 유지보수 팁
'@

Write-File "examples\05-data-processing\README.md" @'
# 예제 05 — 데이터 처리 (스켈레톤 + 가이드)

목표: Logic Apps 또는 Power Automate를 사용해 간단한 데이터 처리(파일 변환, 간단한 ETL) 플로우를 만들기 위한 스켈레톤과 설명을 제공한다.

따라하기:
1. 데이터 소스(예: Blob Storage) 연결
2. 자동화 트리거 설정(파일 업로드 시)
3. Copilot에게 변환 로직 설명을 작성해달라고 요청

해설:
- 에러 처리, 재시도 정책, 모니터링 팁
'@

# exercises
Write-File "exercises\exercise-1\README.md" @'
# Exercise 1 — 기본 Azure Function 만들기

설명: Copilot을 사용해 HTTP 트리거 함수의 스켈레톤을 만들고 로컬에서 호출해보기

요구사항:
- HTTP POST로 JSON을 받고 간단한 필드(name)를 echo하는 응답 반환
- 에러 입력 시 400 반환

체크리스트:
- [ ] 파일 생성 및 주석 작성
- [ ] Copilot 제안 수락 후 로컬 테스트
- [ ] 결과 스크린샷 또는 curl 결과를 exercises/solutions에 제출
'@

Write-File "exercises\exercise-2\README.md" @'
# Exercise 2 — Azure 연결 테스트 (스켈레톤)

설명: Copilot을 사용해 로컬에서 간단한 Azure 리소스 연결 스텁을 만들고 테스트하는 흐름을 익힌다.

요구사항:
- az cli 명령 예시를 작성하고 Copilot으로 설명 문구 생성
- 실제 배포는 선택사항

체크리스트:
- [ ] az login 및 리소스 그룹 생성 명령 실행 연습
- [ ] Copilot 제안으로 배포 설명서 초안 작성
'@

Write-File "exercises\exercise-3\README.md" @'
# Exercise 3 — 간단 자동화 흐름 만들기

설명: Power Automate 또는 Logic Apps를 사용해 파일 업로드 시 알림을 보내는 간단 자동화 흐름을 설계한다.

요구사항:
- 트리거, 액션, 오류 처리 간단 설명
- Copilot에게 설명 및 샘플 문구 생성 요청

체크리스트:
- [ ] 흐름 설계 문서화
- [ ] Copilot 제안으로 설명 개선
'@

Write-File "exercises\solutions\README.md" @'
# Solutions

이 디렉터리는 연습 문제의 예시 풀이 및 예상 출력 결과를 제공합니다. (학생 제출물 대체)

예: exercise-1 솔루션에 curl 예시와 기대 응답을 포함하세요.
'@

# resources
Write-File "resources\useful-links.md" @'
# Useful Links

- GitHub Copilot: https://github.com/features/copilot
- VS Code: https://code.visualstudio.com/
- Azure Functions: https://learn.microsoft.com/azure/azure-functions/
- Power Platform: https://learn.microsoft.com/power-platform/
'@

Write-File "resources\glossary.md" @'
# Glossary (용어 설명)

- Copilot: GitHub의 AI 기반 코드 보조 도구
- Azure Function: 서버리스 함수 서비스
- Power Apps: Microsoft의 로우코드 앱 플랫폼
'@

Write-File "resources\troubleshooting.md" @'
# Troubleshooting

- Copilot 권한 문제: GitHub 계정 로그인 상태 및 조직 정책 확인
- VS Code 확장 문제: 확장 재설치 또는 VS Code 재시작
- Azure 배포 문제: az cli 로그인 및 권한 확인
'@

# CI workflow
Write-File ".github\workflows\ci.yml" @'
name: Docs & Lint CI

on:
  push:
    branches: [ main, initial-setup ]
  pull_request:
    branches: [ main ]

jobs:
  markdown-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: "18"
      - name: Install markdownlint
        run: npm install -g markdownlint-cli
      - name: Run markdownlint
        run: markdownlint "**/*.md"

  linkcheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install linkchecker
        run: sudo apt-get update && sudo apt-get install -y linkchecker
      - name: Check links in docs
        run: linkchecker --ignore-url=github.com --no-warnings docs || true
'@

# .gitignore
Write-File ".gitignore" @'
# macOS
.DS_Store

# Node
node_modules/
npm-debug.log

# Python
__pycache__/
*.pyc

# VS Code
.vscode/
'@

# git add, commit, push
git add .
git commit -m "chore: add initial docs, examples, exercises, CI on initial-setup branch" -q
# push to remote initial-setup
git push -u origin initial-setup
Write-Host "All done. Pushed to origin/initial-setup"