//
//  Empty.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import CoreGraphics
import Foundation

public struct Empty: PDFDrawable {
    public let size: CGSize

    public init(size: CGSize = .zero) {
        self.size = size
    }

    public func draw(origin: CGPoint) -> [DrawCommand] { [] }
}
