//
//  ContentView.swift
//  GameUI
//
//  Created by Kadir on 3.09.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    var body: some View {
        VStack{
            HStack {
                Text("Your Player")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all))
    }
}


struct Player: Identifiable {
    var id: Int
    var powers: [CGFloat]
    var image: String
    var name: String
    var color: Color
}

var data = [
    Player(id: 0, powers: [0.2,0.5,0.9], image: "Player1", name: "Bomb Raider", color: Color( "Color")),
    Player(id: 1, powers: [0.3,0.5,0.6], image: "Player2", name: "Pekka", color: Color("Color1")),
    Player(id: 2, powers: [0.5,0.4,0.8], image: "Player3", name: "Barberian", color: Color("Color1"))
]
