//
//  Demos.swift
//  VoiceRec
//
//  Created by Kawthar Almajhad on 16/06/1444 AH.
//


import SwiftUI
import Combine
import Speech
import UserNotifications

public extension SwiftSpeech.Demos {
    
    struct Basic : View {
        
        var sessionConfiguration: SwiftSpeech.Session.Configuration
       // var EnterdName: SwiftSpeech.Session.Configuration
        
        @State private var text = "Tap to Speak"
        
        
        public init(sessionConfiguration: SwiftSpeech.Session.Configuration) {
            self.sessionConfiguration = sessionConfiguration
        }
        
        public init(locale: Locale = .current) {
            self.init(sessionConfiguration: SwiftSpeech.Session.Configuration(locale: locale))
        }
        
        public init(localeIdentifier: String) {
            self.init(locale: Locale(identifier: localeIdentifier))
        }
        

        @State var showSheet : Bool = false
        @State private var isEditing = false
        @State var EnterdName: String = ""

        public var body: some View {
           
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
                    
                    
                    //            VStack {
                    //
                    
                   // Text(EnterdName)
                    VStack{
                        HStack {
                            Text("welcome_screen_title").font(.system(size: 20, weight: .bold)).foregroundColor(.init("darkPur"))
                            Text(EnterdName).font(.system(size: 20, weight: .bold)).foregroundColor(.init("darkPur"))
                        }
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text ("Introduce")//.underline()
                                .frame(width:220,height:40)
                                .background(Color.init("darkPur"))
                                .cornerRadius(15)
                                .shadow(
                                    color:
                                        Color.init("darkPur").opacity(3),
                                    radius: 5,
                                    x: 1,
                                    y: 1)
                        }.font(.system(size: 20, weight: .regular)).foregroundColor(Color.init("lightPur"))}.offset(y:-200)
                    
                    
                    //                    TextField(
                    //                        "enteredName",
                    //                        text: $EnterdQ
                    //                    )
                    //                    .disabled(!isEditing)
                    //                    .frame(width:250,height:40)
                    //                    .background(Color.init("lightPur"))
                    //                    .disableAutocorrection(true)
                    //                    .cornerRadius(15)
                    //                    .multilineTextAlignment(.center)
                    //                    //.textFieldStyle(.roundedBorder)
                    //                    .shadow(
                    //                        color:
                    //                            Color.init("darkPur").opacity(3),
                    //                        radius: 5,
                    //                        x: 1,
                    //                        y: 1)
                    //                    .offset(y:-200)
                    
                    //                    .foregroundColor(Color.init("darkPur"))
                    //                    .font(.system(size: 20, weight: .regular))
                    
                    
                    
                    Text("Detector").offset(y:-340)
                        .foregroundColor(Color.init("darkPur")).font(.system(size: 40, weight: .bold))
                    
                    VStack{ Text("Descrption1")
                        Text("Descrption2")}.offset(y:250).foregroundColor(Color.init("FontColor")).font(.system(size: 22, weight: .regular))
                    HStack{
                        Button {
                            //                        func changeLan() {
                            guard let settingUrl = URL(string: UIApplication.openSettingsURLString) else { return }
                            if UIApplication.shared.canOpenURL(settingUrl) {
                                UIApplication.shared.open(settingUrl) { su in }
                            }
                            //                        }
                            
                            
                        } label: {
                            Image(systemName: "globe")
                            
                        }.offset(x:35)
                        
                        Spacer()
                        
                        Button{
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    print("All set!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                        }label: {
                            Image(systemName: "bell.fill")
                        }.offset(x:-35)
                        
                    }.offset(y:-280).foregroundColor(Color.init("darkPur")).font(.system(size: 22, weight: .regular))
                    //
                    //
                    //
                    //                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    //                     x ()
                    //
                    //
                    //                }
                    //
                    //            }
                    
                    // .onAppear{x()}
                    VStack(spacing: 35.0) {
                        //                                Text(text)
                        //                                    .font(.system(size: 25, weight: .bold, design: .default))
                        SwiftSpeech.RecordButton()
                            .swiftSpeechToggleRecordingOnTap(sessionConfiguration: sessionConfiguration, animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                            .onRecognizeLatest(update: $text)
                        
                    }.onAppear {
                        SwiftSpeech.requestSpeechRecognitionAuthorization()
                    }
                }
                .sheet(isPresented: $showSheet){
                    
                    ZStack {
                        Color.init("darkPur").edgesIgnoringSafeArea(.all)
//                        LinearGradient(gradient: Gradient (colors: [.init("darkPur"),.init("cerLightPur")]),
//                                       startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                        DetailsSheet(showSheet: $showSheet, EnterdName: $EnterdName)
                    }
                        .presentationDetents([
                            
                                               //.height(100),   // 100 points
                                               .fraction(0.21), // 20% of the available height
                                               ])        // The previously default sheet size
                        
                                           //.edgesIgnoringSafeArea(.all)
                    }
            
        }
        
        
        
        
        func x (){
            
            var name = "Adam"
            var result = text
            // check if message contains "Swift"
            var value = result.contains(name)
            if value{
                notification()
            }
            
            
            
            
            func notification (){
                let content = UNMutableNotificationContent()
                content.title = "Detector"
                content.subtitle = "Someone Calling By Your Name!"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
                
            }
            print(result)


        }
    }
    
