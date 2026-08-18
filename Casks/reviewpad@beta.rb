cask "reviewpad@beta" do
  version "0.8.0-rc.4"
  sha256 "11c241706fe5717f87476add963ba44670dbc7e14ecebea5dec0c65ffdb2db36"

  url "https://github.com/shkumbinhasani/reviewpad/releases/download/v#{version}/ReviewPad-macos-universal.zip"
  name "ReviewPad (beta)"
  desc "Local-first Git review app built on GPUI"
  homepage "https://github.com/shkumbinhasani/reviewpad"

  conflicts_with cask: "shkumbinhasani/tap/reviewpad"
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
