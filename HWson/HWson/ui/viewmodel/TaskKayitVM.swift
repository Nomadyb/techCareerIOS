//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation

class TaskKayitVM {
	var tRepo = TasksDaoRepo()
	
	func added(task_text: String) {
		tRepo.addTask(taskText: task_text)
	}
}
