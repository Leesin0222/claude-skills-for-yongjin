#!/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "🚀 claude-skills 설치 시작..."

# ~/.claude 디렉토리 생성
mkdir -p "$CLAUDE_DIR/skills"

# Skills 복사
echo "📂 Skills 복사 중..."
cp -r "$REPO_DIR/skills/"* "$CLAUDE_DIR/skills/"

# CLAUDE.md 처리
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  echo "⚠️  ~/.claude/CLAUDE.md 가 이미 존재합니다."
  echo "   기존 파일에 내용을 추가할까요? (덮어쓰기하면 기존 설정이 사라집니다)"
  echo "   [1] 추가 (append)  [2] 덮어쓰기 (overwrite)  [3] 건너뛰기 (skip)"
  read -r choice
  case $choice in
    1)
      echo "" >> "$CLAUDE_DIR/CLAUDE.md"
      cat "$REPO_DIR/CLAUDE.md" >> "$CLAUDE_DIR/CLAUDE.md"
      echo "✅ CLAUDE.md에 내용 추가 완료"
      ;;
    2)
      cp "$REPO_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
      echo "✅ CLAUDE.md 덮어쓰기 완료"
      ;;
    3)
      echo "⏭️  CLAUDE.md 건너뜀"
      ;;
  esac
else
  cp "$REPO_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
  echo "✅ CLAUDE.md 생성 완료"
fi

echo ""
echo "✅ 설치 완료!"
echo ""
echo "📋 다음 단계:"
echo "   1. 프로젝트 루트에 .claude/CLAUDE.md 생성"
echo "   2. NOTION_TECHSPEC_PAGE_ID 값 입력"
echo "   3. Claude Code에서 /tech-spec 호출"
echo ""
echo "   템플릿: $REPO_DIR/templates/project-claude.md"
