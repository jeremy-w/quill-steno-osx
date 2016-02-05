# TODO

## Project Infrastructure
Changes are checked by CI, and basic style standards are checked by linting.
Releases can be delivered automatically to GitHub.

- [ ] Set up linter (and autoformatter if you can find one)
- [ ] Ensure line coverage metrics are collected during testing
- [ ] Hook up TravisCI.org for continuous integration
- [ ] Automate publishing a build to GitHub Releases
- [ ] Publish an empty "Hello World" build
- [ ] Document repository configuration and release process
- [X] Question: Set up Developer ID signing sooner or later?
    - We can punt on it, so I reckon we should.
- [X] Similar question: Set up Sparkle now or later?
    - Punt punt punt punt till this is something worth updating
      and accessible to non-devs.


## Embedding Plover Core
Plover translation can be turned on and off through a big ugly button.
The stock Plover code is used for this purpose, though possibly
pinned at a known-working older version of the code for now.

- [ ] Work out the best way to hook in Plover Core
    - Pinning at a specific version is probably ideal.
        - Being able to retarget it to somewhere on disk for easy development
          of Plover Core would be swell, though.
    - It would be preferable NOT to have to mess with git submodules
      or subtree merges.
    - This will also include working out Python embedding.
- [ ] Add an On/Off button to the stock window
- [ ] Wire it up to turn Plover mode on/off
- [ ] Verify it works to type using the configuration already set up by the
  standard Plover.app


## Providing a Status Item
Plover translation can be turned on and off via a status item.
The status item indicates whether translation is on or off at a glance.

- [ ] Add a Preferences window
- [ ] Add support for the Window/Status Item/Window + Status Item option
    - Note how Dash does this, with Behavior: Show dock icon,
      Behavior: Show menu icon, and both able to be disabled
      thanks to a global keyboard shortcut.
    - We just want one or the other.


## Growing the UI
We work towards parity with the capabilities exposed by the stock
Plover app, though perhaps not presented in the same way.
