//
//  ContentView.swift
//  value
//
//  Created by Atheer Mohammed on 09/01/2023.
//

import SwiftUI
import UserNotifications


struct ContentView: View {
    @State var i : Bool = false
    var body: some View {
        VStack {
                Button("Request Permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
            
            

            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                let name = "ali"
                var result = "hi ali"
                var value = result.contains(name)
                if value{
                    i = true
                }
                
            }
                      
        }
        .onChange(of: i){_ in
            let content = UNMutableNotificationContent()
            content.title = "Detector"
            content.subtitle = "Someone calling by your name!"
            content.sound = UNNotificationSound.default
             //   .provideImageData(o)
           
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
          
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
         
            UNUserNotificationCenter.current().add(request)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
