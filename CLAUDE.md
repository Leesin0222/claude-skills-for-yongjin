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

- **estimate-review** (`~/.claude/skills/estimate-review/SKILL.md`)
  기획/디자인 확정 후 기존 테크 스펙 초안과 비교하여 범위 변경을 분석하고 일정을 재산정한다.

- **project-analyze** (`~/.claude/skills/project-analyze/SKILL.md`)
  프로젝트 코드베이스를 전체 분석하여, 후임자나 새로 합류한 개발자가
  문서 하나만 읽고 바로 실무에 투입될 수 있는 프로젝트 분석 문서를 생성한다.

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

### /estimate-review

호출 즉시 아래 순서로 실행한다:

1. 프로젝트 `tech-specs/` 디렉토리에서 기존 초안(`draft-*.md`)을 탐색한다.
2. 사용자에게 입력받는다:
   - 확정된 기획/디자인 (PRD 붙여넣기, Figma URL, 또는 텍스트)
   - 비교할 초안 파일 (자동 탐색 또는 직접 지정)
3. `~/.claude/skills/estimate-review/SKILL.md`를 읽고 초안과 확정본을 비교 분석한다.
4. 일정 재산정 결과(가정 검증, 범위 변경, 공수 변동, 보고용 요약)를 대화창에 보여준다.
5. 사용자 확인 후 `tech-specs/review-{기능명}-{날짜}.md`로 저장한다.
6. Notion 저장이 요청되면 `NOTION_TECHSPEC_PAGE_ID` 하위에 추가 저장한다.

### /project-analyze

호출 즉시 아래 순서로 실행한다:

1. `~/.claude/skills/project-analyze/SKILL.md`를 읽고 분석 프로세스를 따른다.
2. 프로젝트 메타 파일, 디렉토리 구조, 핵심 코드를 자동 탐색한다.
3. 아키텍처, 비즈니스 로직, 컨벤션, 외부 연동, 배포 구조를 분석한다.
4. 프로젝트 분석 문서 초안을 대화창에 보여준다.
5. 사용자 확인 후 프로젝트 루트에 `PROJECT-ANALYSIS.md`로 저장한다.
