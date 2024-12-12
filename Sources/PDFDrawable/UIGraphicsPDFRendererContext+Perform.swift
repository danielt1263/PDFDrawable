//
//  UIGraphicsPDFRendererContext+Perform.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 12 Dec 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import PDFKit

extension UIGraphicsPDFRendererContext {
    public func perform(_ commands: [DrawCommand]) {
        for each in commands {
            perform(each)
        }
    }

    public func perform(_ command: DrawCommand) {
        switch command {
        case let .drawBox(lineWidth, strokeColor, origin, size):
            drawBox(lineWidth: lineWidth, strokeColor: strokeColor, origin: origin, size: size)
        case let .drawString(attributedString, origin, size):
            drawString(attributedString: attributedString, origin: origin, size: size)
        }
    }
}

extension UIGraphicsPDFRendererContext {
    func drawBox(lineWidth: CGFloat, strokeColor: CGColor, origin: CGPoint, size: CGSize) {
        let cgContext = cgContext
        cgContext.saveGState()
        cgContext.setLineWidth(lineWidth)
        cgContext.setStrokeColor(strokeColor)
        cgContext.addRect(CGRect(origin: origin, size: size))
        cgContext.strokePath()
        cgContext.restoreGState()
    }

    func drawString(attributedString: NSAttributedString, origin: CGPoint, size: CGSize) {
        attributedString.draw(in: CGRect(origin: origin, size: size))
    }
}
