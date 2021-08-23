//
//  PageTabView.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import SwiftUI

struct PlayTabView: View {
  @ObservedObject var viewModel: PlayTabViewModel

  @State var selectedPage = 0

  let scoreData = [Score(hole: 1, score: 4),
                   Score(hole: 2, score: 4),
                   Score(hole: 3, score: 3),
                   Score(hole: 4, score: 3),
                   Score(hole: 5, score: 5),
                   Score(hole: 6, score: 3)]

    var body: some View {
        TabView(selection: $selectedPage) {
          ForEach(0..<viewModel.course.holes.count) { course in
            VStack {
              ZStack {
                Rectangle()
                  .frame(height: 140)
                  .foregroundColor(Color(.secondarySystemBackground))
                  .cornerRadius(8)

                HStack(spacing: 44) {
                  VStack {
                    Text("\(viewModel.course.holes[course].name)")
                      .font(.system(size: 22, weight: .semibold))
                  }
                  VStack {
                    Text("Par")
                      .font(.system(size: 22, weight: .semibold))
                    ZStack {
                      Circle()
                        .frame(width: 72, height: 72)
                        .foregroundColor(.black)
                      Text("\(viewModel.course.holes[course].par ?? 0)")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    }
                  }
                }
              }
              .padding()

              ScrollView {
                ForEach(0..<viewModel.players.count) { player in
                  // I need somehow save scores from player cell and bring them to back to this view
                  // And it need to be saved by player ID to show on next after page changed
                  PlayPlayerCell(viewModel: viewModel, playerIndex: player, courseIndex: course)
                }
              }
              .padding(.bottom, 40)

              if selectedPage == viewModel.course.holes.count - 1 {
                NavigationLink(
                  destination: ScoresView(viewModel: ScoresViewModel(scores: scoreData, players: viewModel.players)),
                  label: {
                    Text("Done")
                      .bold()
                      .frame(width: 280, height: 44)
                      .background(Color.black)
                      .foregroundColor(.white)
                      .cornerRadius(8)
                      .padding(.bottom, 50)
                  })


              }
            }
          }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

    }
}

