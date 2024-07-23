//
//  SwiftyTubeAgent.swift
//
//
//  Created by Andrew Farquharson on 24/07/2024.
//

import Foundation

public enum SwiftyTubeAgent {
    public static func generate() -> String {
        let platforms = [
            "Macintosh; Intel Mac OS X", "iPhone; CPU iPhone OS", "iPad; CPU OS", "X11; Linux x86_64"
        ]

        let osVersions = [
            "10_15_7", "13_4", "16_0_2", "17_4_1", "13_3_1", "16_1", "16_3", "14_8_1", "15_8_1",
            "14_4_2", "16_5_1", "15_4_1", "16_6", "17_3_1", "17_2_1", "15_7_9", "15_7_1", "12_5_7",
            "12_5_6", "14_6", "15_4", "14_5_1", "14_8", "12_3_1", "12_2", "11_3"
        ]

        let webKits = [
            "AppleWebKit/537.36", "AppleWebKit/605.1.15", "AppleWebKit/601.1.46"
        ]

        let geckos = [
            "KHTML, like Gecko"
        ]

        let browsers = [
            "Chrome/114.0.0.0", "Chrome/105.0.0.0", "CriOS/107.0.5304.66", "CriOS/112.0.5615.46",
            "CriOS/117.0.5938.117", "CriOS/115.0.5790.160", "Firefox/118.0", "FxiOS/36.0", "EdgiOS/108.0.1462.77",
            "Version/16.0 Mobile/15E148 Safari/604.1", "Version/13.0.5 Mobile/15E148 Safari/604.1",
            "Version/16.0 Mobile/15E148 Safari/604.1", "Version/17.4.1 Mobile/15E148 Safari/604.1",
            "Version/17.0.1 Mobile/15E148 Safari/604.1", "Version/17.5 Mobile/15E148 Safari/604.1"
        ]

        let randomPlatform = platforms.randomElement()!
        let randomOSVersion = osVersions.randomElement()!
        let randomWebKit = webKits.randomElement()!
        let randomGecko = geckos.randomElement()!
        let randomBrowser = browsers.randomElement()!

        return "Mozilla/5.0 (\(randomPlatform) \(randomOSVersion)) \(randomWebKit) (\(randomGecko)) \(randomBrowser)"
    }
}
