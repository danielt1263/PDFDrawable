//
//  TextTests.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFDrawable
import XCTest

final class TextTests: XCTestCase {
    func test() {
        var called = false
        let text = Text(text: "Hello World!", font: .systemFont(ofSize: 12), alignment: .left, width: 144)
        let context = MockContext(
            _drawBox: { lineWidth, strokeColor, origin, size in
                XCTFail()
            },
            _drawString: { text, origin, size in
                XCTAssertEqual(text.string, "Hello World!")
                XCTAssertEqual(origin, CGPoint.zero)
                XCTAssertEqual(size, CGSize(width: 144, height: 15))
                called = true
            }
        )
        text.draw(context: context)
        XCTAssertTrue(called)
    }
}
