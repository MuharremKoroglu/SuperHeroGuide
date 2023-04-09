//
//  PowerStatusBar.swift
//  SuperHeroGuide
//
//  Created by Muharrem Köroğlu on 8.04.2023.
//

import SwiftUI

struct PowerStatusBar: View {
    
    
    var percent : Double = 90
    var textSize : CGFloat = 30
    var textColor : Color = .black
    var strokeLineWidth : CGFloat = 25
    var color1 : Color = .blue
    var color2 : Color = .mint
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                CircularStatusBar()
                    .stroke(style: StrokeStyle(lineWidth: strokeLineWidth))
                    .foregroundColor(.white.opacity(0.1))
                CircularStatusBar()
                    .stroke(style: StrokeStyle(lineWidth: 25))
                    .foregroundColor(.clear)
                    .background(LinearGradient(colors: [color1,color2], startPoint: .leading, endPoint: .trailing)
                        .clipShape(CircularStatusBar(percent: percent).stroke(style: StrokeStyle(lineWidth: strokeLineWidth))))
                    
                Text("%\(Int(percent))")
                    .font(.system(size: textSize))
                    .bold()
                    .foregroundColor(textColor)
           
            }.animation(.easeIn(duration: 2).delay(2), value: percent)
        }
    }
}
struct CircularStatusBar : Shape {

    var percent : Double
    var startAngel : Double
    
    init(percent: Double = 100, startAngel : Double = -90) {
        self.percent = percent
        self.startAngel = startAngel
    }
    
    typealias AnimatableData = Double
    
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        let radius = min(width,height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = (self.percent / 100 * 360 ) + startAngel
        
        return Path { path in
            
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngel), endAngle: Angle(degrees: endAngle), clockwise: false)
        }
    }

}

struct PowerStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        PowerStatusBar()
    }
}
