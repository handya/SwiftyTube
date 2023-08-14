//
//  CaptionKind.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public enum CaptionKind: String {
    // A caption track generated using automatic speech recognition.
    case asr

    // A caption track that plays when no other track is selected in the player. 
    // For example, a video that shows aliens speaking in an alien language might 
    // have a forced caption track to only show subtitles for the alien language.
    case forced

    // A regular caption track. This is the default value.
    case standard

    case unknown
}

extension CaptionKind: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        self = CaptionKind(rawValue: raw) ?? .unknown
    }
}
