//
//  Created by Peter Combee on 04/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    let store: MainStore
    
    var body: some View {
        LoginView()
            .environmentObject(store.loginStore())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: makeStore())
    }
}
#endif
