//
//  ContentView.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import SwiftUI

struct ContentView: View {

  let courseData = Course(holes: [Hole(name: "Hole 1", par: 3),
                                  Hole(name: "Hole 2", par: 4),
                                  Hole(name: "Hole 3", par: 3),
                                  Hole(name: "Hole 4", par: 4),
                                  Hole(name: "Hole 5", par: 3),
                                  Hole(name: "Hole 6", par: 3)])

  let playersData = [Player(id: UUID().uuidString, playerName: "Player 1"),
                     Player(id: UUID().uuidString, playerName: "Player 2"),
                     Player(id: UUID().uuidString, playerName: "Player 3"),
                     Player(id: UUID().uuidString, playerName: "Player 4")]
  
    var body: some View {
      NavigationView {
        VStack {
          NavigationLink(
            destination: PlayTabView(viewModel: PlayTabViewModel(course: courseData, players: playersData)),
            label: {
              Text("Start")
            })
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
