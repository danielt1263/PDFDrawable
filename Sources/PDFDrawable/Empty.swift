//
//  Empty.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation
import PDFKit

public struct Empty: PDFDrawable {
    public let size = CGSize.zero

    public func draw(context _: UIGraphicsPDFRendererContext, origin _: CGPoint) { }
}
