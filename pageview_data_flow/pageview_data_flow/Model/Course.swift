//
//  Course.swift
//  pageview_data_flow
//
//  Created by Toni Leivo on 23.8.2021.
//

import Foundation

class Course {
  let holes: [Hole]

  init(holes: [Hole]) {
    self.holes = holes
  }
}

class Hole {
  let name: String
  let par: Int?

  init(name: String, par: Int) {
    self.name = name
    self.par = par
  }
}
