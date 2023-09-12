//
//  ViewController.swift
//  designWork1
//
//  Created by Ahmet Emin Yalçınkaya on 12.09.2023.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.title = "Pizza"
		
		let apperance = UINavigationBarAppearance()
		apperance.backgroundColor = UIColor(named: "mainColor")
		apperance.titleTextAttributes = [.foregroundColor: UIColor(named: "textColor1")!,.font:UIFont(name: "NotoSans-BlackItalic", size: 25)!]
		
		navigationController?.navigationBar.compactScrollEdgeAppearance = apperance
		
		
		navigationController?.navigationBar.standardAppearance = apperance
		
		navigationController?.navigationBar.compactAppearance = apperance
		
		navigationController?.navigationBar.scrollEdgeAppearance = apperance
		
	}


}

