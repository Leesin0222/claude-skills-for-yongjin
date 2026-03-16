# claude-skills install script for Windows
# Run with: .\install.ps1

$ErrorActionPreference = "Stop"

$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ClaudeDir = "$env:USERPROFILE\.claude"

Write-Host "🚀 claude-skills 설치 시작..." -ForegroundColor Cyan

# ~/.claude 디렉토리 생성
New-Item -ItemType Directory -Force -Path "$ClaudeDir\skills" | Out-Null

# Skills 복사
Write-Host "📂 Skills 복사 중..." -ForegroundColor Yellow
Copy-Item -Recurse -Force "$RepoDir\skills\*" "$ClaudeDir\skills\"

# CLAUDE.md 처리
$claudeMdPath = "$ClaudeDir\CLAUDE.md"
$sourceMdPath = "$RepoDir\CLAUDE.md"

if (Test-Path $claudeMdPath) {
  Write-Host "⚠️  ~/.claude/CLAUDE.md 가 이미 존재합니다." -ForegroundColor Yellow
  Write-Host "   기존 파일에 내용을 추가할까요?"
  Write-Host "   [1] 추가 (append)  [2] 덮어쓰기 (overwrite)  [3] 건너뛰기 (skip)"
  $choice = Read-Host "선택"
  switch ($choice) {
    "1" {
      Add-Content -Path $claudeMdPath -Value ""
      Get-Content $sourceMdPath | Add-Content -Path $claudeMdPath
      Write-Host "✅ CLAUDE.md에 내용 추가 완료" -ForegroundColor Green
    }
    "2" {
      Copy-Item -Force $sourceMdPath $claudeMdPath
      Write-Host "✅ CLAUDE.md 덮어쓰기 완료" -ForegroundColor Green
    }
    "3" {
      Write-Host "⏭️  CLAUDE.md 건너뜀" -ForegroundColor Gray
    }
  }
} else {
  Copy-Item $sourceMdPath $claudeMdPath
  Write-Host "✅ CLAUDE.md 생성 완료" -ForegroundColor Green
}

Write-Host ""
Write-Host "✅ 설치 완료!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 다음 단계:" -ForegroundColor Cyan
Write-Host "   1. 프로젝트 루트에 .claude\CLAUDE.md 생성"
Write-Host "   2. NOTION_TECHSPEC_PAGE_ID 값 입력"
Write-Host "   3. Claude Code에서 /tech-spec 호출"
Write-Host ""
Write-Host "   템플릿: $RepoDir\templates\project-claude.md"
