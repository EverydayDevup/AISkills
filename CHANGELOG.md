# CHANGELOG

이 프로젝트의 모든 변경 사항은 이 파일에 기록됩니다.
새로운 스킬이 추가되거나 기존 스킬이 수정될 때 반드시 기록되어야 합니다.

## [1.1.0] - 2026-03-01

### Added
- **`.gitignore`**: macOS 시스템 파일(`.DS_Store`)과 AI 도구 개인 설정 폴더(`.gemini/`, `.claude/` 등)를 버전 관리에서 제외하도록 추가했습니다.

### Changed
- **`README.md`**: 사전 요구 사항(Prerequisites)과 빠른 시작(Quick Start) 섹션을 추가하고, 스킬 링크 URL을 `setup.sh`와 일치시켰습니다.
- **`01_setup_guide.sh`**: 러시아어로 깨진 오타(`Гугл`)를 올바른 한글(`구글`)로 수정했습니다.

## [1.0.0] - 2026-03-01


### Added
- **Workspace Rules**: [.cursorrules](./.cursorrules)를 통해 스킬 추가/수정 시 문서(`README.md`, `CHANGELOG.md`) 업데이트를 강제하는 규칙을 도입했습니다.
- **Initial Documentation**: 프로젝트 전체 개요를 담은 [README.md](./README.md)와 변경 이력 관리를 위한 [CHANGELOG.md](./CHANGELOG.md)를 초기화했습니다.
