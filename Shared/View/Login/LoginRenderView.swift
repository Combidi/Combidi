//
//  Created by Peter Combee on 04/06/2021.
//

import SwiftUI

/*
 See URL for design
 https://search.muz.li/ZmNjY2EzN2Zl
 https://search.muz.li/ZTlmNzYzNWE0
 */

struct LoginRenderView: View {
    
    enum Field: Hashable {
        case username
        case password
    }
    
    @Binding var username: String
    @Binding var password: String
    
    @FocusState private var focusedField: Field?
    
    let attemptLogin: () -> Void

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ColorManager.background
                .edgesIgnoringSafeArea(.all)
            Color.white
                .overlay(
                    VStack {
                        image
                        Text("Welcome!")
                        TextField("Username", text: $username)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .focused($focusedField, equals: .username)
                            .textContentType(.username)
                            .submitLabel(.next)

                        SecureField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .focused($focusedField, equals: .password)
                            .textContentType(.password)
                            .submitLabel(.send)
                    
                    loginButton
                    }
                )
                .cornerRadius(topLeft: 50, topRight: 50)
        }
        .onSubmit {
            switch focusedField {
            case .username:
                focusedField = .password
            default:
                focusedField = nil
                attemptLogin()
            }
        }

    }
    
    private var background: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25).fill(Color.blue)
            Color.blue
        }
    }
    
    private var image: some View {
        Image("Peter")
            .size(75)
            .mask(Circle())
            .padding(3)
            .background(Color.red.mask(Circle()))
    }
    
    private var loginButton: some View {
        Button(action: attemptLogin) {
            Text("Login")
        }
        .background(Color.orange)
    }
}

#if DEBUG
struct LoginRenderExampleView: View {
    
    @State private var username: String = "Peter"
    @State private var password: String = "Combee"
    
    var body: some View {
        LoginRenderView(
            username: $username,
            password: $password,
            attemptLogin: {}
        )
    }
}

struct LoginRenderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRenderExampleView()
    }
}
#endif
