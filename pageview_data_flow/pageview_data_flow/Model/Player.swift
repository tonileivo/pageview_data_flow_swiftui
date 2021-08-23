//
//  Player.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import Foundation

class Player: Identifiable {
  let id: String
  let playerName: String

  init(id: String, playerName: String) {
    self.id = id
    self.playerName = playerName
  }
}
