//
//  Created by Peter Combee on 04/06/2021.
//

import SwiftUI

/*
 See URL for design
 https://search.muz.li/ZmNjY2EzN2Zl
 */

struct LoginRenderView: View {
    
    @Binding var username: String
    @Binding var password: String
    
    let attemptLogin: () -> Void

    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            VStack {
                image
                Text("Welcome!")
                TextField("Username", text: $username)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                loginButton
            }
        }
        .background(background)
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

extension Image {
    func size(_ size: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: size, height: size)
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
