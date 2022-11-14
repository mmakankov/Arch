//
//  Section.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import Foundation
import BaseArch

struct Section: SectionInfo {
	var numberOfObjects: Int { return objects?.count ?? 0 }
	var objects: [ItemViewModel]?
	var name: String
	var index: String?
}
