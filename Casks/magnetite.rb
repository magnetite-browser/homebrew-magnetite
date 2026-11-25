# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  version "0.0.19"

  on_arm do
    sha256 "08bf4596c573e23c6433bd7317b7c317adf34e2586350d340c7ccec4027e2cf2"

    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/Magnetite-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "241c768036798fb0793aeae2855ae3bc9b370e201e1db27f18789195414b4308"

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
