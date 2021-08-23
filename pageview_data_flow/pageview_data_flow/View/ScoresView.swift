//
//  ScoresView.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import SwiftUI

struct ScoresView: View {
  @ObservedObject var viewModel: ScoresViewModel

    var body: some View {
      VStack {
        ScrollView {
          ForEach(0..<viewModel.players.count) { player in
            ScorePlayerCell(viewModel: viewModel, playerIndex: player)
          }
        }
      }
    }
}
