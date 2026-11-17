# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  version "0.0.7"

  on_arm do
    sha256 "c78429986ccc7d25b02d69924233931ee141aa428559dbf1219d730afd6b193f"

    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/Magnetite-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "af0827da5775734aa8c2c8be93ab336a15198acf97f4214ee6c0bb4acec48eb1"

    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/Magnetite-#{version}-macos-x86_64.zip"
  end

  name "Magnetite"
  desc "Web browser with sidebar tabs, spaces and a command bar"
  homepage "https://magnetitebrowser.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself; brew upgrade leaves it alone.
  auto_updates true
  depends_on macos: :ventura

  app "Magnetite.app"

  zap trash: [
    "~/Library/Application Support/Magnetite",
    "~/Library/Caches/Magnetite",
    "~/Library/Caches/org.magnetitebrowser.magnetite",
    "~/Library/Preferences/org.magnetitebrowser.magnetite.plist",
    "~/Library/Saved Application State/org.magnetitebrowser.magnetite.savedState",
  ]
end
