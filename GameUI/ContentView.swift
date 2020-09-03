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
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Text("Your Players")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top)

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 10) {
                    ForEach(data) { i in
                        withAnimation {
                            Card(data: i)
                        }
                    }
                }
            })
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Card: View {
    var data: Player
    var body: some View {
        HStack {
            Image(data.image)
                .resizable()
                .frame(width: screen.width / 1.8)

            Spacer()

            VStack(spacing: 20) {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            data.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0.0, to: data.powers[0])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())

                Image(systemName: "suit.heart.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            data.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0, to: data.powers[1])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())

                Image(systemName: "hammer.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            data.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0, to: data.powers[2])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())

                Spacer(minLength: 0)

                Button(action: {}) {
                    Text("See Details")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 17)
                        .background(Capsule().stroke(Color.blue, lineWidth: 2))
                }
                Spacer(minLength: 0)
            }
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.2)
                .cornerRadius(25)
                .rotation3DEffect(
                    .init(degrees: 20),
                    axis: (x: 0.0, y: -1.0, z: 0.0)
                )
        )
        .padding(.vertical, 35)
        .padding(.trailing, 35)
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
    Player(id: 0, powers: [0.4, 0.6, 0.9], image: "Player1", name: "Bomb Raider", color: Color("Color")),
    Player(id: 1, powers: [0.3, 0.5, 0.6], image: "Player2", name: "Pekka", color: Color("Color1")),
    Player(id: 2, powers: [0.5, 0.4, 0.8], image: "Player3", name: "Barberian", color: Color("Color1")),
]

let screen = UIScreen.main.bounds
