//
//  Created by Peter Combee on 04/06/2021.
//

enum AppAction {
    case user(UserAction)
}

struct Credentials: Equatable {
    let username: String
    let password: String
}

enum UserAction {
    case login(Credentials)
    case logout
}

