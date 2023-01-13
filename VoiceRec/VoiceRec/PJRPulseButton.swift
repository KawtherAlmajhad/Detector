//
//  PJRPulseButton.swift
//  VoiceRec
//
//  Created by Kawthar Almajhad on 17/06/1444 AH.
//



import SwiftUI

// MARK: - Strucutre for Circle
struct CircleData: Hashable {
    let width: CGFloat
    let opacity: Double
}

struct PJRPulseButton: View {
    
    // MARK: - Properties
    @State private var isAnimating: Bool = false
    var color: Color
    var systemImageName: String
    var buttonWidth: CGFloat
    var numberOfOuterCircles: Int
    var animationDuration: Double
    var circleArray = [CircleData]()


    init(color: Color = Color.init("darkPur"), systemImageName: String = "power",  buttonWidth: CGFloat = 48, numberOfOuterCircles: Int = 2, animationDuration: Double  = 1) {
        self.color = color
        self.systemImageName = systemImageName
        self.buttonWidth = buttonWidth
        self.numberOfOuterCircles = numberOfOuterCircles
        self.animationDuration = animationDuration
        
        var circleWidth = self.buttonWidth
        var opacity = (numberOfOuterCircles > 4) ? 0.40 : 0.20
        
        for _ in 0..<numberOfOuterCircles{
            circleWidth += 70
            self.circleArray.append(CircleData(width: circleWidth, opacity: opacity))
            opacity -= 0.05
        }
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            Group {
                ForEach(circleArray, id: \.self) { cirlce in
                    Circle()
                            .fill(self.color)
                        .opacity(self.isAnimating ? cirlce.opacity : 0)
                        .frame(width: cirlce.width, height: cirlce.width, alignment: .center)
                        .scaleEffect(self.isAnimating ? 1 : 0)
                }
                
            }
            .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true),
               value: self.isAnimating)

            Button(action: {
                print("Button Pressed event")
            }) {
                Image(systemName: self.systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: self.buttonWidth, height: self.buttonWidth, alignment: .center)
                    .accentColor(color)
                
            }
            .onAppear(perform: {
                    self.isAnimating.toggle()
            })
        } //: ZSTACK
    }

}

// MARK: - Preview
struct PulseButton_Previews: PreviewProvider {
    static var previews: some View {
        PJRPulseButton()
    }
}


