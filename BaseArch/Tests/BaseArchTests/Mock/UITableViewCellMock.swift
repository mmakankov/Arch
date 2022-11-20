//
//  File.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import UIKit
import BaseArch

class UITableViewCellMock: UITableViewCell & Configurable {

	var stubbedItemViewModel: ItemViewModelMock!

	var itemViewModel: ItemViewModelMock? {
		get {
			stubbedItemViewModel
		}
		set {}
	}
}
