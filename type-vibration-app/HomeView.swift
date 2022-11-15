//
//  ContentView.swift
//  type-vibration-app
//
//  Created by André  Lucas on 14/11/22.
//

import SwiftUI

struct HomeView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var vibrationsImpacNames = ["Soft", "Light","Medium", "Heavy","Rigid"]
    var vibrationsNotificationNames = ["success","error","warning"]
    
    var vibrationsNotificationType: [UINotificationFeedbackGenerator.FeedbackType] = [.success,.error,.warning]
    var vibrationsImpacType: [UIImpactFeedbackGenerator.FeedbackStyle] = [.soft,.light,.medium,.heavy,
        .rigid]
    
    var vibrationColor = [Color.green,.blue,.cyan,.indigo,.red]
    var vibrationNotificationColor = [Color.green,.red,.yellow]
    
    @State private var selectedVibration = "Soft"
    
    var body: some View {
        NavigationView{
            ScrollView{
                Divider()
                Text("Impact")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
                LazyVGrid(columns: columns) {
                    ForEach(0..<5) {index in
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 150, height: 150)
                            .foregroundColor(vibrationColor[index])
                            .overlay{
                                Text(vibrationsImpacNames[index])
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .onTapGesture {
                                let impactMed = UIImpactFeedbackGenerator(style: vibrationsImpacType[index])
                                impactMed.impactOccurred()
                            }
                    }
                }
                Divider()
                Text("Notification")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
                ForEach(0..<3){index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 100)
                        .foregroundColor(vibrationNotificationColor[index])
                        .overlay{
                            HStack{
                                Text(vibrationsNotificationNames[index])
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                                Image(systemName: "bell.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                            }
                            .padding()
                        }
                        .onTapGesture {
                            let impactMed = UINotificationFeedbackGenerator()
                            impactMed.notificationOccurred(vibrationsNotificationType[index])
                        }
                }
                Divider()
                Text("Selection")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
                
                Picker("Please choose a vibration", selection: $selectedVibration) {
                    ForEach(vibrationsImpacNames, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())

            }
            .padding()
            .navigationTitle("Vibration type")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
