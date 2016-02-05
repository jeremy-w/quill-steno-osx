//  Copyright © 2016 Jeremy W. Sherman, distributed under GPLv3+ WITHOUT ANY WARRANTY.

import XCTest

@available(OSX 10.11, *)
class QuillUITests: XCTestCase {
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }
}
