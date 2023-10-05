//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 21.09.2023.
//

import UIKit

class TaskDetay: UIViewController {

	@IBOutlet weak var detailTextField: UITextField!
	
	var task: Tasks?
	var viewModel = DetailVM()  // ViewModel'in adını da isteğe göre değiştirebiliriz.
	
	override func viewDidLoad() {
		super.viewDidLoad()

		if let t = task {
			detailTextField.text = t.task_text
		}
	}

	@IBAction func okButton(_ sender: UIButton) {
		if let text = detailTextField.text, let t = task {
			viewModel.update(task_text: text, task_id: t.task_id)
		}
	}
}
