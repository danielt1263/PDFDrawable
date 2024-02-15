//
//  Text.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation
import UIKit

public struct Text: PDFDrawable {
    public let size: CGSize
    let attributedString: NSAttributedString

    public init(text: String, weight: UIFont.Weight = .regular, alignment: NSTextAlignment = .natural, width: CGFloat) {
        let font = UIFont.systemFont(ofSize: 12, weight: weight)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        let attributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        self.attributedString = NSAttributedString(string: text, attributes: attributes)
        self.size = CGSize(width: width, height: attributedString.height(containerWidth: width))
    }

    public func draw(context _: UIGraphicsPDFRendererContext, origin: CGPoint) {
        attributedString.draw(in: CGRect(origin: origin, size: size))
    }
}

extension NSAttributedString {
    func height(containerWidth: CGFloat) -> CGFloat {
        let rect = boundingRect(
            with: CGSize(width: containerWidth, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        return ceil(rect.size.height)
    }
}
