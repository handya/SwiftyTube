//
//  CaptionFormat.swift
//  SwiftyTube
//
//  Created by Andrew Farquharson on 21/10/2024.
//

import Foundation

public enum CaptionFormat: String {
    case vtt
    case ttml
    case srv3
    case srv2
    case srv1
    case json3
}

// MARK: - Codable

extension CaptionFormat: Codable { }

// MARK: - CaseIterable

extension CaptionFormat: CaseIterable { }

// MARK: - Computed

public extension CaptionFormat {
    var name: String {
        switch self {
        case .vtt:
            return "WebVTT"
        case .ttml:
            return "Timed Text Markup Language"
        case .srv3:
            return "Structured Real-time Voice 3"
        case .srv2:
            return "Structured Real-time Voice 2"
        case .srv1:
            return "Structured Real-time Voice `"
        case .json3:
            return "JSON"
        }
    }
}
