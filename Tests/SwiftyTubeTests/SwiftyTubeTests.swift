import XCTest
@testable import SwiftyTube

final class SwiftyTubeTests: XCTestCase {

    enum MockDataError: Error {
        case fileNotFound
    }

    func loadMockData(name: String) throws -> String {
        guard let filePath = Bundle.module.path(forResource: name, ofType: "html") else {
            throw MockDataError.fileNotFound
        }
        return try String(contentsOfFile: filePath, encoding: .utf8)
    }

    func testLoadingResponse() throws {
        XCTAssertNoThrow(try SwiftyTubeResponse(page: loadMockData(name: "mock_data")), "Failed to parse data")
    }

    func testSubtitles() throws {
        let response: SwiftyTubeResponse = try .init(page: loadMockData(name: "mock_data"))

        XCTAssertNotNil(response.initialPlayerResponse.captions, "captions not found")

        XCTAssertEqual(response.initialPlayerResponse.captions?.count, 2)

        XCTAssertEqual(response.initialPlayerResponse.playabilityStatus?.status, .ok)
    }

    func testPlayabilityStatus() throws {
        let response: SwiftyTubeResponse = try .init(page: loadMockData(name: "age_restricted"))
        XCTAssertEqual(response.initialPlayerResponse.playabilityStatus?.status, .loginRequired)
    }
}
