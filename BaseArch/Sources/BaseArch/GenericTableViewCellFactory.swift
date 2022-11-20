//
//  File.swift
//  
//
//  Created by Maxim Makankov on 02.11.2022.
//

import UIKit

class GenericTableViewCellFactory<Cell>: TableViewCellFactory where Cell: UITableViewCell & Configurable {

	let cellIdentifier: String

	init(cellIdentifier: String) {
		self.cellIdentifier = cellIdentifier
	}

	func makeCell(for tableView: UITableView, at indexPath: IndexPath, with viewModel: ItemViewModel) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		guard let cell = cell as? Cell,
			  let viewModel = viewModel as? Cell.ItemModel else { return cell }

		cell.itemViewModel = viewModel
		return cell
	}
}
