//
//  DropDown+Appearance.swift
//  DropDown
//
//  Created by Kevin Hirsch on 13/06/16.
//  Copyright © 2016 Kevin Hirsch. All rights reserved.
//

#if os(iOS)

import UIKit

extension DropDown {

	public class func setupDefaultAppearance() {
		let appearance = DropDown.appearance()

		appearance.cellHeight = DPDConstant.UI.RowHeight
		appearance.animationduration = DPDConstant.Animation.Duration
		appearance.textFont = DPDConstant.UI.TextFont

		if DropDown.isGlassEnabled {
			appearance.backgroundColor = .clear
			appearance.selectionBackgroundColor = DPDConstant.UI.Glass.SelectionBackgroundColor
			appearance.separatorColor = DPDConstant.UI.Glass.SeparatorColor
			appearance.cornerRadius = DPDConstant.UI.Glass.CornerRadius
			appearance.shadowColor = DPDConstant.UI.Glass.Shadow.Color
			appearance.shadowOffset = DPDConstant.UI.Glass.Shadow.Offset
			appearance.shadowOpacity = DPDConstant.UI.Glass.Shadow.Opacity
			appearance.shadowRadius = DPDConstant.UI.Glass.Shadow.Radius
			appearance.textColor = DPDConstant.UI.Glass.TextColor
			appearance.selectedTextColor = DPDConstant.UI.Glass.SelectedTextColor
		} else {
			appearance.backgroundColor = DPDConstant.UI.BackgroundColor
			appearance.selectionBackgroundColor = DPDConstant.UI.SelectionBackgroundColor
			appearance.separatorColor = DPDConstant.UI.SeparatorColor
			appearance.cornerRadius = DPDConstant.UI.CornerRadius
			appearance.shadowColor = DPDConstant.UI.Shadow.Color
			appearance.shadowOffset = DPDConstant.UI.Shadow.Offset
			appearance.shadowOpacity = DPDConstant.UI.Shadow.Opacity
			appearance.shadowRadius = DPDConstant.UI.Shadow.Radius
			appearance.textColor = DPDConstant.UI.TextColor
			appearance.selectedTextColor = DPDConstant.UI.SelectedTextColor
		}
	}

}

#endif
