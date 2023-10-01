//
//  Products.swift
//  amazonca
//
//  Created by Ahmet Emin Yalçınkaya on 1.10.2023.
//

import Foundation

class Products {
	
	var id:Int?
	var image:String?
	var text:String?
	var newPrice:Int?
	var oldPrice:Int?
	var prime:String?
	
	
	init(id: Int? = nil, image: String? , text: String? , newPrice: Int?, oldPrice: Int? , prime: String? ) {
		self.id = id
		self.image = image
		self.text = text
		self.newPrice = newPrice
		self.oldPrice = oldPrice
		self.prime = prime
	}
}
