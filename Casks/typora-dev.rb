cask "typora-dev" do
  version "1.6.0"
  sha256 "ba1eb27bbc0768a7fe1cdf44ac915cfd5b6c462b83cfaa42613222122d1b86ba"

  language "zh-Hans-CN" do # use official Chinese mirror
    url "https://download2.typoraio.cn/mac/Typora-#{version}-dev.dmg",
        verified: "typoraio.cn/"
  end
  language "en", default: true do
    url "https://download.typora.io/mac/Typora-#{version}-dev.dmg"
  end

  name "typora-dev"
  desc "Configurable document editor that supports Markdown"
  homepage "https://typora.io/"

  livecheck do
    url "https://typora.io/releases/dev_macos.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  conflicts_with cask: "typora"
  depends_on macos: ">= :catalina"

  app "Typora.app"

  zap trash: [
    "~/Library/Application Support/abnerworks.Typora",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/abnerworks.typora.sfl*",
    "~/Library/Application Support/Typora",
    "~/Library/Caches/abnerworks.Typora",
    "~/Library/Cookies/abnerworks.Typora.binarycookies",
    "~/Library/Preferences/abnerworks.Typora.plist",
    "~/Library/Saved Application State/abnerworks.Typora.savedState",
    "~/Library/WebKit/abnerworks.Typora",
  ]
end
