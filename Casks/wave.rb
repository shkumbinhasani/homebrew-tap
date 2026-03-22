cask "wave" do
  version "0.1.11"
  sha256 "86c773acb1ddde84cfb843c037fe0cd1b6806822ece6bfa32c5bb58cc93301b5"

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
