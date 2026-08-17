cask "reviewpad" do
  version "0.7.2"
  sha256 "17ba0f611ac16ea7c08b4f14be62a770ae4c8dd308411f2fc3c9a5986b777cd9"

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
