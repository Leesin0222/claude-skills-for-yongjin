# claude-skills

Claude Code에서 사용하는 커스텀 Skills 모음.

## 포함된 Skills

| Skill | 설명 | 호출 |
|-------|------|------|
| **tech-spec-draft** | 기능 설명 → 일정 산정용 테크 스펙 초안 | `/tech-spec-draft` |
| **tech-spec** | PRD/코드/텍스트 → 상세 테크 스펙 | `/tech-spec` |

---

## 설치

### Mac / Linux

```bash
git clone https://github.com/{your-username}/claude-skills
cd claude-skills
chmod +x install.sh
./install.sh
```

### Windows

```powershell
git clone https://github.com/{your-username}/claude-skills
cd claude-skills
.\install.ps1
```

---

## 프로젝트 설정

새 프로젝트에서 tech-spec을 쓰려면 프로젝트 루트에 `.claude/CLAUDE.md`를 만들고 Notion 페이지 ID를 입력한다.

```bash
# Mac/Linux
mkdir -p .claude
cp ~/.claude/../{clone경로}/templates/project-claude.md .claude/CLAUDE.md

# 또는 직접 생성
mkdir -p .claude && cat > .claude/CLAUDE.md << 'EOF'
# Project Claude Config

## Project Info
- **프로젝트명**: my-project
- **기술 스택**: Next.js, TypeScript
- **주요 코드 경로**: src/

## Notion
NOTION_TECHSPEC_PAGE_ID=your-notion-page-id-here
EOF
```

---

## 사용법

### 기획 전 — 일정 산정용 초안

```
# Claude Code를 프로젝트 루트에서 열고
/tech-spec-draft

# 이후 프롬프트에 입력:
# - 기능명
# - 기능 설명 (윗분이 전달한 아이디어, 회의 내용 등)
# - 참고 코드 경로 (선택)
#
# → tech-specs/draft-{기능명}-{날짜}.md 로 저장됨
```

### 기획 확정 후 — 상세 테크 스펙

```
# Claude Code를 프로젝트 루트에서 열고
/tech-spec

# 이후 프롬프트에 입력:
# - 기능명
# - 요구사항 (텍스트 / PRD 붙여넣기 / "코드 읽어서 파악해줘")
# - 참고 코드 경로 (선택)
#
# → tech-specs/{기능명}-{날짜}.md 로 저장됨
```

---

## 새 컴퓨터 세팅 체크리스트

- [ ] `git clone` + `install.sh` (또는 `install.ps1`) 실행
- [ ] 각 프로젝트 `.claude/CLAUDE.md` 생성 (templates/project-claude.md 참고)
- [ ] (선택) Claude Code에 Notion MCP 연결 + `NOTION_TECHSPEC_PAGE_ID` 입력
