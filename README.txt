SCHOOLGAMES — GITHUB PAGES

In repository Settings > Pages, select Deploy from a branch, choose main and / (root), then save. The root .nojekyll file tells GitHub Pages to deploy the static files directly without running Jekyll. If a Pages deployment ever times out at syncing_files, merge or push a new commit to main rather than re-running the failed workflow job so GitHub Pages assigns a fresh deployment ID.

OFFLINE USE
After deploying, open the site online and click Save for offline. Wait for all files to save, then bookmark the page. You can reopen it offline in the same browser. Some games may still call external services. Storage quotas, eviction, or clearing browser data can remove cached files. If you saved an older SchoolGames version offline, save it again after updating. HTTPS or localhost is required.

LOCAL TESTING
For local testing, serve the extracted folder with a static server. For example, if Python is installed, run python -m http.server 8000 and open http://localhost:8000. Visitors to the GitHub Pages site do not need Python. Games open directly without an arcade iframe; use Exit Game to return.

GAME SOURCES
BitLife: https://github.com/ladanhhh/bitlife
Recoil, Speed King, Monster Match: https://github.com/Idoatelunch/rimon-fancade
Other game sources are linked on the site. Game rights belong to their respective owners.
