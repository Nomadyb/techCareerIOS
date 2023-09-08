//
//  ViewController.swift
//  DogumGunuTaker
//
//  Created by Ahmet Emin Yalçınkaya on 7.09.2023.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var nameTextField: UITextField!
	
	@IBOutlet weak var birthdayTextField: UITextField!
	
	
	@IBOutlet weak var nameLabel: UILabel!
	
	
	@IBOutlet weak var birthdayLabel: UILabel!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let storedName = UserDefaults.standard.object(forKey: "name")
		let storedBirtDay = UserDefaults.standard.object(forKey: "birtday")
		
		//casting - as? vs as!
		//nameLabel.text = storedName as? String
		
		if let newName = storedName as? String {
			nameLabel.text = newName
			
		}
		if let newBirthday = storedBirtDay as? String {
			birthdayLabel.text = newBirthday
		}
		
		
		
		// Do any additional setup after loading the view.
	}

	@IBAction func saveClicked(_ sender: Any) {
		
		let myString = ""
		UserDefaults.standard.set(nameTextField.text!,forKey: "name")
		UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
		
		
		nameLabel.text = "Name: \(nameTextField.text!)"
		birthdayLabel.text = "BirdtDay: \(birthdayTextField.text!)"
	}
	
}

