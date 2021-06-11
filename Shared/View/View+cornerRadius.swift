//
//  Created by Peter Combee on 10/06/2021.
//

import SwiftUI

fileprivate struct RoundedCorner: Shape {
    
    var topLeft: CGFloat = 0.0
    var topRight: CGFloat = 0.0
    var bottomLeft: CGFloat = 0.0
    var bottomRight: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        
        let topRight = rect.cappedRadius(for: topRight)
        let topLeft = rect.cappedRadius(for: topLeft)
        let bottomLeft = rect.cappedRadius(for: bottomLeft)
        let bottomRight = rect.cappedRadius(for: bottomRight)
        
        let width = rect.size.width
        let height = rect.size.height

        var path = Path()

        path.move(to: .init(x: width / 2.0, y: 0))
        path.addLine(to: .init(x: width - topRight, y: 0))
        path.addArc(center: .init(x: width - topRight, y: topRight), radius: topRight,
                    startAngle: .init(degrees: -90), endAngle: .init(degrees: 0), clockwise: false)

        path.addLine(to: .init(x: width, y: height - bottomRight))
        path.addArc(center: .init(x: width - bottomRight, y: height - bottomRight), radius: bottomRight,
                    startAngle: .init(degrees: 0), endAngle: .init(degrees: 90), clockwise: false)

        path.addLine(to: .init(x: bottomLeft, y: height))
        path.addArc(center: .init(x: bottomLeft, y: height - bottomLeft), radius: bottomLeft,
                    startAngle: .init(degrees: 90), endAngle: .init(degrees: 180), clockwise: false)

        path.addLine(to: .init(x: 0, y: topLeft))
        path.addArc(center: .init(x: topLeft, y: topLeft), radius: topLeft,
                    startAngle: .init(degrees: 180), endAngle: .init(degrees: 270), clockwise: false)

        return path
    }
}

extension CGRect {
    func cappedRadius(for prefferedRadius: CGFloat) -> CGFloat {
        min(min(prefferedRadius, size.height/2), size.width/2)
    }
}

extension View {
    func cornerRadius(
        topLeft: CGFloat = 0,
        topRight: CGFloat = 0,
        bottomLeft: CGFloat = 0,
        bottomRight: CGFloat = 0
    ) -> some View {
        clipShape(RoundedCorner(
            topLeft: topLeft,
            topRight: topRight,
            bottomLeft: bottomLeft,
            bottomRight: bottomRight
        ))
    }
}

#if DEBUG
struct RoundedCornersExampleView: View {
    
    @State private var topLeft: CGFloat = 20
    @State private var topRight: CGFloat = 10
    @State private var bottomLeft: CGFloat = 25
    @State private var bottomRight: CGFloat = 50
    
    var body: some View {
        VStack {
            HStack {
                Slider(value: $topLeft, in: 0...50)
                Slider(value: $topRight, in: 0...50)
            }
            Text("Round me!")
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(
                    topLeft: topLeft,
                    topRight: topRight,
                    bottomLeft: bottomLeft,
                    bottomRight: bottomRight
                )
            HStack {
                Slider(value: $bottomLeft, in: 0...50)
                Slider(value: $bottomRight, in: 0...50)
            }
        }
    }
}

struct RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornersExampleView()
    }
}
#endif
