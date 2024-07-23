//
//  MarkerMap.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//  Copyright © 2023 Digital Tools Ltd. All rights reserved.
//

import Foundation

public struct MarkerMap: Decodable {
    let key: String
    let value: ChapterValue?

    private enum CodingKeys: String, CodingKey {
        case key
        case value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(String.self, forKey: .key)
        if self.key == "DESCRIPTION_CHAPTERS" {
            self.value = try container.decode(ChapterValue.self, forKey: .value)
        } else {
            self.value = nil
        }
    }
}
