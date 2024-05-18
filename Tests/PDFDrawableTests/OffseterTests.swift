//
//  OffseterTests.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFDrawable
import XCTest

final class OffseterTests: XCTestCase {
    func test() {
        var calledCount = 0
        let offseter = Offseter(x: 2, y: 3, drawable: Box(size: .init(width: 10, height: 20), lineWidth: 5, strokeColor: UIColor.black.cgColor))
        let context = MockContext(
            _drawBox: { _, _, origin, _ in
                XCTAssertEqual(origin, CGPoint(x: 2, y: 3))
                calledCount += 1
            },
            _drawString: { text, origin, size in
                XCTFail()
            }
        )
        offseter.draw(context: context)
        XCTAssertEqual(calledCount, 1)
    }
}
