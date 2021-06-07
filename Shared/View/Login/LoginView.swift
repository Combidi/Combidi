//
//  Created by Peter Combee on 04/06/2021.
//

import SwiftUI

typealias LoginStore = Store<ActivityState, UserAction>

struct LoginView: View {
    
    @EnvironmentObject private var store: LoginStore
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        LoginRenderView(
            username: $username,
            password: $password,
            attemptLogin: attemptLogin
        )
    }
    
    private func attemptLogin() {
        store.dispatch(action: .login(.init(
            username: username,
            password: password
        )))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
