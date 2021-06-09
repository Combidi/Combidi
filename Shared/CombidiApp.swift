//
//  Created by Peter Combee on 04/06/2021.
//

import SwiftUI

private let store = makeStore()

@main
struct CombidiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

