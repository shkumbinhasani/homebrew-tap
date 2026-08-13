cask "reviewpad" do
  version "0.5.1"
  sha256 "ce022c560eb6ec849c914df7b9cf824355b9e4c2e4b89755c7d8c832d7150f63"

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
