//
//  SectionsDataProvider.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import Foundation
import BaseArch

class SectionsDataProvider {
	var sections: [SectionInfo]

	init(sections: [SectionInfo]) {
		self.sections = sections
	}
}

extension SectionsDataProvider: TableViewDataProvider {
	func numberOfSections() -> Int {
		sections.count
	}

	func numberOfRows(inSection section: Int) -> Int {
		sections[section].numberOfObjects
	}

	func itemForRow(atIndexPath indexPath: IndexPath) -> ItemViewModel? {
		sections[indexPath.section].objects?[indexPath.row]
	}

	func title(forSection section: Int) -> String? {
		sections[section].name
	}

	func sectionIndexTitles() -> [String]? {
		sections.compactMap { $0.index }
	}
}
