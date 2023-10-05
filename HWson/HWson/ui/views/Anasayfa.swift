//
//  ViewController.swift
//  TaskerUygulamasi
//


import UIKit
import RxSwift

class Anasayfa: UIViewController {
	
	@IBOutlet weak var tasksTableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	var tasksList = [Tasks]()
	var viewModel = AnasayfaViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		searchBar.delegate = self
		tasksTableView.delegate = self
		tasksTableView.dataSource = self
		
		_ = viewModel.taskList.subscribe(onNext: { tasks in
			self.tasksList = tasks
			self.tasksTableView.reloadData()
		})
	}
	
	override func viewWillAppear(_ animated: Bool) {
		viewModel.upload()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "toDetail" {
			if let task = sender as? Tasks {
				let destinationVC = segue.destination as! TaskDetay
				destinationVC.task = task
			}
		}
	}
}

extension Anasayfa : UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		viewModel.search(searchText: searchText)
	}
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasksList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListHucre
		let task = tasksList[indexPath.row]
		cell.cellLabel.text = task.task_text
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let task = tasksList[indexPath.row]
		performSegue(withIdentifier: "toDetail", sender: task)
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
			let task = self.tasksList[indexPath.row]
			let alert = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .alert)
			let noAction = UIAlertAction(title: "No", style: .cancel)
			alert.addAction(noAction)
			let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
				self.viewModel.delete(task_id: task.task_id)
			}
			alert.addAction(yesAction)
			self.present(alert, animated: true)
		}
		return UISwipeActionsConfiguration(actions: [deleteAction])
	}
}
