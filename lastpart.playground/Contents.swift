import UIKit

//Guard = if'in tersi
// fonksiyon içinde çalışması gerekir

func kisiTanima1(ad:String){
	if ad == "Ahmet" {
		print("Merhaba Ahmet")
		
	}else {
		print("Tanınmayan Kişi")
		
	}
	
	
}

kisiTanima1(ad: "Ahmetx")


func kisiTanima2(ad:String){

	
	guard ad == "Ahmet" else {
		print("Tanınmayan Kişi")
		return
	}
	print("Hi Ahmet")
	
}

kisiTanima2(ad: "Ahmet")


// try catch
// 1.Compile error

let sayi = 10

// 2.runTime error : exception

let sayi1 = 1
let sayi2 = 0

enum Hatalar:Error {
	case sifirBolunmesiHatasi
	
}

func bolme(sayi1:Int,sayi2:Int) throws -> Int {
	if sayi2 == 0 {
		throw Hatalar.sifirBolunmesiHatasi
		
	}
	return sayi1 / sayi2
}





do {
	let sonuc = try bolme(sayi1:10 , sayi2:0)
	print(sonuc)
} catch {
	print("hata oluştu")
}
