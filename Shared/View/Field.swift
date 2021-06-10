//
//  Created by Peter Combee on 08/06/2021.
//

import SwiftUI

struct Field: View {
    
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(ColorManager.secondaryText)
            TextField("", text: $text)
                .foregroundColor(ColorManager.highlightedText)
            ColorManager.primaryText
                .frame(height: 2)
        }
    }
}

#if DEBUG
struct FieldExampleView: View {
    
    @State private var text = "peter@combee.nl"
    
    var body: some View {
        Field(title: "Username", text: $text)
    }
}

struct Field_Previews: PreviewProvider {
    static var previews: some View {
        FieldExampleView()
            .previewLayout(.sizeThatFits)
    }
}
#endif
