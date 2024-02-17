//
//  Chapter.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//  Copyright © 2023 Digital Tools Ltd. All rights reserved.
//

import Foundation

public struct Chapter: Decodable {
    public let title: SimpleText
    public let timeRangeStartMillis: Int
    public var timeRangeEndMillis: Int?
    public let thumbnail: Thumbnail?

    public init(title: SimpleText,
                timeRangeStartMillis: Int,
                timeRangeEndMillis: Int? = nil,
                thumbnail: Thumbnail? = nil) {
        self.title = title
        self.timeRangeStartMillis = timeRangeStartMillis
        self.timeRangeEndMillis = timeRangeEndMillis
        self.thumbnail = thumbnail
    }
}
