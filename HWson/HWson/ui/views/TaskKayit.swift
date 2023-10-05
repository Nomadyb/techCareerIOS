//
//  KisiKayit.swift
//  KisilerUygulamasi

import UIKit

class TaskKayit: UIViewController {

	@IBOutlet weak var taskTextField: UITextField!
	
	var viewModel = TaskKayitVM()  // Kullandığınız ViewModel adına göre değiştirin. Örneğin: AddVm veya başka bir isim
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func taskEkle(_ sender: Any) {
		if let taskText = taskTextField.text, !taskText.trimmingCharacters(in: .whitespaces).isEmpty {
			viewModel.added(task_text: <#T##String#>)
			navigationController?.popViewController(animated: true) // Eklemeyi tamamladıktan sonra önceki ekrana geri dön.
		} else {
			let alert = UIAlertController(title: "Hata", message: "Görev metni boş olamaz!", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
			present(alert, animated: true, completion: nil)
		}
	}
}
