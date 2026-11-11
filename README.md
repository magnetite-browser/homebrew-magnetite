# homebrew-magnetite

The Homebrew tap of the [Magnetite](https://magnetitebrowser.org) browser.

## Install

```sh
brew install --cask magnetite-browser/magnetite/magnetite
```

The cask arrives with Magnetite's first release; until then this command
finds nothing.

Magnetite updates itself, so `brew upgrade` leaves it alone. To remove it
with its data:

```sh
brew uninstall --zap --cask magnetite
```

## How the cask gets here

The browser's release workflow writes `magnetite.rb` for each release, with
the checksums of that release's packages. After a release is published, the
workflow "Update cask" in this repository downloads it, checks it against
the release's checksums, installs it once on a Mac as a user would, and
commits it as `Casks/magnetite.rb`
([the steps](https://github.com/magnetite-browser/magnetite/blob/main/docs/development/release.md#homebrew)).
Only notarized releases pass, and drafts and pre-releases are refused.

Problems with the cask or the app belong in the
[browser's issues](https://github.com/magnetite-browser/magnetite/issues).

## Licence

European Union Public Licence v1.2 (`LICENSE`).
