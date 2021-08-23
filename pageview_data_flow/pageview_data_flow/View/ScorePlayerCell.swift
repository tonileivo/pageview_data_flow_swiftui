//
//  ScorePlayerCell.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import SwiftUI

struct ScorePlayerCell: View {
  @ObservedObject var viewModel: ScoresViewModel

  @State var playerIndex: Int


    var body: some View {
        ZStack {
          Rectangle()
            .frame(height: 160)
            .foregroundColor(Color(.secondarySystemBackground))
            .cornerRadius(8)

          HStack(spacing: 12) {
            Image(systemName: "person")
              .resizable()
              .frame(width: 48, height: 48)
              .clipShape(Circle())
              .padding(.leading, 2)

            VStack {
              Text(viewModel.players[playerIndex].playerName)
                .font(.system(size: 26, weight: .semibold))
                .minimumScaleFactor(0.75)

              HStack {
                ForEach(0..<viewModel.scores.count) { score in
                  VStack {
                    Text("\(viewModel.scores[score].hole)")
                    Text("\(viewModel.scores[score].score)")
                  }
                }
              }
              
            }

            Spacer()

          }.padding()
        }
        .padding(.leading)
        .padding(.trailing)

      }
}
