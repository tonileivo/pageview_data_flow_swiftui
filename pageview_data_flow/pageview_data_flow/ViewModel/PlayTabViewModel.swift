//
//  ContentViewModel.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import SwiftUI

class PlayTabViewModel: ObservableObject {
  @Published var course: Course
  @Published var players: [Player]
  @Published var feed: Game?
  @Published var feedPlayer: [Game.Player]


  init(course: Course, players: [Player]) {
    self.course = course
    self.players = players

    var feedScore = [Game.Player.Score]()
    for _ in 1...course.holes.count {
      feedScore.append(Game.Player.Score(hole: 0, score: 0))
    }
    self.feedPlayer = players.map { Game.Player(id: $0.id, playerName: $0.playerName, plusMinusPar: 0, totalPar: 0, scores: feedScore)}
  }
}
