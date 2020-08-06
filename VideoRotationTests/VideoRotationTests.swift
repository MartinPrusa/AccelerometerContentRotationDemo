//
//  VideoRotationTests.swift
//  VideoRotationTests
//
//  Created by Martin Prusa on 06.08.2020.
//

import XCTest
@testable import VideoRotation

class VideoRotationTests: XCTestCase {

    func testExample() throws {
        let videoUrl = Bundle.main.url(forResource: "rodney-thps3", withExtension: "mp4")
        XCTAssertFalse(videoUrl == nil)
    }
}
