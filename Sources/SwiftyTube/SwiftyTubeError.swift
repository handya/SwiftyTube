//
//  SwiftyTubeError.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public enum SwiftyTubeError: Error {
    case initialPlayerResponseNotFound
    case initialPlayerResponseInvalidJson
    case initialDataResponseNotFound
    case initialDataResponseInvalidJson
}
