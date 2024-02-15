//
//  PDFDrawableBuilder.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation

@resultBuilder public enum PDFDrawableBuilder {
    public static func buildBlock(_ drawables: [PDFDrawable]...) -> [PDFDrawable] { drawables.flatMap { $0 } }
    public static func buildEither(first drawables: [PDFDrawable]) -> [PDFDrawable] { drawables }
    public static func buildEither(second drawables: [PDFDrawable]) -> [PDFDrawable] { drawables }
    public static func buildExpression(_ drawable: PDFDrawable) -> [PDFDrawable] { [drawable] }
    public static func buildExpression(_ drawables: [PDFDrawable]) -> [PDFDrawable] { drawables }
    public static func buildOptional(_ drawables: [PDFDrawable]?) -> [PDFDrawable] { drawables ?? [] }
}
