//
//  MultiMarkersPlayerBarRenderer.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public struct MultiMarkersPlayerBarRenderer: Decodable {
    let markersMap: [MarkerMap]?

    var chapters: [Chapter]? {
        guard let first = markersMap?.first(where: { $0.key == "DESCRIPTION_CHAPTERS" }),
                var chapters = first.value?.chapters.map({ $0.chapterRenderer }) else {
            return nil
        }
        chapters.sort(by: { $0.timeRangeStartMillis > $1.timeRangeStartMillis })
        var lastChapter: Chapter?
        for (i, chapter) in chapters.enumerated() {
            chapters[i].timeRangeEndMillis = lastChapter?.timeRangeStartMillis
            lastChapter = chapter
        }
        chapters.sort(by: { $0.timeRangeStartMillis < $1.timeRangeStartMillis })
        return chapters
    }
}
