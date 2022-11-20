//
//  File.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import UIKit
import BaseArch

class UITableViewCellStub: UITableViewCell & Configurable {

	var stubbedItemViewModel: ItemViewModelStub!

	var itemViewModel: ItemViewModelStub? {
		get {
			stubbedItemViewModel
		}
		set {}
	}
}
