//
//  ContentView.swift
//  Moonshot
//
//  Created by Chris Bata on 6/30/22.
//

import SwiftUI


struct ContentView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationView {
            GridLayout(missions: missions, astronauts: astronauts)
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(missions) { mission in
//                        NavigationLink {
//                            MissionView(mission: mission, astronauts: astronauts)
//                        } label: {
//                            VStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100)
//                                    .padding()
//
//                                VStack {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
//                                        .foregroundColor(.white.opacity(0.5))
//
//                                }
//                                .padding(.vertical)
//                                .frame(maxWidth: .infinity)
//                                .background(.lightBackground)                            }
//                        }
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(.lightBackground)
//                        )
//
//                    }
//                }
//                .padding([.horizontal, .bottom])
//            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
