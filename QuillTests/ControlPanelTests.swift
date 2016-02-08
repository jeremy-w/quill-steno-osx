//  Copyright © 2016 Jeremy W. Sherman, distributed under GPLv3+ WITHOUT ANY WARRANTY.

import XCTest
import Cocoa
@testable import Quill

class ControlPanelTests: XCTestCase {
    var controlPanel: ControlPanel!
    let engine = SpyingTranslationEngine()


    override func setUp() {
        controlPanel = controller("ControlPanel")
        controlPanel.configure(engine)
    }


    func testHasADefaultTranslationEngine() {
        let controlPanel: ControlPanel? = controller("ControlPanel")
        XCTAssertNotNil(controlPanel, "failed to get controlPanel")
        guard let panel = controlPanel else { return }

        XCTAssertNotNil(panel.translationEngine)
    }


    func testHasAnEnableTranslationButton() {
        havingLoadedItsViewAndConnectedOutlets()
        XCTAssertNotNil(controlPanel.enableTranslationButton, "outlet not connected")
    }


    func testTurningButtonOnEnablesEngineTranslation() {
        havingLoadedItsViewAndConnectedOutlets()
        controlPanel.enableTranslationButton.performClick(nil)
        XCTAssertTrue(engine.translating, "check action connection")
    }


    func testEnablingTranslationNotViaButtonStillUpdatesButtonState() {
        havingLoadedItsViewAndConnectedOutlets()
        engine.translating = true
        XCTAssertEqual(controlPanel.enableTranslationButton.state, NSOnState)
    }
}



// MARK: - Helpers
extension ControlPanelTests {
    func havingLoadedItsViewAndConnectedOutlets() {
        let _ = controlPanel.view  // side effect: loads the view and connects outlets
    }
}



class SpyingTranslationEngine: TranslationEngine {
    var translating = false {
        didSet {
            translatingDidChange(translating)
        }
    }


    var translatingDidChange = translatingDidChangeNOP
}



func controller<ControllerType>(
    identifier: String,
    from storyboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
) -> ControllerType? {
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
    let identifier = "ControlPanel"
    guard let controller = storyboard.instantiateControllerWithIdentifier(identifier)
        as? ControllerType else {
            XCTFail("failed to find controller with identifier \"\(identifier)\" "
                + "in storyboard \(storyboard)")
            return nil
    }
    return controller
}
