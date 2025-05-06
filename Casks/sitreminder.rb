cask "sitreminder" do
  version "1.01"
  sha256 "f6cc5b69a11df57739942af900a70cfbbb5e160a6f8a5f3384b92119bd3ad690"

  url "https://github.com/ihugang/sitreminder/releases/download/v#{version}/SitReminder.dmg"
  name "SitReminder"
  desc "Menu bar reminder app for programmers to stand up and move"
  homepage "https://github.com/ihugang/sitreminder"

  app "SitReminder.app"

  zap trash: [
    "~/Library/Preferences/com.ihugang.SitReminder.plist",
    "~/Library/Application Support/SitReminder",
  ]
end
