//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
	var tRepo = TasksDaoRepo()
	var taskList = BehaviorSubject<[Tasks]>(value: [Tasks]())

	init() {
		tRepo.copyDatabase()
		taskList = tRepo.tasksList
	}

	func search(searchText: String) {
		tRepo.searchTask(searchText: searchText)
	}

	func delete(task_id: Int) {
		tRepo.deleteTask(taskId: task_id)
		upload()
	}

	func upload() {
		tRepo.fetchTasks()
	}
}
