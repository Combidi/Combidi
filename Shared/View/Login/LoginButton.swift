//
//  Created by Peter Combee on 11/06/2021.
//

import SwiftUI

struct LoginButton: View {
    
    let action: () -> Void
    let title: String
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}

#if DEBUG
struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(action: {}, title: "Tap!")
    }
}
#endif
