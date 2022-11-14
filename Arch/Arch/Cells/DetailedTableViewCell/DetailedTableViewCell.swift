//
//  DetailedTableViewCell.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import UIKit
import BaseArch

class DetailedTableViewCell: UITableViewCell, Configurable {

	var itemViewModel: DetailedViewModel? {
		didSet {
			titleLabel.text = itemViewModel?.text
			detailedLabel.text = itemViewModel?.detailedText
		}
	}

	private var titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	private var detailedLabel: UILabel = {
		let label = UILabel()
		label.textColor = .gray
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension DetailedTableViewCell {
	func addSubviews() {
		addSubview(titleLabel)
		addSubview(detailedLabel)
		addConstraints([
			NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 16.0),
			NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 16.0),
			NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -16.0)
		])
		addConstraints([
			NSLayoutConstraint(item: detailedLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 16.0),
			NSLayoutConstraint(item: detailedLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -32.0),
			NSLayoutConstraint(item: detailedLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -16.0),
			NSLayoutConstraint(item: detailedLabel, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1.0, constant: 16.0)
		])
	}
}
