# TODO
<!-- vi: set ts=4 sw=4: -->

## Project Infrastructure
Changes are checked by CI, and basic style standards are checked by linting.
Releases can be delivered automatically to GitHub.

- [X] Set up linter (and autoformatter if you can find one)
- [X] Ensure line coverage metrics are collected during testing
    - Coverage now defaults to being turned on. Nifty!
- [X] Hook up TravisCI.org for continuous integration
- [X] Automate publishing a build to GitHub Releases
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
- [ ] Add crash report & feedback collector
    - Now that we now have a preferences window for users to opt-in.


## Growing the UI
We work towards parity with the capabilities exposed by the stock
Plover app, though perhaps not presented in the same way.

- Problem: Having to use the mouse to enable/disable translation is
  too much of an interruption.
    - Solution: Add support for `{PLOVER:TOGGLE}`.

- Problem: Adding a new translation by manually hacking the dictionary is
  too much of an interruption.
    - Solution: Add support for the `{PLOVER:ADD_TRANSLATION}` control
      translation.

- Problem: Looking up translations for a word currently requires
  manual shell scripting.
    - Solution: Add support for the `{PLOVER:LOOKUP}` control translation.
        - TODO: Verify that's how it's spelt; it's not documented in
          Learn Plover just yet.

- Problem: Learning steno requires me to divert from typing to look up words.
    - Solution: Integrate Stenotray-like functionality.

- Problem: Learning better ways to stroke words and phrases is important
  for speedbuilding, but currently requires a manual lookup.
    - Possible solutions:
        - An Alternatives HUD window?
        - An Alternatives bubble that can be requested on demand?
        - A "lookup last N words" command?
            - Could be done like Emacs count-modifiers,
              C-u 3 M-x lookup-alternatives,
              along with snarfing text from the frontmost app.
