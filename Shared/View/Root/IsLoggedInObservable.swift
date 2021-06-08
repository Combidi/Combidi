//
//  Created by Peter Combee on 08/06/2021.
//

import Foundation

extension MainStore {
    func isLoggedInObservable() -> IsLoggedInObservable {
        self.derivedState(deriveState: { state in
            state.session != nil
        })
    }
}
