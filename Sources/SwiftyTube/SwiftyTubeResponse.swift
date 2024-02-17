//
//  SwiftyTubeResponse.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//  Copyright © 2023 Digital Tools Ltd. All rights reserved.
//

import Foundation

public struct SwiftyTubeResponse {
    public let initialPlayerResponse: InitialPlayerResponse
    public let initialData: InitialData

    public init(page: String) throws {
        self.initialPlayerResponse = try .init(from: page)
        self.initialData = try .init(from: page)
    }
}
