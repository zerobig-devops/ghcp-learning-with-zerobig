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
