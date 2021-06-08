//
//  Created by Peter Combee on 06/06/2021.
//

import SwiftUI
import Combine

typealias IsLoggedInObservable = ObservableState<Bool>

struct RootView<LoggedInView: View, LoggedOutView: View>: View {
            
    @EnvironmentObject private var observable: IsLoggedInObservable
    
    private let loggedInView: LoggedInView
    private let loggedOutView: LoggedOutView

    init(
        loggedInView: LoggedInView,
        loggedOutView: LoggedOutView
    ) {
        self.loggedInView = loggedInView
        self.loggedOutView = loggedOutView
    }
    
    private let isLoggedIn = false
    
    var body: some View {
        Group {
            if observable.state {
                loggedInView
            } else {
                loggedOutView
            }
        }
    }
    
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            loggedInView: Text("loggedInView"),
            loggedOutView: Text("loggedOutView")
        )
        .environmentObject(makeStore().isLoggedInObservable())
    }
}
#endif
