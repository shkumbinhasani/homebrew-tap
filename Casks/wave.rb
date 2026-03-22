cask "wave" do
  version "0.1.0"
  sha256 "bfca2d5970f8b1e4b9af36a122c26d7bad31506a40cfb73542419ec845efe5f9"

  url "https://github.com/shkumbinhasani/wave/releases/download/v#{version}/wave-macos-arm64.zip"
  name "Wave Terminal"
  desc "macOS terminal emulator built with SwiftUI and libghostty"
  homepage "https://github.com/shkumbinhasani/wave"

  depends_on macos: ">= :sonoma"

  app "wave.app"

  zap trash: [
    "~/Library/Preferences/com.wave.terminal.plist",
    "~/Library/Caches/com.wave.terminal",
  ]
end
