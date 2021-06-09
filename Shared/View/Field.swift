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
            TextField("", text: $text)
                .foregroundColor(.blue)
            Color.blue
                .frame(height: 1)
        }
    }
}

#if DEBUG
struct FieldExampleView: View {
    
    @State private var text = ""
    
    var body: some View {
        Field(title: "Username", text: $text)
    }
}

struct Field_Previews: PreviewProvider {
    static var previews: some View {
        FieldExampleView()
    }
}
#endif
