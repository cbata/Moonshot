//
//  HorizontalScroll.swift
//  Moonshot
//
//  Created by Chris Bata on 8/1/22.
//

import SwiftUI

struct HorizontalScroll: View {
    let crew: [MissionView.CrewMember]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 5)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)

                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }    }
}

struct HorizontalScroll_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        let crew: [MissionView.CrewMember] = missions[0].crew.map { member in
            if let astronaut = astronauts[member.name] {
                return MissionView.CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }

        }

        HorizontalScroll(crew: crew)
    }
}
