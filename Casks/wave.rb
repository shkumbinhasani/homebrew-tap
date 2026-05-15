cask "wave" do
  version "0.5.5"
  sha256 "d41c0a5c5a50024e146714570065389c8a8d691b3893ac3aeaccfa37831e84bc"

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
