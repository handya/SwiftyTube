//
//  File.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public struct InitialPlayerResponse {
    public let videoDetails: VideoDetails?
    public let playerCaptions: PlayerCaptions?
}

public extension InitialPlayerResponse {
    var captions: [Caption]? {
        return playerCaptions?.playerCaptionsTracklistRenderer.captionTracks
    }
}

// MARK: - Decodable

extension InitialPlayerResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case videoDetails
        case playerCaptions = "captions"
    }

    public init(from string: String) throws {
        // Original 'ytInitialPlayerResponse\s*=\s*({.+?})\s*;'
        let pattern = "ytInitialPlayerResponse\\s*=\\s*\\{(.+?)\\}\\s*;"

        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: string.utf16.count)
        guard let match = regex.firstMatch(in: string, options: [], range: range),
                let idRange = Range(match.range(at: 1), in: string) else {
            throw SwiftyTubeError.initialPlayerResponseNotFound
        }
        let jsonString: String = "{" + String(string[idRange]) + "}"

        guard let jsonData = jsonString.data(using: .utf8) else {
            throw SwiftyTubeError.initialPlayerResponseInvalidJson
        }

        self = try JSONDecoder().decode(InitialPlayerResponse.self, from: jsonData)
    }
}
