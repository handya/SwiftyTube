//
//  PlayabilityStatus.swift
//
//
//  Created by Andrew Farquharson on 24/07/2024.
//

import Foundation

public struct PlayabilityStatus {
    public let status: Status
    public let reason: String?

    public enum Status {
        case unknown(String)
        case ok
        case loginRequired

        public var rawValue: String {
            switch self {
            case .unknown(let string):
                return string
            case .ok:
                return "OK"
            case .loginRequired:
                return "LOGIN_REQUIRED"
            }
        }
    }

    public init(status: Status, reason: String?) {
        self.status = status
        self.reason = reason
    }
}

// MARK: - Codable

extension PlayabilityStatus: Codable {
    private enum CodingKeys: String, CodingKey {
        case status
        case reason
    }
}

// MARK: - PlayabilityStatus.Status

extension PlayabilityStatus.Status: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        switch raw {
        case PlayabilityStatus.Status.ok.rawValue:
            self = .ok
        case PlayabilityStatus.Status.loginRequired.rawValue:
            self = .loginRequired
        default:
            self = .unknown(raw)
        }
    }
}

extension PlayabilityStatus.Status: Equatable {
    public static func ==(lhs: PlayabilityStatus.Status, rhs: PlayabilityStatus.Status) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
