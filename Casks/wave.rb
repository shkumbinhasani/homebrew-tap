cask "wave" do
  version "0.8.3"
  sha256 "05d952403bdb4ca074f611d5a861996a5827938cb697ffa64f6bf67b6f2ead29"

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
