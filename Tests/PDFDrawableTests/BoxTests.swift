//
//  BoxTests.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFDrawable
import XCTest

final class BoxTests: XCTestCase {
    func test() {
        var called = false
        let box = Box(size: .init(width: 10, height: 10), lineWidth: 1, strokeColor: UIColor.black.cgColor)
        let context = MockContext(
            _drawBox: { lineWidth, strokeColor, origin, size in
                XCTAssertEqual(lineWidth, 1)
                XCTAssertEqual(strokeColor, UIColor.black.cgColor)
                XCTAssertEqual(origin, CGPoint.zero)
                XCTAssertEqual(size, CGSize(width: 10, height: 10))
                called = true
            },
            _drawString: { text, origin, size in
                XCTFail()
            }
        )
        box.draw(context: context)
        XCTAssertTrue(called)
    }
}
