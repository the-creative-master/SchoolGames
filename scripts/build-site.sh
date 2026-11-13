#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SITE="${1:-$ROOT/_site}"
mkdir -p "$SITE"
cp "$ROOT/index.html" "$ROOT/hero.png" "$ROOT/arcade-controls.js" "$ROOT/sw.js" "$SITE/"
rm -rf "$SITE/games"
cp -R "$ROOT/games" "$SITE/games"
python3 - "$SITE" <<'PY'
import json,sys
from pathlib import Path
site=Path(sys.argv[1])
entries={
    f.relative_to(site).as_posix()
    for f in site.rglob('*')
    if f.is_file() and not any(part.startswith('.') for part in f.relative_to(site).parts)
}
entries.add('offline-manifest.json')
files=['./']+sorted(entries)
(site/'offline-manifest.json').write_text(json.dumps(files))
PY
touch "$SITE/.nojekyll"
echo "Built SchoolGames in $SITE"
