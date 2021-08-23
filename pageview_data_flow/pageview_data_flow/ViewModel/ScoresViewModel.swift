//
//  ScoresViewModel.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import SwiftUI

class ScoresViewModel: ObservableObject {
  @Published var players: [Player]
  @Published var scores: [Score]

  init(scores: [Score], players: [Player]) {
    self.scores = scores
    self.players = players
  }
}
