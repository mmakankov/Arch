//
//  SectionInfo.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import Foundation
import BaseArch

protocol SectionInfo {
	var numberOfObjects: Int { get }
	var objects: [ItemViewModel]? { get }
	var name: String { get }
	var index: String? { get }
}
