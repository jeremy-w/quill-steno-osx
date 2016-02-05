#!/bin/bash

brew_install_if_missing() {
    formula=$1
    if which "$formula" >/dev/null; then
        echo "$0: already installed: $formula"
    else
        echo "$0: installing: $formula"
        brew install "$formula" && brew link "$formula"
    fi
}

# Quill uses swiftlint (https://github.com/realm/SwiftLint) to provide style
# advice each time Xcode builds the project.
brew_install_if_missing swiftlint
