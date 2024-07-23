//
//  VideoInitialData.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//  Copyright © 2023 Digital Tools Ltd. All rights reserved.
//

import Foundation

public struct VideoInitialData {
    let playerOverlays: PlayerOverlays?
}

// MARK: - Decodable

extension VideoInitialData: Decodable {
    public init(from string: String) throws {
        // Original '(?:window\s*\[\s*["\']ytInitialData["\']\s*\]|ytInitialData)\s*=\s*({.+?})\s*;'
        let pattern =  #"ytInitialData\s*=\s*(\{.*?\});"#

        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: string.utf16.count)
        guard let match = regex.firstMatch(in: string, options: [], range: range),
                let idRange = Range(match.range(at: 1), in: string) else {
            throw SwiftyTubeError.initialDataResponseNotFound
        }

        guard let jsonData = String(string[idRange]).data(using: .utf8) else {
            throw SwiftyTubeError.initialDataResponseInvalidJson
        }

        self = try JSONDecoder().decode(VideoInitialData.self, from: jsonData)
    }
}

// MARK: - Computed

public extension VideoInitialData {
    var chapters: [Chapter]? {
        return playerOverlays?
            .playerOverlayRenderer?
            .decoratedPlayerBarRenderer?
            .decoratedPlayerBarRenderer?
            .playerBar?
            .multiMarkersPlayerBarRenderer?
            .chapters
    }
}
