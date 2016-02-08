//  Copyright © 2016 Jeremy W. Sherman, distributed under GPLv3+ WITHOUT ANY WARRANTY.

import XCTest
import Cocoa
@testable import Quill

class ControlPanelTests: XCTestCase {
    var controlPanel: ControlPanel!


    override func setUp() {
        controlPanel = controller("ControlPanel")
    }


    func testHasAnEnableTranslationButton() {
        havingLoadedItsViewAndConnectedOutlets()
        XCTAssertNotNil(controlPanel.enableTranslationButton, "outlet not connected")
    }
}


// MARK: - Helpers
extension ControlPanelTests {
    func havingLoadedItsViewAndConnectedOutlets() {
        let _ = controlPanel.view  // side effect: loads the view and connects outlets
    }
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
