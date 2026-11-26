# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.0.20"
  sha256 arm:          "6ec3fe5ffde62b3c13fab36d336e077dcbc64648caa46c1a6c911c0c70af30c1",
         intel:        "7d8f8527a9f371977a27080b09c8df2d61d7e985c3705771a31406c41fe5cd54",
         arm64_linux:  "d7fddd0f5da1eb899c303c59844fff4d4872d67567628d04c76fd2a5d1e748bd",
         x86_64_linux: "e2cd2221fc3476b199080baec5ed291ec1ffc433b30a9ff9179341e0b2e7a163"

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
