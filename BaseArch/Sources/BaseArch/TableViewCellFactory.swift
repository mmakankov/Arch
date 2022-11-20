//
//  File 2.swift
//  
//
//  Created by Maxim Makankov on 02.11.2022.
//

import UIKit

public protocol TableViewCellFactory {
	var cellIdentifier: String { get }
	func makeCell(
		for tableView: UITableView,
		at indexPath: IndexPath,
		with viewModel: ItemViewModel
	) -> UITableViewCell
}
