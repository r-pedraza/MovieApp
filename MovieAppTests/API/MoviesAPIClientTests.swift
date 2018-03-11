import XCTest

class MoviesAPIClientTests: XCTestCase {

    func testAPIFetchMovies() {
        let expectation = XCTestExpectation(description: "Tests movies API!!")
        let api = MoviesAPIClient()
        api.getMovies(completionhandler: { data in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }) { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
