//
//  Created by Peter Combee on 04/06/2021.
//

extension MainStore {
    func loginStore() -> LoginStore {
        self.derived(
            deriveState: { $0.loginState },
            embedAction: { .user($0) }
        )
    }
}
