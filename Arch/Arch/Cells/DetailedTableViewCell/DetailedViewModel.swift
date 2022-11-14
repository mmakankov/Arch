//
//  DetailedViewModel.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import Foundation
import BaseArch

protocol DetailedViewModelProtocol {
	var text: String { get set }
	var detailedText: String { get set }
}

struct DetailedViewModel: ItemViewModel, DetailedViewModelProtocol {
	var text: String
	var detailedText: String
}
