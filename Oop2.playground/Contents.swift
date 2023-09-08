import UIKit

class Ev {
	var pencereSayisi:Int?
	
	init(pencereSayisi:Int){
		self.pencereSayisi = pencereSayisi
	}
}


class Saray: Ev {
	var kuleSayisi:Int?
	
	init(kuleSayisi:Int,pencereSayisi:Int){
		self.kuleSayisi = kuleSayisi
		super.init(pencereSayisi: pencereSayisi)
		
		
	}
}


class Villa: Ev  {
	var garajVarmi:Bool?
	
	init(garajVarmi:Bool,pencereSayisi:Int) {
		self.garajVarmi = garajVarmi
		super.init(pencereSayisi: pencereSayisi)
	}
	
}

let topkapiSarayi = Saray(kuleSayisi:5, pencereSayisi: 300)
let bogazVilla = Villa(garajVarmi:true, pencereSayisi: 200)

print(topkapiSarayi.kuleSayisi!)
print(bogazVilla.garajVarmi!)

let ev = Saray(kuleSayisi: 3, pencereSayisi:100) as Ev

let saray = Ev(pencereSayisi: 40) as? Saray

// type control


if ev is Ev {
	print("nesne ev sınıfından türetilmiştir.")
	
	
}else {
	print("nesne ev sınıfından türetilmiştir.")
	
}



class Hayvan {
	func sesCikar(){
		print("Not founded!")
		
	}
	
}

class Memeli: Hayvan {

	
	
}

class Kedi:Memeli {
	override func sesCikar() {
		print("miyav")
	}
	
}

class Kopek:Memeli
{
	override func sesCikar() {
		print("hav hav ")
	}
	
}

let hayvan = Hayvan()
let memeli = Memeli()
let kedi = Kedi()
let kopek = Kopek()

hayvan.sesCikar()//Kalıtım yok kendi metoduna erişir
memeli.sesCikar() // memeli classı kendisine bakar yoktur. Ama Kalıtım olduğu için üst sınıfın Hayvan sınıfının metoduna erişir
kedi.sesCikar()  // Kalıtım var kendi metoduna erişir
kopek.sesCikar() // kalıtım var kendi metoduna erişir


