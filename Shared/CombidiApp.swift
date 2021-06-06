//
//  Created by Peter Combee on 04/06/2021.
//

import SwiftUI

@main
struct CombidiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

private let store = makeStore()
