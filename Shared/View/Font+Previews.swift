//
//  Created by Peter Combee on 11/06/2021.
//

#if DEBUG

import SwiftUI

extension Font {
    static var test: Font {
        .largeTitle
            .uppercaseSmallCaps()
    }
}

struct Fonts_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                Text(".TeSt").font(.test)
            }
            Group {
                Text(".caption2").font(.caption2)
                Text(".caption").font(.caption)
                Text(".footnote").font(.footnote)
                Text(".subheadline").font(.subheadline)
                Text(".callout").font(.callout)
                Text(".body").font(.body)
                Text(".headline").font(.headline)
                Text(".title2").font(.title2)
                Text(".title").font(.title)
                Text(".largeTitle").font(.largeTitle)
            }
        }
    }
}
#endif
