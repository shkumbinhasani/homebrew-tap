cask "reviewpad" do
  version "0.6.0"
  sha256 "f6bffcd8fdc99bdfe3fa1f945d7572a964cfb7e50c69beb3d4e71f39c8476953"

  url "https://github.com/shkumbinhasani/reviewpad/releases/download/v#{version}/ReviewPad-macos-universal.zip"
  name "ReviewPad"
  desc "Local-first Git review app built on GPUI"
  homepage "https://github.com/shkumbinhasani/reviewpad"

  depends_on macos: :monterey

  app "ReviewPad.app"
  binary "#{appdir}/ReviewPad.app/Contents/MacOS/reviewpad"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ReviewPad.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/dev.reviewpad.ReviewPad",
    "~/Library/Saved Application State/dev.reviewpad.ReviewPad.savedState",
  ]
end
