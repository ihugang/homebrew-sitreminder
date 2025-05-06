#!/bin/bash

set -e

VERSION="1.0.0"
DMG_PATH="SitReminder.dmg"
TAP_REPO_DIR="../homebrew-sitreminder"
CASK_NAME="sitreminder"
CASK_FILE="$TAP_REPO_DIR/Casks/$CASK_NAME.rb"
GITHUB_REPO="https://github.com/ihugang/sitreminder"

if [ ! -f "$DMG_PATH" ]; then
  echo "❌ DMG file not found: $DMG_PATH"
  exit 1
fi

SHA=$(shasum -a 256 "$DMG_PATH" | awk '{print $1}')
echo "✅ SHA256: $SHA"

mkdir -p "$TAP_REPO_DIR/Casks"

cat > "$CASK_FILE" <<EOF
cask "$CASK_NAME" do
  version "$VERSION"
  sha256 "$SHA"

  url "$GITHUB_REPO/releases/download/v\#{version}/SitReminder.dmg"
  name "SitReminder"
  desc "Menu bar reminder app for programmers to stand up and move"
  homepage "$GITHUB_REPO"

  app "SitReminder.app"

  zap trash: [
    "~/Library/Preferences/com.ihugang.SitReminder.plist",
    "~/Library/Application Support/SitReminder",
  ]
end
EOF

cd "$TAP_REPO_DIR"
git add "Casks/$CASK_NAME.rb"
git commit -m "Update $CASK_NAME to v$VERSION"
git push

echo "🚀 Pushed to $TAP_REPO_DIR"