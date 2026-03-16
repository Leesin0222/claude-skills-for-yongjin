# Claude Global Config

## Available Skills

- **tech-spec** (`~/.claude/skills/tech-spec/SKILL.md`)
  PRD, 기획서, 텍스트 설명, 코드를 입력받아 뱅크샐러드 포맷 기반 테크 스펙을 생성한다.
  프로젝트 `tech-specs/` 디렉토리에 .md 파일로 저장하고, 선택적으로 Notion에도 저장.

- **tech-spec-draft** (`~/.claude/skills/tech-spec-draft/SKILL.md`)
  기능 아이디어나 대략적인 기능 설명을 받아 일정 산정용 테크 스펙 초안을 생성한다.
  기획서/디자인이 나오기 전 단계에서 사용. 프로젝트 `tech-specs/` 디렉토리에 저장.

- **implement-draft** (`~/.claude/skills/implement-draft/SKILL.md`)
  기능 설명을 자연어로 입력하면 현재 프로젝트 코드베이스를 분석하고,
  기존 아키텍처/패턴에 맞춰 실제 동작하는 코드 초안을 생성한다.

## Slash Commands

### /tech-spec

호출 즉시 아래 순서로 실행한다:

1. 프로젝트 `.claude/CLAUDE.md`에서 코드 구조 정보를 읽는다.
2. 사용자에게 요구사항을 입력받는다:
   - 기능명
   - 구현할 내용 (텍스트, PRD 붙여넣기, 또는 "코드 읽어서 파악해줘" 모두 가능)
   - 참고할 코드 경로 (선택 — 없으면 프로젝트 전체에서 관련 코드 자동 탐색)
3. `~/.claude/skills/tech-spec/SKILL.md`를 읽고 테크 스펙을 생성한다.
4. 초안을 대화창에 먼저 보여준다.
5. 사용자 확인 후 프로젝트 `tech-specs/` 디렉토리에 .md 파일로 저장한다.
6. Notion 저장이 요청되면 `NOTION_TECHSPEC_PAGE_ID` 하위에 추가 저장한다.

### /tech-spec-draft

호출 즉시 아래 순서로 실행한다:

1. 프로젝트 `.claude/CLAUDE.md`에서 코드 구조 정보를 읽는다.
2. 사용자에게 기능 설명을 입력받는다:
   - 기능명
   - 기능 설명 (텍스트 — 윗분이 전달한 아이디어, 회의록 등)
   - 참고할 코드 경로 (선택)
3. `~/.claude/skills/tech-spec-draft/SKILL.md`를 읽고 일정 산정용 초안을 생성한다.
4. 초안을 대화창에 먼저 보여준다.
5. 사용자 확인 후 프로젝트 `tech-specs/` 디렉토리에 .md 파일로 저장한다.
6. Notion 저장이 요청되면 `NOTION_TECHSPEC_PAGE_ID` 하위에 추가 저장한다.

### /implement-draft

호출 즉시 아래 순서로 실행한다:

1. 프로젝트 `.claude/CLAUDE.md`에서 코드 구조 정보를 읽는다.
2. 사용자에게 요구사항을 입력받는다:
   - 기능명
   - 기능 설명 (자연어 — "이런 기능 만들어줘")
   - 참고할 코드 경로 (선택 — 없으면 자동 탐색)
3. `~/.claude/skills/implement-draft/SKILL.md`를 읽고 코드베이스를 분석한다.
4. 구현 계획(생성/수정할 파일 목록, 가정 사항)을 대화창에 먼저 보여준다.
5. 사용자 확인 후 코드를 생성/수정한다.
6. 결과 요약(생성된 파일, TODO 목록, 다음 단계)을 출력한다.
