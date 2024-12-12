//
//  OffsetterTests.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFDrawable
import XCTest

final class OffsetterTests: XCTestCase {
    func test_box_offsetted() {
        let offsetter = Offsetter(x: 2, y: 3, drawable: Box(size: .init(width: 10, height: 20), lineWidth: 5, strokeColor: UIColor.black.cgColor))
        let actual = offsetter.draw()
        XCTAssertEqual(actual.map(\.origin), [CGPoint(x: 2, y: 3)])
    }
}
