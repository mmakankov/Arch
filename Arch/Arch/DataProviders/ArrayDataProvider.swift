//
//  ArrayDataProvider.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import Foundation
import BaseArch

class ArrayDataProvider<T: ItemViewModel> {
	let array: [T]

	init(array: [T]) {
		self.array = array
	}
}

extension ArrayDataProvider: TableViewDataProvider {
	func numberOfSections() -> Int {
		return 1
	}

	func numberOfRows(inSection section: Int) -> Int {
		return array.count
	}

	func itemForRow(atIndexPath indexPath: IndexPath) -> ItemViewModel? {
		guard indexPath.row >= 0, indexPath.row < array.count else { return nil }

		return array[indexPath.row]
	}

	func title(forSection section: Int) -> String? {
		nil
	}

	func sectionIndexTitles() -> [String]? {
		nil
	}
}
