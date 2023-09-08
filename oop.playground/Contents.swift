import UIKit

var greeting = "Hello, playground"



class Fonksiyonlar {
	
	func selamla1(){
		// void : geri dönüşü yani return olmayan
		let sonuc = "Merhaba Ahmet"
		print(sonuc)
	}
	
	func selamla2() -> String {
		let sonuc = "Merhaba Ahmet"
		return sonuc
	}
	//parametre
	
	func selamla3(name:String){
		let sonuc = "Merhaba \(name)"
		print(sonuc)
		
		
	}
	
	
	func toplama(sayi1:Int,sayi2:Int) -> Int{
		let toplam = sayi1 + sayi2
		return toplam
	}
	
	
	func carpma(sayi1:Double,sayi2:Double){
		print("Çarpma : \(sayi1 * sayi2)")
		
		
		
	}
	
	
	func carpma(sayi1:Int,sayi2:Int,isim:String){
		print("Çarpma : \(sayi1 * sayi2) - İşlem yapan: \(isim)")
		
		
		
	}
	
	

}
let f = Fonksiyonlar()

let result = f.selamla2()
print("Gelen Sonuç: \(result)")

f.selamla3(name:"Nomad")

let gelenToplama = f.toplama(sayi1: 50, sayi2: 55)
print("gelen toplam: \(gelenToplama)")

f.carpma(sayi1: 3, sayi2: 5, isim: "Nomad")


class ASinifi {
	var x = 10
	func metod() {
		print("Metod çalıştı")
	}
	
	
	
	
}



let a = ASinifi() // tek bir nesne
print(a.x)
a.metod()

// Virtual object - Sanal nesne - nameless object - isimsiz nesne
print(ASinifi().x)//1.nesne
ASinifi().metod()//2.nesne



class BSinifi {
	static var x = 10
	static func metod() {
		print("Metod çalıştı")
	}
	
	
	
	
}

print(BSinifi.x)
BSinifi.metod()

//static = companion object(Kotlin)


//enum - Enumeration
enum KonserveBoyut {
	case kucuk
	case orta
	case buyuk
	
}


func ucretHesapla(boyut:KonserveBoyut,adet:Int){
	
	switch boyut {
	case .kucuk: print("Ücret : \(adet * 18)₺")
	case .orta: print("Ücret : \(adet * 25)₺")
	case .buyuk: print("Ücret : \(adet * 47)₺")

	}
	
}


ucretHesapla(boyut: .orta, adet: 25)

class Kategoriler {
	var kategori_id:Int?
	var kategori_ad:String?
	
	init(kategori_id:Int,kategori_ad:String){
		self.kategori_id = kategori_id
		self.kategori_ad = kategori_ad
	}
	
}

class Yonetmenler {
	var yonetmen_id:Int?
	var yonetmen_ad:String?
	
	init(yonetmen_id:Int,yonetmen_ad:String){
		self.yonetmen_id = yonetmen_id
		self.yonetmen_ad = yonetmen_ad
		
	}
	
	
}


class Filmler {
	
	var film_id:Int?
	var film_ad:String?
	var film_yil:Int?
	var kategori:Kategoriler?//Composition (bir klassta başka klasslardan yapı kullanmak)
	var yonetmen:Yonetmenler?// composition
	
	init(film_id:Int,film_ad:String,film_yil:Int,kategori:Kategoriler,yonetmen:Yonetmenler) {
		
		self.film_id = film_id
		self.film_ad = film_ad
		self.film_yil = film_yil
		self.kategori = kategori
		self.yonetmen = yonetmen
		
		
		
	}
	
	
	
}
print("Composiotion------------------------------------------")

let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Bilim Kurgu")

let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Quantin Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Cristopher Nolan")

let f1 = Filmler(film_id: 1, film_ad: "Django", film_yil: 2013, kategori: k1, yonetmen: y1)

print("Film id: \(f1.film_id!)")
print("Film adı: \(f1.film_ad!)")
print("Film yılı : \(f1.film_yil!)")
print("Film kategori: \(f1.kategori!.kategori_ad!)")
print("Film yönetmen : \(f1.yonetmen!.yonetmen_ad!)")

