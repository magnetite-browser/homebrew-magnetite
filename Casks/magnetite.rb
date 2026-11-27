# Homebrew cask for the tap magnetite-browser/homebrew-magnetite (Casks/magnetite.rb).
# scripts/release/render-cask.sh fills in the @…@ values for each release.
cask "magnetite" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.0.21"
  sha256 arm:          "60c1c45e97874724227101f673b94c7d2a85dc0737bca9bc9f1da6cbc96a1109",
         intel:        "797a65b5825cd815664a356a230430da4236ed7fc589a6b801a553b3b6c7a6c9",
         arm64_linux:  "581c484db6607974a1c659e2062a3663fd48323c5d583ed6e888778739fec2d9",
         x86_64_linux: "54ed09803049d747725ee2f3a9e06d03c791bce97be3deb4ad91172754ae34e3"

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
