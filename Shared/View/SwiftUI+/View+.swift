//
//  Created by Peter Combee on 10/06/2021.
//

import SwiftUI

extension View {
    func size(_ size: CGFloat) -> some View {
        self
            .frame(width: size, height: size)
    }
}

#if DEBUG
struct View_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Color.red.size(10)
            Color.orange.size(20)
            Color.green.size(30)
        }
    }
}
#endif
