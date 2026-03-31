//
//  Spacing.swift
//  situEnglish
//
//  Created by samatar barkadleh on 3/27/26.
//

import SwiftUI

enum Spacing {
    
    // MARK: - Layout (margins, padding, gaps)
    enum Layout {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 24
        static let xxxl: CGFloat = 32
    }
    
    // MARK: - Text Sizes
    enum TextSize {
        static let caption: CGFloat = 13
        static let body: CGFloat = 17
        static let h3: CGFloat = 22
        static let h2: CGFloat = 28
        static let h1: CGFloat = 34
    }
    
    // MARK: - Line Heights
    enum LineHeight {
        static let caption: CGFloat = 4
        static let body: CGFloat = 6
        static let heading: CGFloat = 2
        static let button: CGFloat = 0
    }

    // MARK: - Radius
    enum Radius {
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let full: CGFloat = 999
    }

    // MARK: - Spinner Sizes
    enum SpinnerSize {
        case small
        case medium
        case large

        var diameter: CGFloat {
            switch self {
            case .small:
                return 20
            case .medium:
                return 28
            case .large:
                return 36
            }
        }

        var lineWidth: CGFloat {
            switch self {
            case .small:
                return 2.5
            case .medium:
                return 3
            case .large:
                return 4
            }
        }
    }
}
