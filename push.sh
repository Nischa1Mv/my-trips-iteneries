#!/usr/bin/env bash
# Usage: ./push.sh <your-github-username> <repo-name>
set -e
USER="${1:?github username required}"
REPO="${2:-deomali-trip}"

git init -b main
git add -A
git commit -m "Trip notes for Vizag to Deomali"
git remote add origin "https://github.com/$USER/$REPO.git"
git push -u origin main

echo
echo "Now enable Pages: Settings > Pages > Source: Deploy from a branch > main > / (root)"
echo "Your page: https://$USER.github.io/$REPO/"
