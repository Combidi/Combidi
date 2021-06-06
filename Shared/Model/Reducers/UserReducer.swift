//
//  Created by Peter Combee on 04/06/2021.
//

import Foundation

func userReducer(
    state: inout ActivityState,
    action: InternalUserAction
) {
    switch action {
    case .loginStarted:
        state = .performing
    case .loginFinished(_):
        state = .idle
    case .didEncounterError(let error):
        state = .message(error.localizedDescription)
    default:
        break
    }
}
