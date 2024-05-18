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
        let context = MockContext(
            _drawBox: { lineWidth, strokeColor, origin, size in
                XCTFail()
            },
            _drawString: { text, origin, size in
                XCTFail()
            }
        )
        empty.draw(context: context)
    }
}
