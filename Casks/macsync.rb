cask "macsync" do
  version "0.8.10"
  sha256 "072f82226727b8582cbb09dbbfbbdbc7b199c4b2c53e6ac901b38b196a5bf1b0"

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
  depends_on macos: :ventura

  app "MacSync.app"
  binary "#{appdir}/MacSync.app/Contents/Helpers/macsync"

  # No quit step: a running MacSync notices when its app is replaced and restarts itself into
  # the new version, so installs and upgrades work whether it's open or not.

  zap trash: [
    "~/Library/Application Support/MacSync",
    "~/Library/Preferences/com.onlymehdi.macsync.plist",
  ]
end
