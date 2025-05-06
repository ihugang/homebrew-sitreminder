cask "sitreminder" do
  version "1.0.0"
  sha256 "568d69fe14cff4ab51cda900a37ae3c7b4600cdd81f98cf9a332a8d84eb14386"

  url "https://github.com/ihugang/sitreminder/releases/download/v\#{version}/SitReminder.dmg"
  name "SitReminder"
  desc "Menu bar reminder app for programmers to stand up and move"
  homepage "https://github.com/ihugang/sitreminder"

  app "SitReminder.app"

  zap trash: [
    "~/Library/Preferences/com.ihugang.SitReminder.plist",
    "~/Library/Application Support/SitReminder",
  ]
end
