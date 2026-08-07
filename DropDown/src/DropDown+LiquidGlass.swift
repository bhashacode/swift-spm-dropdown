//
//  DropDown+LiquidGlass.swift
//  DropDown
//
//  Created by Dinod Tharinda on 06/08/2026.
//

#if os(iOS)

import UIKit

extension DropDown {

	/// The glass material used to render the drop down's background.
	public enum GlassStyle {

		/// Standard glass. Stays legible over busy backgrounds.
		case regular

		/// Clear glass. More transparent, best over media.
		case clear

	}

}

extension DropDown.GlassStyle {

	@available(iOS 26.0, *)
	var effectStyle: UIGlassEffect.Style {
		switch self {
		case .regular: return .regular
		case .clear: return .clear
		}
	}

	/// Material used on iOS versions without Liquid Glass.
	var fallbackBlurStyle: UIBlurEffect.Style {
		switch self {
		case .regular: return .systemMaterial
		case .clear: return .systemUltraThinMaterial
		}
	}

}

//MARK: - Background

/// Renders the drop down's glass, falling back to a blur material before iOS 26.
internal final class DPDGlassBackgroundView: UIVisualEffectView {

	static var isNativeGlassAvailable: Bool {
		if #available(iOS 26.0, *) {
			return true
		} else {
			return false
		}
	}

	func apply(style: DropDown.GlassStyle, tintColor: UIColor?) {
		if #available(iOS 26.0, *) {
			let glass = UIGlassEffect(style: style.effectStyle)
			glass.tintColor = tintColor
			effect = glass
		} else {
			effect = UIBlurEffect(style: style.fallbackBlurStyle)
			contentView.backgroundColor = tintColor.map {
				$0.withAlphaComponent(min($0.cgColor.alpha, DPDConstant.UI.Glass.FallbackMaxTintAlpha))
			}
		}
	}

	func apply(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
		if #available(iOS 26.0, *) {
			// Glass shapes itself from the corner configuration; clipping would cut off its edge lighting.
			cornerConfiguration = .corners(
				topLeftRadius: .fixed(maskedCorners.contains(.layerMinXMinYCorner) ? cornerRadius : 0),
				topRightRadius: .fixed(maskedCorners.contains(.layerMaxXMinYCorner) ? cornerRadius : 0),
				bottomLeftRadius: .fixed(maskedCorners.contains(.layerMinXMaxYCorner) ? cornerRadius : 0),
				bottomRightRadius: .fixed(maskedCorners.contains(.layerMaxXMaxYCorner) ? cornerRadius : 0))
		} else {
			layer.cornerRadius = cornerRadius
			layer.cornerCurve = .continuous
			layer.maskedCorners = maskedCorners
			clipsToBounds = true
		}
	}

}

#endif
