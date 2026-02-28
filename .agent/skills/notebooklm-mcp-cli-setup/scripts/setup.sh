#!/bin/bash

# 에러 발생 시 스크립트 실행 중단
set -e

REPO_URL="https://github.com/jacob-bd/notebooklm-mcp-cli.git"
REPO_DIR="notebooklm-mcp-cli"

echo "NotebookLM MCP CLI 저장소 클론 및 설치를 시작합니다..."

# 0. Git 설치 확인
echo "0. 필수 도구(Git) 설치 확인..."
if ! command -v git &> /dev/null; then
  echo "❌ Git이 설치되어 있지 않습니다. 시스템에 맞춰 Git을 설치합니다..."
  if command -v brew &> /dev/null; then
    brew install git
  elif command -v apt-get &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y git
  elif command -v yum &> /dev/null; then
    sudo yum install -y git
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS에서 brew가 없을 경우 Xcode Command Line Tools를 통해 설치 유도
    echo "macOS 환경입니다. Xcode Command Line Tools 설치 창이 뜨면 진행해주세요."
    xcode-select --install
    echo "설치가 완료된 후 스크립트를 다시 실행해주세요."
    exit 1
  else
    echo "지원하지 않는 OS/패키지 매니저 환경입니다. 수동으로 Git을 설치하신 후 다시 실행해주세요."
    exit 1
  fi
  echo "✅ Git 설치 과정이 완료되었습니다."
else
  echo "✅ Git이 설치되어 있습니다."
fi

# 1. 저장소 클론
if [ ! -d "$REPO_DIR" ]; then
  echo "✨ 저장소를 클론합니다: $REPO_URL"
  git clone "$REPO_URL"
else
  echo "✨ 저장소가 이미 존재합니다. 최신 버전으로 업데이트합니다."
  cd "$REPO_DIR"
  git pull
  cd ..
fi

# 2. CLI 설치
echo "🚀 uv를 사용하여 CLI를 설치합니다..."
cd "$REPO_DIR"
uv tool install .

echo "✅ CLI 설치가 성공적으로 완료되었습니다!"

# 3. AI 스킬 설치
echo "🤖 관련 AI 어시스턴트에 스킬을 설치합니다..."
# docs 기준 지원 가능한 범위: cline, antigravity, openclaw, codex, opencode, claude-code, gemini-cli
ASSISTANTS=("cline" "antigravity" "openclaw" "codex" "opencode" "claude-code" "gemini-cli")

for assistant in "${ASSISTANTS[@]}"; do
  echo "👉 $assistant 스킬 설치 중..."
  # 특정 어시스턴트가 없거나 오류가 발생하더라도 멈추지 않고 계속 진행
  # --level project 플래그를 사용하여 대화형 프롬프트 대기 방지
  # 이미 설치된 경우 덮어쓰기 확인("y")을 자동으로 입력하기 위해 yes 파이프라이닝 사용
  yes | nlm skill install "$assistant" --level project || true
done

echo "✅ 모든 필수 및 선택적 설치 과정이 완료되었습니다!"
