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
