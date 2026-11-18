#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${API_BASE_URL:-}" ]]; then
  echo "Set API_BASE_URL to the deployed Next.js backend URL in Vercel." >&2
  exit 1
fi

if ! command -v flutter >/dev/null 2>&1; then
  flutter_dir="${HOME}/flutter"
  if [[ ! -x "${flutter_dir}/bin/flutter" ]]; then
    git clone --depth 1 --branch stable https://github.com/flutter/flutter.git "${flutter_dir}"
  fi
  export PATH="${flutter_dir}/bin:${PATH}"
fi

flutter config --no-analytics
flutter precache --web
flutter pub get
flutter build web --release --dart-define="API_BASE_URL=${API_BASE_URL}"