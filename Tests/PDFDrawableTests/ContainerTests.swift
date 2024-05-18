//
//  ContainerTests.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFDrawable
import XCTest

final class ContainerTests: XCTestCase {
    func test() {
        var calledCount = 0
        let container = Container {
            Box(size: .init(width: 10, height: 10), lineWidth: 1, strokeColor: UIColor.black.cgColor)
            Box(size: .init(width: 20, height: 20), lineWidth: 2, strokeColor: UIColor.white.cgColor)
        }
        let context = MockContext(
            _drawBox: { _, _, origin, _ in
                XCTAssertEqual(origin, CGPoint.zero)
                calledCount += 1
            },
            _drawString: { text, origin, size in
                XCTFail()
            }
        )
        container.draw(context: context)
        XCTAssertEqual(calledCount, 2)
    }
}
