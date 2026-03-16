# Claude Global Config

## Available Skills

- **tech-spec** (`~/.claude/skills/tech-spec/SKILL.md`)
  PRD, 기획서, 텍스트 설명, 코드를 입력받아 뱅크샐러드 포맷 기반 테크 스펙을 생성하고 Notion에 저장.

## Slash Commands

### /tech-spec

호출 즉시 아래 순서로 실행한다:

1. 프로젝트 `.claude/CLAUDE.md`에서 `NOTION_TECHSPEC_PAGE_ID`와 코드 구조 정보를 읽는다.
2. 사용자에게 요구사항을 입력받는다:
   - 기능명
   - 구현할 내용 (텍스트, PRD 붙여넣기, 또는 "코드 읽어서 파악해줘" 모두 가능)
   - 참고할 코드 경로 (선택 — 없으면 프로젝트 전체에서 관련 코드 자동 탐색)
3. `~/.claude/skills/tech-spec/SKILL.md`를 읽고 테크 스펙 초안을 생성한다.
4. 초안을 대화창에 먼저 보여준다.
5. 사용자 확인 후 Notion `NOTION_TECHSPEC_PAGE_ID` 하위에 저장한다.
