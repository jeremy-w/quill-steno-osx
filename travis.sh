#!/bin/bash
# @author Jeremy W. Sherman
# @date 2016-02-07
# @license GPLv3+
#
# Travis build script for Quill.
#
# The tests are always run, but if we're building for a tag,
# then we expect Travis will copy up files for a GitHub release, so we
# do some additional work to zip up those files, assuming the tests pass.

BASE="build/Release"
APP="$BASE/Quill.app"
DSYM="$BASE/Quill.dSYM"


run_tests() {
    echo "$0: running tests"
    xcodebuild test -parallelizeTargets -scheme Quill
}


# Have xcodebuild install so that we have a predictable directory to grab
# the Release build from.
install_to_build_folder() {
    echo "$0: installing to build folder"
    xcodebuild install -parallelizeTargets -scheme Quill
}


# Copying in the dSYM enables OS X to symbolicate the crash report for us
# on the client-side.
copy_dSYM_into_app() {
    echo "$0: copying dSYM into app bundle so crash reports autosymbolicate"
    cp -Rp "$DSYM" "$APP/Contents/MacOS/"
}


# Zip the app so that it can be uploaded as a single file.
zip_up_app() {
    echo "$0: zipping up app"
    zip -r9 "$APP.zip" "$APP"
}


# Zip the dSYM so that it can be uploaded as a single file.
zip_up_dSYM() {
    echo "$0: zipping up dSYM"
    zip -r9 "$DSYM.zip" "$DSYM"
}


main() {
    is_building_release="false"
    if [[ -n $TRAVIS_TAG ]]; then
        is_building_release="true"
    fi


    if $is_building_release; then
        echo "$0: building for tag \"$TRAVIS_TAG\": rolling release for upload to GitHub Releases"
        mkdir build

        run_tests \
        && install_to_build_folder \
        && copy_dSYM_into_app \
        && zip_up_app \
        && zip_up_dSYM
    else
        echo "$0: not building for a tag: just running the tests"
        run_tests
    fi
}


main
