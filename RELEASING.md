# Releasing Quill
Quill's release process is mostly automated
thanks to TravisCI and GitHub Releases.

Your job as the person initiating the release is to make sure the release
notes are correct and that they get copied into ALL the things.


## Documenting a Release in NEWS.md
Scan through the changelog since the last release was tagged.

Document any user-visible changes under the new version number
in NEWS.md. These notes will also be copied into the corresponding
GitHub release once that's uploaded.

If you're lucky, NEWS grew bit-by-bit as new functionality was added,
so you're just making sure nothing was missed.


## Tagging a Release with Git
Quill releases are built automatically by TravisCI when a tag is pushed to
the [canonical repo](https://github.com/jeremy-w/quill-steno-osx) on GitHub.

Once you've updated NEWS, `git tag -a v1.2.3`.
The tag commit message title should be
"Tagging Quill.app v1.2.3", and the body should contain whatever you added
into NEWS for this version.

Then, `git push`. *(jws/2016-02-07)TODO: You might need `git push --tags`. Update this once we've actually done a release.*


## Building a Release & Uploading to GitHub
Assuming the tests pass, Travis will upload zipped versions of Quill.app
and Quill.app.dSYM, the debug symbol bundle, as the attachments of a new
GitHub Release.

You can [watch the build progress here.](https://travis-ci.org/jeremy-w/quill-steno-osx/builds)


## Documenting the Release, Part 2
Once the build succeeds, visit the
[GitHub Releases page](https://github.com/jeremy-w/quill-steno-osx/releases)
and paste in the release notes that you added to NEWS prior to tagging
the release.
