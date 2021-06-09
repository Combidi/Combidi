//
//  Created by Peter Combee on 09/06/2021.
//

import SwiftUI

extension Image {
    func size(_ size: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: size, height: size)
    }
}

#if DEBUG
struct Image_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Image(systemName: "trash")
        }
    }
}
#endif
