//
//  File.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public struct Caption {
    public let url: String
    public let baseUrl: String
    public let languageCode: String
    public let isTranslatable: Bool?
    public let name: String?
    public let expires: Date?
}

// MARK: - Codable

extension Caption: Codable {
    private enum CodingKeys: String, CodingKey {
        case baseUrl
        case languageCode
        case isTranslatable
        case name
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseUrl = try container.decode(String.self, forKey: .baseUrl)
        if baseUrl.hasPrefix("http") {
            self.url = baseUrl
        } else {
            self.url = "https://www.youtube.com" + baseUrl
        }
        self.languageCode = try container.decode(String.self, forKey: .languageCode)
        self.isTranslatable = try container.decodeIfPresent(Bool.self, forKey: .isTranslatable)
        if let name = try? container.decode(SimpleText.self, forKey: .name).text {
            self.name = name
        } else if let name = try? container.decode(String.self, forKey: .name) {
            self.name = name
        } else {
            self.name = self.languageCode
        }

        if let components = URLComponents(string: url),
              let time = components.queryItems?.first(where: { $0.name == "expire" })?.value,
              let timeInterval = TimeInterval(time) {
            self.expires = Date(timeIntervalSince1970: timeInterval)
        } else {
            self.expires = nil
        }
    }
}

public extension Array where Element == Caption {
    var expires: Date? {
        return first(where: { $0.expires != nil })?.expires
    }
}
