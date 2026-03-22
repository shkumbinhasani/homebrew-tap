cask "wave" do
  version "0.1.3"
  sha256 "ef66be9c55e91b13a34e60e3ce6a8c4e792d357baad3bf3402f21e45ed271339"

  url "https://github.com/shkumbinhasani/wave/releases/download/v#{version}/wave-macos-arm64.zip"
  name "Wave Terminal"
  desc "macOS terminal emulator built with SwiftUI and libghostty"
  homepage "https://github.com/shkumbinhasani/wave"

  depends_on macos: ">= :sonoma"

  app "wave.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/wave.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.wave.terminal.plist",
    "~/Library/Caches/com.wave.terminal",
  ]
end
