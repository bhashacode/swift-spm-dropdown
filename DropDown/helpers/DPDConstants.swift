//
//  Constants.swift
//  DropDown
//
//  Created by Kevin Hirsch on 28/07/15.
//  Copyright (c) 2015 Kevin Hirsch. All rights reserved.
//

#if os(iOS)

import UIKit

internal struct DPDConstant {

	internal struct KeyPath {

		static let Frame = "frame"

	}

	internal struct ReusableIdentifier {

		static let DropDownCell = "DropDownCell"

	}

	internal struct UI {

		static let TextColor = UIColor.black
        static let SelectedTextColor = UIColor.black
		static let TextFont = UIFont.systemFont(ofSize: 15)
		static let BackgroundColor = UIColor(white: 0.94, alpha: 1)
		static let SelectionBackgroundColor = UIColor(white: 0.89, alpha: 1)
		static let SeparatorColor = UIColor.clear
		static let CornerRadius: CGFloat = 2
		static let RowHeight: CGFloat = 44
		static let HeightPadding: CGFloat = 20

		struct Shadow {

			static let Color = UIColor.darkGray
			static let Offset = CGSize.zero
			static let Opacity: Float = 0.4
			static let Radius: CGFloat = 8

		}

		/// Defaults used when the drop down renders on Liquid Glass.
		struct Glass {

			static let TextColor = UIColor.label
			static let SelectedTextColor = UIColor.label
			static let TintColor: UIColor? = nil
			static let SelectionBackgroundColor = UIColor.tertiarySystemFill
			static let SeparatorColor = UIColor.clear
			static let CornerRadius: CGFloat = 16
			static let SelectionCornerRadius: CGFloat = 10
			static let SelectionInsets = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)

			/// The arrow is a flat shape, so it needs a solid-ish colour to read against the glass.
			static let ArrowTintColor = UIColor.secondarySystemBackground

			/// Keeps the blur visible on iOS versions that fall back to a material.
			static let FallbackMaxTintAlpha: CGFloat = 0.4

			/// Native glass draws its own shadow, so these only apply to the fallback material.
			struct Shadow {

				static let Color = UIColor.black
				static let Offset = CGSize(width: 0, height: 8)
				static let Opacity: Float = 0.16
				static let Radius: CGFloat = 20

			}

		}

	}

	internal struct Animation {

		static let Duration = 0.15
		static let EntranceOptions: UIView.AnimationOptions = [.allowUserInteraction, .curveEaseOut]
		static let ExitOptions: UIView.AnimationOptions = [.allowUserInteraction, .curveEaseIn]
		static let DownScaleTransform = CGAffineTransform(scaleX: 0.9, y: 0.9)

	}

}

#endif
