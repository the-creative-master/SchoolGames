#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SITE="${1:-$ROOT/_site}"
mkdir -p "$SITE"
cp "$ROOT/index.html" "$ROOT/hero.png" "$ROOT/arcade-controls.js" "$ROOT/sw.js" "$SITE/"
cp -R "$ROOT/games" "$SITE/games"
python3 - "$SITE" <<'PY'
import json,sys
from pathlib import Path
site=Path(sys.argv[1]);files=['./']+sorted(f.relative_to(site).as_posix() for f in site.rglob('*') if f.is_file())+['offline-manifest.json']
(site/'offline-manifest.json').write_text(json.dumps(files))
PY
echo "Built SchoolGames in $SITE"
