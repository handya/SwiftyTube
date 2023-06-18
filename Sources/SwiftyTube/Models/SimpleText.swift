//
//  SimpleText.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public struct SimpleText: Decodable {
    let text: String

    private enum CodingKeys: String, CodingKey {
        case simpleText
        case runs
    }

    // Examples:
    // "name":{"simpleText":"English (United States)"}
    // "name":{"runs":[{"text":"English (auto-generated)"}]}
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        struct Run: Decodable {
            let text: String
        }

        do {
            self.text = try container.decode(String.self, forKey: .simpleText)
        } catch {
            if let runs = try container.decodeIfPresent([Run].self, forKey: .runs), let text = runs.first?.text {
                self.text = text
            } else {
                throw error
            }
        }
    }
}

