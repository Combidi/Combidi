//
//  Created by Peter Combee on 04/06/2021.
//

struct AppState: Equatable {
    var loginState: ActivityState = .idle
}

enum ActivityState: Equatable {
    case idle
    case performing
    case message(String)
}
