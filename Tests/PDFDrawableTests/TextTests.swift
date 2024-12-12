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
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        let attributedString = NSAttributedString(string: "Hello World!", attributes: attributes)

        let text = Text(text: "Hello World!", font: .systemFont(ofSize: 12), alignment: .left, width: 144)
        let actual = text.draw()
        XCTAssertEqual(actual, [
            .drawString(attributedString: attributedString, origin: .zero, size: CGSize(width: 144, height: 15))
        ])
    }
}
