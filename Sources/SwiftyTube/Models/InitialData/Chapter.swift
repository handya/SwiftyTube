//
//  Chapter.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public struct Chapter: Decodable {
    let title: SimpleText
    let timeRangeStartMillis: Int
    var timeRangeEndMillis: Int?
    let thumbnail: Thumbnail?
}
