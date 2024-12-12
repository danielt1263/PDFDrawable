//
//  EmptyTests.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFDrawable
import XCTest

final class EmptyTests: XCTestCase {
    func test() {
        let empty = Empty(size: .init(width: 10, height: 10))
        let actual = empty.draw()
        XCTAssertEqual(actual, [])
    }
}
