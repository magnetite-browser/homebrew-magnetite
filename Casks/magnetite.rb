# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  version "0.0.13"

  on_arm do
    sha256 "bf6805979cca318c5b86cf95398100206dd73dc9a401237927b9828ee696175d"

    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/Magnetite-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "be6bd0a6ce1be09245b6cb960d84897a344517a1cc39677c3ee652087298741e"

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
