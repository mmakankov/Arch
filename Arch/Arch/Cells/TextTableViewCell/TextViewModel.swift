//
//  TextViewModel.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import Foundation
import BaseArch

protocol TextViewModelProtocol {
	var text: String { get set }
}

struct TextViewModel: ItemViewModel, TextViewModelProtocol {
	var text: String
}
