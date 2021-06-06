//
//  Created by Peter Combee on 04/06/2021.
//

import Foundation

func userReducer(
    state: inout AppState,
    action: InternalUserAction
) {
    switch action {
    case .loginStarted:
        state.loginState = .performing
    case .loginFinished(let result):
        state.loginState = .idle
        state.session = result == .success ? .init() : nil
    case .didEncounterError(let error):
        state.loginState = .message(error.localizedDescription)
    default:
        break
    }
}
