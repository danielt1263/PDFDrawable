//
//  DrawContext.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 17 May 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import CoreGraphics
import Foundation

public enum DrawCommand: Equatable {
    case drawBox(lineWidth: CGFloat, strokeColor: CGColor, origin: CGPoint, size: CGSize)
    case drawString(attributedString: NSAttributedString, origin: CGPoint, size: CGSize)
}
