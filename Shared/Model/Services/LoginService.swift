//
//  Created by Peter Combee on 09/06/2021.
//

import Combine

enum AuthenticationResult {
    case success
    case denied
}

protocol LoginService {
    func login(credentials: Credentials) -> AnyPublisher<AuthenticationResult, ServiceError>
}
