# homebrew-magnetite

The Homebrew tap of the [Magnetite](https://magnetitebrowser.org) browser.

## Install

```sh
brew install --cask magnetite-browser/magnetite/magnetite
```

On macOS this installs `Magnetite.app`. On Linux (x86_64, aarch64; Homebrew
7.0.12 or later) it installs the AppImage as
`~/Applications/Magnetite.AppImage`, with an entry in your app launcher.

Magnetite updates itself, so `brew upgrade` leaves it alone. To remove it
with its data:

```sh
brew uninstall --zap --cask magnetite
```

## How the cask gets here

The browser's release workflow writes `magnetite.rb` for each release, with
the checksums of that release's packages. After a release is published, the
workflow "Update cask" in this repository downloads it, checks it against
the release's checksums, installs it once on a Mac and once on Linux as a
user would (`install.yml`), and commits it as `Casks/magnetite.rb`
([the steps](https://github.com/magnetite-browser/magnetite/blob/main/docs/development/release.md#homebrew)).
Only notarized releases pass, and drafts and pre-releases are refused. A
pull request that changes the cask gets the same installs.

Problems with the cask or the app belong in the
[browser's issues](https://github.com/magnetite-browser/magnetite/issues).

## Licence

European Union Public Licence v1.2 (`LICENSE`).
