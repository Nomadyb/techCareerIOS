//
//  KisiDetayViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation

import Foundation

class DetailVM {
	var tRepo = TasksDaoRepo()
	
	func update(task_text: String, task_id: Int) {
		tRepo.updateTask(taskId: task_id, taskText: task_text)
	}
}
