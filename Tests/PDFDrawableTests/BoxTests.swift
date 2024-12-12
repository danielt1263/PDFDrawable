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
        let box = Box(size: .init(width: 10, height: 10), lineWidth: 1, strokeColor: UIColor.black.cgColor)
        let actual = box.draw()
        XCTAssertEqual(
            actual,
            [
                .drawBox(
                    lineWidth: 1,
                    strokeColor: UIColor.black.cgColor,
                    origin: .zero,
                    size: CGSize(width: 10, height: 10)
                )
            ]
        )
    }
}
