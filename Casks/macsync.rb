cask "macsync" do
  version "0.8.4"
  sha256 "ea69bc1d0635919fbcc64a8d9332557ff700ab61f3c5d84f28c0c496f0ca7e2e"

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
