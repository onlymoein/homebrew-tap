cask "macsync" do
  version "0.7.0"
  sha256 "b8e29c7dfbc491f97493d9de581bf5b2c3109af3f545f5ca1219a1d52575a801"

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
