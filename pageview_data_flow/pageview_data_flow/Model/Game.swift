//
//  Game.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 10.9.2021.
//

import Foundation

struct Game {

  let id: String
  let courseName: String
  let ownerUid: String
  let players: [Player]


  struct Player {
    var id: String
    var playerName: String
    var plusMinusPar: Int
    var totalPar: Int
    var scores: [Score]


    struct Score {
      var hole: Int
      var score: Int
    }
  }

}
