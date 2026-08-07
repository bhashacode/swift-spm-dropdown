//
//  DropDownCellTableViewCell.swift
//  DropDown
//
//  Created by Kevin Hirsch on 28/07/15.
//  Copyright (c) 2015 Kevin Hirsch. All rights reserved.
//

#if os(iOS)

import UIKit

open class DropDownCell: UITableViewCell {
		
	//UI
	@IBOutlet open weak var optionLabel: UILabel!
	
	var selectedBackgroundColor: UIColor?
    var highlightTextColor: UIColor?
    var normalTextColor: UIColor?

	/// A non-zero radius draws the selection as an inset rounded shape instead of a full-bleed background.
	var selectionCornerRadius: CGFloat = 0
	var selectionInsets: UIEdgeInsets = .zero

	private let selectionView = UIView()

	private var usesInsetSelection: Bool {
		return selectionCornerRadius > 0
	}

}

//MARK: - UI

extension DropDownCell {
	
	override open func awakeFromNib() {
		super.awakeFromNib()

		backgroundColor = .clear
		contentView.backgroundColor = .clear
	}

	override open func layoutSubviews() {
		super.layoutSubviews()

		guard selectionView.superview != nil else { return }

		selectionView.frame = bounds.inset(by: selectionInsets)
	}

	private func installSelectionViewIfNeeded() {
		guard selectionView.superview == nil else { return }

		selectionView.isUserInteractionEnabled = false
		selectionView.layer.cornerCurve = .continuous
		insertSubview(selectionView, at: 0)
	}

	override open var isSelected: Bool {
		willSet {
			setSelected(newValue, animated: false)
		}
	}
	
	override open var isHighlighted: Bool {
		willSet {
			setSelected(newValue, animated: false)
		}
	}
	
	override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
		setSelected(highlighted, animated: animated)
	}
	
	override open func setSelected(_ selected: Bool, animated: Bool) {
		let executeSelection: () -> Void = { [weak self] in
			guard let `self` = self else { return }

			if let selectedBackgroundColor = self.selectedBackgroundColor {
				if self.usesInsetSelection {
					self.installSelectionViewIfNeeded()
					self.selectionView.layer.cornerRadius = self.selectionCornerRadius
					self.selectionView.frame = self.bounds.inset(by: self.selectionInsets)
					self.selectionView.backgroundColor = selected ? selectedBackgroundColor : .clear
					self.backgroundColor = .clear
				} else {
					self.backgroundColor = selected ? selectedBackgroundColor : .clear
				}

				self.optionLabel.textColor = selected ? self.highlightTextColor : self.normalTextColor
			}
		}
		
		if animated {
			UIView.animate(withDuration: 0.3, animations: {
				executeSelection()
			})
		} else {
			executeSelection()
		}

		accessibilityTraits = selected ? .selected : .none
	}
	
}

#endif
