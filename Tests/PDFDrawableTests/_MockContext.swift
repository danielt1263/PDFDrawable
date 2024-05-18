//
//  MockContext.swift
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import CoreGraphics
import Foundation
import PDFDrawable

struct MockContext: DrawContext {
    let _drawBox: (CGFloat, CGColor, CGPoint, CGSize) -> Void
    let _drawString: (NSAttributedString, CGPoint, CGSize) -> Void

    func drawBox(lineWidth: CGFloat, strokeColor: CGColor, origin: CGPoint, size: CGSize) {
        _drawBox(lineWidth, strokeColor, origin, size)
    }

    func drawString(attributedString: NSAttributedString, origin: CGPoint, size: CGSize) {
        _drawString(attributedString, origin, size)
    }
}
