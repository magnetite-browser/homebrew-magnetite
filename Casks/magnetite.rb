# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  version "0.0.17"

  on_arm do
    sha256 "45323d56f30abaf1877201e310b0503d83448de43f8d588e2932c5a7a7c4d0fe"

    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/Magnetite-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "62e5e6153e8b9a8c13ae67191b44b05ac91d32e995df78b66c1ded0e4b4d95ee"

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
