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

`Casks/magnetite.rb` is written by the browser's release workflow for each
release, with the checksums of that release's packages, and committed here
once the release is published
([how](https://github.com/magnetite-browser/magnetite/blob/main/docs/development/release.md#homebrew)).
Only notarized releases get a cask.

Problems with the cask or the app belong in the
[browser's issues](https://github.com/magnetite-browser/magnetite/issues).

## Licence

European Union Public Licence v1.2 (`LICENSE`).
