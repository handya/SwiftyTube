//
//  SwiftyTubeError.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//  Copyright © 2023 Digital Tools Ltd. All rights reserved.
//

import Foundation

public enum SwiftyTubeError: Error {
    case initialPlayerResponseNotFound
    case initialPlayerResponseInvalidJson
    case initialDataResponseNotFound
    case initialDataResponseInvalidJson
}