    struct Colors : View {

        @State private var text = "Hold and say a color!"

        static let colorDictionary: [String : Color] = [
            "black": .black,
            "white": .white,
            "blue": .blue,
            "gray": .gray,
            "green": .green,
            "orange": .orange,
            "pink": .pink,
            "purple": .purple,
            "red": .red,
            "yellow": .yellow
        ]

        var color: Color? {
            Colors.colorDictionary
                .first { pair in
                    text.lowercased().contains(pair.key)
                }?
                .value
        }

        public init() { }
        @State var showSheet : Bool = false
        public var body: some View {
            VStack(spacing: 35.0) {
                Text(text)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(color)
                SwiftSpeech.RecordButton()
                    .accentColor(color)
                    .swiftSpeechRecordOnHold(locale: Locale(identifier: "en_US"), animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                    .onRecognizeLatest(update: $text)
            }.onAppear {
                SwiftSpeech.requestSpeechRecognitionAuthorization()
            }
        }

    }

    struct List : View {

        var sessionConfiguration: SwiftSpeech.Session.Configuration
        

        @State var list: [(session: SwiftSpeech.Session, text: String)] = []
        
        public init(sessionConfiguration: SwiftSpeech.Session.Configuration) {
            self.sessionConfiguration = sessionConfiguration
        }
        
        public init(locale: Locale = .current) {
            self.init(sessionConfiguration: SwiftSpeech.Session.Configuration(locale: locale))
        }
        
        public init(localeIdentifier: String) {
            self.init(locale: Locale(identifier: localeIdentifier))
        }

        public var body: some View {
            NavigationView {
                SwiftUI.List {
                    ForEach(list, id: \.session.id) { pair in
                        Text(pair.text)
                    }
                }.overlay(
                    SwiftSpeech.RecordButton()
                        .swiftSpeechRecordOnHold(
                            sessionConfiguration: sessionConfiguration,
                            animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0),
                            distanceToCancel: 100.0
                        ).onStartRecording { session in
                            list.append((session, ""))
                        }.onCancelRecording { session in
                            _ = list.firstIndex { $0.session.id == session.id }
                                .map { list.remove(at: $0) }
                        }.onRecognize(includePartialResults: true) { session, result in
                            list.firstIndex { $0.session.id == session.id }
                                .map { index in
                                    list[index].text = result.bestTranscription.formattedString + (result.isFinal ? "" : "...")
                                }
                        } handleError: { session, error in
                            list.firstIndex { $0.session.id == session.id }
                                .map { index in
                                    list[index].text = "Error \((error as NSError).code)"
                                }
                        }.padding(20),
                    alignment: .bottom
                ).navigationBarTitle(Text("SwiftSpeech"))

            }.onAppear {
                SwiftSpeech.requestSpeechRecognitionAuthorization()
            }
        }
        
    }
    
    struct DetailsSheet : View{
        @Binding var showSheet : Bool
      //  @State var EnterdName: String = ""
        @Binding var EnterdName: String
        @State private var isEditing = false
        public var body: some View{
            VStack{
                
                Text ("enteredName").foregroundColor(Color.init("lightPur")).font(.system(size: 20, weight: .regular))
                TextField(
                    "",
                    text: $EnterdName
                )
                // .disabled(!isEditing)
                .frame(width:250,height:40)
                .background(Color.init("lightPur"))
                .disableAutocorrection(true)
                .cornerRadius(15)
                .multilineTextAlignment(.center)
                //.textFieldStyle(.roundedBorder)
                .shadow(
                    color:
                        Color.init("lightPur").opacity(3),
                    radius: 5,
                    x: 1,
                    y: 1)
                
                .foregroundColor(Color.init("darkPur"))
                .font(.system(size: 20, weight: .regular))
            }}
    }
}
