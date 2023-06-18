//
//  InitialData.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public struct InitialData {
    let playerOverlays: PlayerOverlays?
}

// MARK: - Decodable

extension InitialData: Decodable {
    public init(from string: String) throws {
        // Original '(?:window\s*\[\s*["\']ytInitialData["\']\s*\]|ytInitialData)\s*=\s*({.+?})\s*;'
        let pattern =  #"ytInitialData\s*=\s*(\{.*?\});"#

        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: string.utf16.count)
        guard let match = regex.firstMatch(in: string, options: [], range: range),
                let idRange = Range(match.range(at: 1), in: string) else {

            throw SwiftyTubeError.initialDataResponseNotFound
        }
        let jsonString: String = String(string[idRange])
        guard let jsonData = jsonString.data(using: .utf8) else {

            throw SwiftyTubeError.initialDataResponseInvalidJson
        }

        self = try JSONDecoder().decode(InitialData.self, from: jsonData)
    }
}

public extension InitialData {
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
