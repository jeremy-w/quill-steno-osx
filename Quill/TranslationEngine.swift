//  Copyright © 2016 Jeremy W. Sherman, distributed under GPLv3+ WITHOUT ANY WARRANTY.

protocol TranslationEngine {
    var translating: Bool {get set}

    /// - param: translating: The new value of `translating`.
    var translatingDidChange: (Bool) -> Void {get set}
}
