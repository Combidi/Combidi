//
//  Created by Peter Combee on 05/06/2021.
//

enum InternalAction {
    case user(InternalUserAction)
}

enum InternalUserAction {
    
    case login(Credentials)
    case loginStarted
    case loginFinished(AuthenticationResult)
    case didEncounterError(AppError)
    
    case logout
}

extension AppAction {
    var internalAction: InternalAction {
        switch self {
        case .user(let action as InternalActionConvertible):
            return action.internalAction
        }
    }
}

protocol InternalActionConvertible {
    var internalAction: InternalAction { get }
}

extension UserAction: InternalActionConvertible {
    var internalAction: InternalAction {
        switch self {
        case .login(let credentials):
            return .user(.login(credentials))
        case .logout:
            return .user(.logout)
        }
    }
}
