# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.0.19"
  sha256 arm:          "08bf4596c573e23c6433bd7317b7c317adf34e2586350d340c7ccec4027e2cf2",
         intel:        "241c768036798fb0793aeae2855ae3bc9b370e201e1db27f18789195414b4308",
         arm64_linux:  "10fb9c4cbda5c076108489d0be85d504649521045b085b66e83e70e5938a7fe0",
         x86_64_linux: "5d2e1b3b1ca25235c7f9a0048856e0740542591aacadb1587ce521d16b118f9a"

  on_macos do
    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/Magnetite-#{version}-macos-#{arch}.zip"

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
  on_linux do
    url "https://github.com/magnetite-browser/magnetite/releases/download/v#{version}/magnetite-#{version}-linux-#{arch}.AppImage"

    # Goes to ~/Applications with a launcher entry from the image's
    # magnetite.desktop. No version in the name: Magnetite's own update
    # replaces the file in place.
    app_image "magnetite-#{version}-linux-#{arch}.AppImage", target: "Magnetite.AppImage"

    zap trash: "~/.local/share/magnetite"
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
end
