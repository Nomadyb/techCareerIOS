//
//  ViewController.swift
//  workConstructor
//
//  Created by Ahmet Emin Yalçınkaya on 14.09.2023.
//

import UIKit

class Anasayfa: UIViewController {

	@IBOutlet weak var LabelAnasayfa: UILabel!
	
	var sayac = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		LabelAnasayfa.text = String(sayac)
	}

	@IBAction func buttonTikla(_ sender: Any) {
		sayac += 1
		LabelAnasayfa.text = String(sayac)
	}
	
}

