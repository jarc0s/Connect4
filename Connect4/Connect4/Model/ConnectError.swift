//
//  ConnectError.swift
//  Connect4
//
//  Created by Juan Arcos on 12/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

enum ErrorConnect4: Error {
  case jsonCodingError(String)
  case errorFetchFromFirebase
}
