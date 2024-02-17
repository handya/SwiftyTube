import XCTest
@testable import SwiftyTube

final class SwiftyTubeTests: XCTestCase {
    func loadMockData() throws -> String {
        guard let filePath = Bundle.module.path(forResource: "mock_data", ofType: "html") else {
            return "Mock HTML file not found"
        }
        return try String(contentsOfFile: filePath, encoding: .utf8)
    }

    func testLoadingResponse() throws {
        XCTAssertNoThrow(try SwiftyTubeResponse(page: loadMockData()), "Failed to parse data")
    }

    func testSubtitles() throws {
        let response: SwiftyTubeResponse = try .init(page: loadMockData())

        XCTAssertNotNil(response.initialPlayerResponse.captions, "captions not found")

        XCTAssertEqual(response.initialPlayerResponse.captions?.count, 2)
    }
}
