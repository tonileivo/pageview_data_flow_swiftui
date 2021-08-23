//
//  PlayPlayerCell.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import SwiftUI

struct PlayPlayerCell: View {
  @ObservedObject var viewModel: PlayTabViewModel

  @State var playerIndex: Int
  @State var courseIndex: Int

  @State var currentScore: Int = 0
  @State var plusValue: Int = 0
  @State var plusMinusPar: Int = 0
  @State var totalPar: Int = 0


  var par: Int {
    return viewModel.course.holes[courseIndex].par ?? 3
  }

    var body: some View {
        ZStack {
          Rectangle()
            .frame(height: 80)
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
              if plusMinusPar >= 1 {
                Text("+\(plusMinusPar)  (\(totalPar))")
                  .padding(.top, 1)
              } else {
                Text("\(plusMinusPar)  (\(totalPar))")
                  .padding(.top, 1)
              }
            }

            Spacer()

            HStack(spacing: 12) {
              Button(action: {
                scoreMinusTap()
              }, label: {
                Image(systemName: "minus")
                  .resizable()
                  .foregroundColor(.black)
                  .frame(width: 32, height: 2)
              })

              Text(currentScore == 0 ? "\(par)" : "\(currentScore)")
                .font(.system(size: 32, weight: .bold))

              Button(action: {
                scorePlusTap()
              }, label: {
                Image(systemName: "plus")
                  .resizable()
                  .foregroundColor(.black)
                  .frame(width: 32, height: 32)
              })
            }

          }.padding()
        }
        .padding(.leading)
        .padding(.trailing)

      }
}

extension PlayPlayerCell {
  fileprivate func scorePlusTap() {
    currentScore = par
    plusValue += 1
    currentScore += plusValue

    totalPar = currentScore
    plusMinusPar = plusValue
  }

  fileprivate func scoreMinusTap() {
    if currentScore != 1 {
      currentScore = par
      plusValue -= 1
      currentScore += plusValue

      totalPar = currentScore
      plusMinusPar = plusValue

    }
  }
}
