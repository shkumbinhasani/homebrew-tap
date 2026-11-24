cask "openmusic" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "eb37c8c65f38ea10e7e7e8292c781505649b81bbdf0e530d140e98d335118a9d",
         intel: "306af2db5afe278fe80d06ee7cb5f570a52927eee547674a5a8625ee6a83baaf"

  url "https://github.com/shkumbinhasani/openmusic/releases/download/v#{version}/OpenMusic-#{version}-#{arch}.zip"
  name "OpenMusic"
  desc "Spotify Connect player"
  homepage "https://github.com/shkumbinhasani/openmusic"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "OpenMusic.app"

  uninstall quit: "io.openmusic.player"

  zap script: {
        executable:   "/usr/bin/security",
        args:         ["delete-generic-password", "-s", "openmusic.spotify", "-a", "refresh-token"],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Caches/OpenMusic",
        "~/Library/HTTPStorages/io.openmusic.player",
        "~/Library/Preferences/io.openmusic.player.plist",
        "~/Library/Saved Application State/io.openmusic.player.savedState",
      ]
end
