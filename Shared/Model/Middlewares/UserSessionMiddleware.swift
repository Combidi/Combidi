//
//  Created by Peter Combee on 04/06/2021.
//

import Combine

func userSessionMiddleware(
    service: LoginService
) -> AppMiddleware {
    return { getState, pipe in
        pipe.flatMapAction { action in
            guard
                case let .user(userAction) = action,
                case let .login(credentials) = userAction
            else { return Empty().eraseToAnyPublisher() }
            return service
                .login(credentials: credentials)
                .map { .loginFinished($0) }
                .catch { Just(.didEncounterError($0.appError)) }
                .map { InternalAction.user($0) }
                .eraseToAnyPublisher()
        }
    }
}

struct AppError: Error {}

extension ServiceError {
    var appError: AppError { .init() }
}

struct ServiceError: Error {}

enum AuthenticationResult {
    case success
    case denied
}

protocol LoginService {
    func login(credentials: Credentials) -> AnyPublisher<AuthenticationResult, ServiceError>
}

extension AnyPublisher where Output == InternalAction, Failure == Never {
    func flatMapAction(
        _ transform: @escaping (Output) -> Self
    ) -> AnyPublisher<Output, Never> {
        self.flatMap { (action: Output) -> Self in
            transform(action)
        }.eraseToAnyPublisher()
    }
}
