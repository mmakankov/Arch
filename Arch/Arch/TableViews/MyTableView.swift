//
//  MyTableView.swift
//  Arch
//
//  Created by Maxim Makankov on 12.11.2022.
//

import UIKit

class MyTableView: UITableView {

	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)

		register(TextTableViewCell.self, forCellReuseIdentifier: "TextTableViewCell")
		register(DetailedTableViewCell.self, forCellReuseIdentifier: "DetailedTableViewCell")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
