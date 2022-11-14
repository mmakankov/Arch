//
//  File.swift
//  
//
//  Created by Maxim Makankov on 08.11.2022.
//

import Foundation
import UIKit

final public class TableViewDelegate: NSObject {

	private let dataProvider: TableViewDataProvider
	private let itemViewModelClassToSelectorMap: [String: Selector]

	public init(dataProvider: TableViewDataProvider, map: [String: Selector]) {
		self.dataProvider = dataProvider
		self.itemViewModelClassToSelectorMap = map
	}
}

extension TableViewDelegate: UITableViewDelegate {
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let viewModel = dataProvider.itemForRow(atIndexPath: indexPath),
			  let selector = itemViewModelClassToSelectorMap["\(type(of: viewModel))"] else {
			return
		}

		let cell = tableView.cellForRow(at: indexPath)
		let target = tableView.target(forAction: selector, withSender: cell) as? NSObject
		target?.perform(selector, with: cell)
	}
}
