//
//  PDFDrawable.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation
import PDFKit

public protocol PDFDrawable {
    var size: CGSize { get }
    func draw(context: DrawContext, origin: CGPoint)
}

public extension PDFDrawable {
    func draw(context: DrawContext) {
        draw(context: context, origin: CGPoint.zero)
    }
}
