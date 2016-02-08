//  Copyright © 2016 Jeremy W. Sherman, distributed under GPLv3+ WITHOUT ANY WARRANTY.

import Cocoa

class ControlPanel: NSViewController {
    var translationEngine: TranslationEngine! = {
        return PloverPythonTranslationEngine()
    }() {
        didSet {
            translationEngine.translatingDidChange = { translating in
                self.enableTranslationButton.state = (translating ? NSOnState : NSOffState)
            }
        }
    }


    /// Initializes state required for operation of the view controller.
    /// Should be called before loading the view.
    func configure(translationEngine: TranslationEngine) {
        self.translationEngine = translationEngine
    }


    @IBOutlet var enableTranslationButton: NSButton!
    @IBAction func enableTranslationButtonAction(sender: NSButton) {
        self.translationEngine.translating = (sender.state == NSOnState)
    }
}
