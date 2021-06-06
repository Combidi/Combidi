//
//  Created by Peter Combee on 04/06/2021.
//

import SwiftUI

struct LoginRenderView: View {
    
    let attemptLogin: () -> Void
    @Binding var username: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
                .disableAutocorrection(true)
                .autocapitalization(.none)

            
            Button(action: attemptLogin) {
                Text("Login")
            }
        }
    }
}

#if DEBUG
struct LoginRenderExampleView: View {
    
    @State private var username: String = "Peter"
    @State private var password: String = "Combee"
    
    var body: some View {
        LoginRenderView(attemptLogin: {}, username: $username, password: $password)
    }
}
#endif

struct LoginRenderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRenderExampleView()
    }
}
