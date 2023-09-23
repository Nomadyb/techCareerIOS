//
//  ViewController.swift
//  Calculator
//
//  Created by Ahmet Emin Yalçınkaya on 21.09.2023.
//0A1832

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var operationsLabel: UILabel!
	
	@IBOutlet weak var resultLabel: UILabel!
	
	


	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		setGradientBackground()

	


		
		
		
	}
	
	

	
	// arka plan renk
	func setGradientBackground() {
		let colorPink = UIColor(red: 255.0/255.0, green: 105.0/255.0, blue: 180.0/255.0, alpha: 1.0).cgColor
		let colorLavender = UIColor(red: 219.0/255.0, green: 112.0/255.0, blue: 147.0/255.0, alpha: 1.0).cgColor
		let colorPurple = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
		let colorDarkPurple = UIColor(red: 75.0/255.0, green: 0.0/255.0, blue: 130.0/255.0, alpha: 1.0).cgColor
		let colorBlack = UIColor.black.cgColor

		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [colorPink, colorLavender, colorPurple, colorDarkPurple, colorBlack]
		gradientLayer.locations = [0.0, 0.25, 0.5, 0.75, 1.0]
		gradientLayer.frame = self.view.bounds

		self.view.layer.insertSublayer(gradientLayer, at: 0)
	}
	
	
	// silme butonu
	@IBAction func delButton(_ sender: Any) {
		guard var text = operationsLabel.text, !text.isEmpty else { return }
		text.removeLast()
		operationsLabel.text = text
	}
	
	
	var firstNumber: Double?
	var isAddOp = false

	//Toplama fonksiyonu
	@IBAction func colButton(_ sender: Any) {
		if let text = operationsLabel.text, let number = Double(text) {
			firstNumber = number
			isAddOp = true
			operationsLabel.text = ""
		}

		
	}
	
	//Float sayılar için
	@IBAction func floatButton(_ sender: Any) {
		if let text = operationsLabel.text, !text.contains(".") {
			operationsLabel.text = text + "."
		}
	}
	//= sonuç butonu
	@IBAction func resultButton(_ sender: Any) {
		if let text = operationsLabel.text, let secondNumber = Double(text), let firstNum = firstNumber, isAddOp {
			let result = firstNum + secondNumber
			resultLabel.text = "\(result)"
			operationsLabel.text = ""
			firstNumber = nil
			isAddOp = false
		}
	}
	
	//sayılar için tek buton fonksiyonu taglerle yönetim
	@IBAction func numberButtonPressed(_ sender: UIButton) {
		let numberValue = String(sender.tag)
		 operationsLabel.text = (operationsLabel.text ?? "") + numberValue
	}
	
	
	
	
	
	
	
}

