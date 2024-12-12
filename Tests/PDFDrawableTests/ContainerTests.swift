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
        let container = Container {
            Box(size: .init(width: 10, height: 10), lineWidth: 1, strokeColor: UIColor.black.cgColor)
            Box(size: .init(width: 20, height: 20), lineWidth: 2, strokeColor: UIColor.white.cgColor)
        }
        let actual = container.draw()
        XCTAssertTrue(actual.map(\.origin).allSatisfy { $0 == .zero })
    }
}

extension DrawCommand {
    var origin: CGPoint {
        switch self {
        case let .drawBox(_, _, origin, _), let .drawString(_, origin, _):
            return origin
        }
    }
}
