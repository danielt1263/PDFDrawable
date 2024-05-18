//
//  DrawContext.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation
import PDFKit

public protocol DrawContext {
    func drawBox(lineWidth: CGFloat, strokeColor: CGColor, origin: CGPoint, size: CGSize)
    func drawString(attributedString: NSAttributedString, origin: CGPoint, size: CGSize)
}

extension UIGraphicsPDFRendererContext: DrawContext {
    public func drawBox(lineWidth: CGFloat, strokeColor: CGColor, origin: CGPoint, size: CGSize) {
        let cgContext = cgContext
        cgContext.saveGState()
        cgContext.setLineWidth(lineWidth)
        cgContext.setStrokeColor(strokeColor)
        cgContext.addRect(CGRect(origin: origin, size: size))
        cgContext.strokePath()
        cgContext.restoreGState()
    }

    public func drawString(attributedString: NSAttributedString, origin: CGPoint, size: CGSize) {
        attributedString.draw(in: CGRect(origin: origin, size: size))
    }
}
