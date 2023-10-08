//
//  ViewController.swift
//  bildirimkullanimi
//
//  Created by Ahmet Emin Yalçınkaya on 5.10.2023.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
	
	var izinKontrol = false

	override func viewDidLoad() {
		super.viewDidLoad()
		
		UNUserNotificationCenter.current().delegate = self
		
		
		
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge],completionHandler: {granted,error in
			
			self.izinKontrol = granted
			
			if granted{
				print("izin alma işlemi başarılı")
			}
			else {
				
				print("izin alma işlemi başarısız")
				
				
			}
		})
	}


	@IBAction func buttonBildirimOlustur(_ sender: Any) {
		if izinKontrol{
			let icerik = UNMutableNotificationContent()
			icerik.title = "Başlık"
			icerik.subtitle = "altbaşlık"
			icerik.body = "mesaj"
			icerik.badge = 1
			icerik.sound = UNNotificationSound.default
			
			let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: true)
			let istek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
			
			
			UNUserNotificationCenter.current().add(istek)
			
		}
		
		
		
		
	}
}




extension ViewController: UNUserNotificationCenterDelegate {
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		completionHandler([.banner,.sound,.badge])
		
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		print("bildirim seçildi")
		
		let app = UIApplication.shared
		
		if app.applicationState == .active{
			printContent("Önplan bildirim seçildi")
			
		}
		
		if app.applicationState == .inactive{
			
			print("arka plan bildirim seçildi")
			
		}
		app.applicationIconBadgeNumber = 0
		
		
		completionHandler()
	}
	
}
