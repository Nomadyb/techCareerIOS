import UIKit

//print("Merhaba Dünya")



var ogrenciAdi = "Norman"
var ogrenciYas = 18
var ogrenciBoy = 1.78
var ogrenciBasharf = "N"
var ogrenciDevamEdiyorMu = true

print(ogrenciAdi)
print(ogrenciYas)
print(ogrenciBoy)
print(ogrenciBasharf)
print(ogrenciDevamEdiyorMu)


var urun_id:Int = 3416
var urun_adi:String = "Kol Saati"
var urun_adet:Int = 100
var urun_fiyat:Double = 149.99
var urun_tedarikci:String = "Rolex"

print("Urun İd : \(urun_id)")
print("Urun adi : \(urun_adi)")
print("Urun adeti : \(urun_adet)")
print("Urun fiyatı : \(urun_fiyat)₺")
print("Urun tedarikci : \(urun_tedarikci)")

//Constant

var sayi = 10
print(sayi)
sayi = 99
print(sayi)

let num = 100
print(num)

// tür dönüşümü
//num to num
var i = 42
var d = 56.78

var sonuc1 = Double(i)
var sonuc2 = Int(d)
print(sonuc1)
print(sonuc2)

//num to str

var sonuc3 = String(i)
var sonuc4 = String(d)

// Str to num
var yazi = "34"
if let sonuc5 = Int(yazi) {
	print(sonuc5)
	
}else{

	print("Error")
}


