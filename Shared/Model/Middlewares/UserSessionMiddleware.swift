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
                .map { .user($0) }
                .eraseToAnyPublisher()
        }
    }
}

extension ServiceError {
    var appError: AppError { .init() }
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
