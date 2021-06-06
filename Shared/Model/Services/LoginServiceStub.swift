//
//  Created by Peter Combee on 06/06/2021.
//

import Combine
import Foundation

private let expected = Credentials(username: "peter", password: "combee")

struct LoginServiceStub: LoginService {
    func login(credentials: Credentials) -> AnyPublisher<AuthenticationResult, ServiceError> {
        return Just<AuthenticationResult>(credentials == expected ? .success : .denied)
            .delay(for: 3.0, scheduler: RunLoop.main)
            .setFailureType(to: ServiceError.self)
            .eraseToAnyPublisher()
    }
}
