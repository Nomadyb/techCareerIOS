import UIKit

class Fonksiyonlar {
	
	// 1. Parametre olarak girilen dereceyi fahrenhiet'a dönüştürdükten sonra geri döndüren bir metod
	//derece x olsun
	func question1(x: Double) -> Double {
		return x * 1.8 + 32
	}
	
	// 2. Parametre olarak girilen kenar sayısına göre iç açılar toplamını hesaplayıp sonucu geri gönderen metod
	// Kenar sayisi n olsun
	func question2(n: Int) -> Int {
		return (n - 2) * 180
	}
	
	// 3. Parametre olarak girilen gün sayısına göre maaş hesabı yapan ve elde edilen değeri döndüren metod yazınız.
	//		• 1 günde 8 saat çalışılabilir.
	//		• Çalışma saat ücreti : 10 €
    //		• Mesai saat ücreti : 20 €
    //		• 160 saat üzeri mesai sayılır.
	func question3(gunSayisi: Int) -> Double {
		let saatlikUcret: Double = 10.0
		let mesaiUcret: Double = 20.0
		let calismaSaati = gunSayisi * 8
		if calismaSaati > 160 {
			let mesaiSaati = calismaSaati - 160
			return (Double(160) * saatlikUcret) + (Double(mesaiSaati) * mesaiUcret)
		} else {
			return Double(calismaSaati) * saatlikUcret
		}
	}
	

	//Parametre olarak girilen kota miktarına göre ücreti hesaplayarak geri döndüren metodu yazınız.
	//	• 50 GB = 100 €
	//	• Kota aşımından sonra her 1 GB, 4 'dir.
	func question4(kotaGB: Double) -> Double {
		if kotaGB > 50 {
			let extraKota = kotaGB - 50
			return 100 + (extraKota * 4)
		} else {
			return 100
		}
	}
	
	// 5. Kenarları parametre olarak girilen ve dikdörtgenin çevresini hesaplayan bir metod
	func question5(kenar1: Double, kenar2: Double) -> Double {
		return 2 * (kenar1 + kenar2)
	}
	
	// 6. Parametre olarak girilen sayının faktoriyel değerini hesaplayıp geri döndüren metodu
	func question6(sayi: Int) -> Int {
		if sayi == 0 {
			return 1
		} else {
			return sayi * question6(sayi: sayi - 1)
		}
	}
	
	// 7. Parametre olarak girilen kelime içinde kaç adet a harfi olduğunu gösteren bir metod
	func question7_v1(kelime: String) -> Int {
		var count = 0
		for karakter in kelime {
			if karakter == "a" ||  karakter == "A" {
				count += 1
			}
		}
		return count
	}

}



let f = Fonksiyonlar()


let celcius = 25.0
let fahrenheit = f.question1(x: celcius)
print("\(celcius) °  \(fahrenheit) ° Fahrenheit'tır.")


let kenarSayisi = 3
let icAciToplami = f.question2(n: kenarSayisi)
print("\(kenarSayisi) kenarlı bir şeklin iç açıları toplamı: \(icAciToplami)°  derece")


let gunler = 21
let maas = f.question3(gunSayisi: gunler)
print("\(gunler) gün çalışma için alınacak maaş: \(maas) €'dir.")


let kota = 65.0
let ucret = f.question4(kotaGB: kota)
print("\(kota) GB kota için ödenmesi gereken tutar: \(ucret) €'dir.")


let aKenari = 5.0
let bKenari = 10.0
let cevre = f.question5(kenar1: aKenari, kenar2: bKenari)
print("Kenarları \(aKenari) ve \(bKenari) olan bir dikdörtgenin çevresi: \(cevre) birimdir.")


let num = 5
let faktoriyel = f.question6(sayi: num)
print("\(num) sayısının faktöriyeli: \(faktoriyel)'dir.")


let word = "Hayırlısı"
let aSayisi = f.question7_v1(kelime: word)
print("\(word) kelimesi içinde \(aSayisi) adet 'a' harfi bulunmaktadır.")
