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

  @State var perValue: Int = 0
  @State  var plusMinusPar: Int = 0
  @State var totalPar: Int = 0

  @State var par: Int = 0

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

          Text(perValue == 0 ? "-" : "\(perValue)")
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
    .onAppear {
      perValue = par
      plusMinusPar = viewModel.feedPlayer[playerIndex].plusMinusPar
      totalPar = viewModel.feedPlayer[playerIndex].totalPar
      viewModel.feedPlayer[playerIndex].playerName = viewModel.players[playerIndex].playerName
      viewModel.feedPlayer[playerIndex].scores[courseIndex].hole = courseIndex + 1
    }
    .onDisappear(perform: {
      viewModel.feedPlayer[playerIndex].plusMinusPar = plusMinusPar
      viewModel.feedPlayer[playerIndex].totalPar = totalPar
      viewModel.feedPlayer[playerIndex].scores[courseIndex].score = par
    })
    .onChange(of: viewModel.feedPlayer[playerIndex].totalPar, perform: { data in
      totalPar = data
    })
    .onChange(of: viewModel.feedPlayer[playerIndex].plusMinusPar) { data in
      plusMinusPar = data
    }

  }
}

extension PlayPlayerCell {
  fileprivate func scorePlusTap() {
    if par > 0 {
      par += 1
      totalPar += 1
      plusMinusPar += 1
    } else {
      par = viewModel.course.holes[courseIndex].par ?? 0
      totalPar += viewModel.course.holes[courseIndex].par ?? 0
    }
    perValue = par
    viewModel.feedPlayer[playerIndex].plusMinusPar = plusMinusPar
    viewModel.feedPlayer[playerIndex].totalPar = totalPar
    viewModel.feedPlayer[playerIndex].scores[courseIndex].score = par
  }

  fileprivate func scoreMinusTap() {

    if perValue != 0  {
      if par >= 2 {
        if par > 0 {
          totalPar -= 1
          plusMinusPar -= 1
          par -= 1
        } else {
          par = viewModel.course.holes[courseIndex].par ?? 0
          plusMinusPar -= 1
          par -= 1
          totalPar -= 1
        }
        perValue = par
        viewModel.feedPlayer[playerIndex].plusMinusPar = plusMinusPar
        viewModel.feedPlayer[playerIndex].totalPar = totalPar
        viewModel.feedPlayer[playerIndex].scores[courseIndex].score = par
      }
    }
  }
}
