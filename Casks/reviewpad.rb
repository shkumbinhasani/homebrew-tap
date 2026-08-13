cask "reviewpad" do
  version "0.5.0"
  sha256 "527488928e71ada845ce4d13a76b62849d0693bf7207d1bf29a1571fedca4172"

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
