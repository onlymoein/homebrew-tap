cask "macsync" do
  version "0.5.4"
  sha256 "b2cedc57ad723f0011fbb5d89369a09f4e328fb2f6069c3995b1bdea1426a34c"

  url "https://github.com/onlymoein/macsync/releases/download/v#{version}/MacSync-#{version}.zip"
  name "MacSync"
  desc "Sync your Dock, apps and settings across Macs through iCloud Drive"
  homepage "https://github.com/onlymoein/macsync"

  livecheck do
    url :url
    strategy :github_latest
  end

  # MacSync updates itself from GitHub releases (through `brew upgrade` when Homebrew installed it).
  auto_updates true
  depends_on macos: ">= :ventura"

  app "MacSync.app"
  binary "#{appdir}/MacSync.app/Contents/Helpers/macsync"

  zap trash: [
    "~/Library/Application Support/MacSync",
    "~/Library/Preferences/com.onlymehdi.macsync.plist",
  ]
end
