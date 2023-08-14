//
//  CaptionKind.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public enum CaptionKind: String {
    case asr
    case unknown
}

extension CaptionKind: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        self = CaptionKind(rawValue: raw) ?? .unknown
    }
}