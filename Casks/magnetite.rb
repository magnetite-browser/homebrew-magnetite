# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  version "0.0.8"

  on_arm do
    sha256 "a37f6e48c8f5d21a8dd84508ff8e6dc5dff0633307170456f9c5c8bb57c3f6d4"

    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/Magnetite-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "934424374d0e5b0509f085b262716762364cee77142bc273facc2af1659c1d56"

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
