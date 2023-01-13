//
//  MainView.swift
//  Detector
//
//  Created by Kawthar Almajhad on 15/06/1444 AH.
//

import SwiftUI

struct MainView: View {
    @State private var isEditing = false
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient (colors: [.init("darkPur"),.init("lightPur")]),
                           startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()

                Circle().fill(Color.init("cerDarkPur"))
                .frame(width: 200, height: 200)
                    .cornerRadius(5)                 .shadow(
                                    color:
                                        Color.init("lightPur").opacity(3),
                                   radius: 40,
                                    x: 5,
                                    y: 5)
                
                Circle()
               // .strokeBorder(Color.init("BorderCol"),lineWidth: 4)
                    .fill(Color.init("ButtonColor"))
                    .frame(width: 75, height: 75)
                    .cornerRadius(5)
                    .overlay(
                             Circle()
                                .strokeBorder(Color.init("BorderCol"),lineWidth: 4)
                         )
                
                Button(action:{}){
                    PJRPulseButton()
                        .font(.system(size: 50))
                        .foregroundColor(.init("GreenBut"))
                        .clipShape(Circle())
                        .bold()
                    
                }
            Text("Detector").offset(y:-345)
                .foregroundColor(Color.init("darkPur")).font(.system(size: 30, weight: .bold))
            
            
                HStack{
                    Text("English").offset(x:35)
                    Spacer()
                    Text("Edit").offset(x:-35)
                }.offset(y:-290).foregroundColor(Color.init("darkPur"))
                .font(.system(size: 20, weight: .regular))
            
            Text("Hello Kawthar").offset(y:-200).foregroundColor(Color.init("darkPur")).font(.system(size: 20, weight: .regular))
            
            
                VStack{ Text("Press The Button To Turn Off")
                    Text("The Voice Detect")}.offset(y:250).foregroundColor(Color.init("FontColor")).font(.system(size: 20, weight: .regular))
                
        }
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}

