//
//  ViewController.swift
//  LetMusic
//
//  Created by Ahmet Emin Yalçınkaya on 14.09.2023.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()


		let navbarColor = UIColor(red: 10/255.0, green: 9/255.0, blue: 30/255.0, alpha: 1.0)
		let darkPurple = UIColor(red: 120/255.0, green: 0, blue: 120/255.0, alpha: 1.0)
		
		let gradient = CAGradientLayer()
		gradient.colors = [darkPurple.cgColor, navbarColor.cgColor]
		gradient.locations = [0.0, 1.0]
		gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
		gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
		gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)

		self.view.layer.insertSublayer(gradient, at: 0)
	}






}

