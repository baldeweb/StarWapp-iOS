//
//  FontUtils.swift
//  StarWapp
//
//  Created by Trabalho on 08/06/22.
//

import Foundation
import UIKit

extension UIFont {

    public enum LatoType: String {
        case regular = "-regular"
        case bold = "-bold"
    }

    static func Lato(_ type: LatoType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "lato\(type.rawValue)", size: size)!
    }

    static func Krungthep(size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "krungthep", size: size)!
    }
    
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
}
