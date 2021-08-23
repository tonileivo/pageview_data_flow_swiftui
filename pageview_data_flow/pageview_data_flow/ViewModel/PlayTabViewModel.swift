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

  init(course: Course, players: [Player]) {
    self.course = course
    self.players = players
  }
}
