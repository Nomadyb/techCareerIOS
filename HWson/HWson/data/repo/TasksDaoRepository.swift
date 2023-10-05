import Foundation
import RxSwift

class TasksDaoRepo {
	
	var tasksList = BehaviorSubject<[Tasks]>(value: [Tasks]())
	
	let db:FMDatabase?
	
	init() {
		let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("task.db")
		db = FMDatabase(path: veritabaniURL.path)
	}
	
	func addTask(taskText: String) {
		db?.open()
		
		do {
			try db!.executeUpdate("INSERT INTO tasks (task_text) VALUES (?)", values: [taskText])
		} catch {
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func updateTask(taskId: Int, taskText: String) {
		db?.open()
		
		do {
			try db!.executeUpdate("UPDATE tasks SET task_text=? WHERE task_id=?", values: [taskText, taskId])
		} catch {
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func searchTask(searchText: String) {
		db?.open()
		
		var tasks = [Tasks]()
		
		do {
			let rs = try db!.executeQuery("SELECT * FROM tasks WHERE task_text like '%\(searchText)%'", values: nil)
			
			while rs.next() {
				let taskId = Int(rs.string(forColumn: "task_id"))!
				let taskText = rs.string(forColumn: "task_text")!
				
				let task = Tasks(task_id: taskId, task_text: taskText)
				tasks.append(task)
			}
			
			tasksList.onNext(tasks)
		} catch {
			print(error.localizedDescription)
		}
		db?.close()
	}
	
	func deleteTask(taskId: Int) {
		db?.open()
		
		do {
			try db!.executeUpdate("DELETE FROM tasks WHERE task_id=?", values: [taskId])
		} catch {
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func fetchTasks() {
		db?.open()
		
		var tasks = [Tasks]()
		
		do {
			let rs = try db!.executeQuery("SELECT * FROM tasks", values: nil)
			
			while rs.next() {
				let taskId = Int(rs.string(forColumn: "task_id"))!
				let taskText = rs.string(forColumn: "task_text")!
				
				let task = Tasks(task_id: taskId, task_text: taskText)
				tasks.append(task)
			}
			
			tasksList.onNext(tasks)
		} catch {
			print(error.localizedDescription)
		}
		db?.close()
	}
	

	func copyDatabase() {
		let bundleYolu = Bundle.main.path(forResource: "task", ofType: ".db")
		let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("task.db")
		let fileManager = FileManager.default
		if fileManager.fileExists(atPath: kopyalanacakYer.path) {
			print("Veritabanı zaten var")
		} else {
			do {
				try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
			} catch {
				print(error.localizedDescription)
			}
		}
	}
}
