//
//  VStackTests.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFDrawable
import XCTest

final class VStackTests: XCTestCase {
    func test_boxes_stacked_vertically() {
        let vStack = VStack {
            Box(size: .init(width: 10, height: 10), lineWidth: 1, strokeColor: UIColor.black.cgColor)
            Box(size: .init(width: 20, height: 20), lineWidth: 2, strokeColor: UIColor.white.cgColor)
        }
        let actual = vStack.draw()
        XCTAssertEqual(actual.map(\.origin), [.zero, .init(x: 0, y: 10)])
    }
}
