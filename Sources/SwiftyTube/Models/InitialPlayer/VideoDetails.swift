//
//  VideoDetails.swift
//  
//
//  Created by Andrew Farquharson on 18/06/23.
//

import Foundation

public struct VideoDetails: Decodable {
    public let videoId: String?
    public let title: String?
    public let lengthSeconds: String?
    public let keywords: [String]?
    public let channelId: String?
    public let isOwnerViewing: Bool?
    public let shortDescription: String?
    public let thumbnail: Thumbnail?
    public let allowRatings: Bool?
    public let viewCount: String?
    public let author: String?
    public let isLowLatencyLiveStream: Bool?
    public let isPrivate: Bool?
    public let isUnpluggedCorpus: Bool?
    public let latencyClass: String?
    public let isLiveContent: Bool?
}
