---
name: notebooklm-mcp-cli-setup
description: A skill to execute the setup script for cloning and installing the notebooklm-mcp-cli and its AI skills.
---

# NotebookLM MCP CLI Setup Skill

이 스킬은 `notebooklm-mcp-cli` 저장소를 클론하고, CLI를 설치하며, 지원하는 AI 어시스턴트용 스킬 가이드를 한 번에 자동으로 설정하는 `setup.sh` 스크립트를 실행하기 위한 지침서입니다.

## 1. 셋업 스크립트 실행 (Execute setup.sh)
제공되는 자동화 스크립트를 실행하여 모든 설치 및 초기 세팅 과정을 진행합니다. 스크립트 실행에는 시스템 환경에 맞게 `git` 과 `uv`가 필요하며(스크립트 내에서 가능할 경우 자동 설치 시도), 지원 가능한 AI 어시스턴트에 스킬 가이드도 자동 설치됩니다.

```bash
# 실행 권한 부여 후 스크립트 터미널 실행
chmod +x scripts/setup.sh
bash ./scripts/setup.sh
```

## 2. 수동 설치 확인 (Installation Verification)
스크립트 실행 후 `nlm` 명령어가 정상 작동하는지 확인합니다.
```bash
nlm --version
```

## 3. 인증 진행 (Authentication)
설치가 완료되면, 실제 NotebookLM 도구를 사용하기 위해 `nlm login` 명령어를 통해 구글 계정 인증 및 쿠키 추출을 진행해야 합니다. 
(이 과정은 대화형으로 진행되며 Chrome 창이 열립니다.)

```bash
nlm login
```

## 참고 사항
- 셋업 스크립트는 `cline`, `antigravity`, `openclaw`, `codex`, `opencode`, `claude-code`, `gemini-cli` 환경에서 각 AI 도구에 적합한 NotebookLM 스킬 가이드를 자동으로 덮어쓰거나 설치합니다.
- 추가적인 NotebookLM 명령어 및 인증 가이드는 원본 저장소의 문서를 참고하시기 바랍니다.
