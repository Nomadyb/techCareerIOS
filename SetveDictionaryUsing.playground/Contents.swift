import UIKit


var meyveler = Set<String>()

meyveler.insert("Elma")
meyveler.insert("Kiraz")
meyveler.insert("Muz")

print(meyveler)

print("Boyut:\(meyveler.count)")
print("Boş kontrol:\(meyveler.isEmpty)")


for meyve in meyveler{
	print("Sonu: \(meyve)")
}

for (indeks,meyve) in meyveler.enumerated(){
	print("Sonu:\(indeks) \(meyve)")
}

var indeks = meyveler.firstIndex(of: "Elma")
meyveler.remove(at:indeks!)
print(meyveler)

meyveler.removeAll()
print(meyveler)

var iller = [Int:String]()

iller[16] = "BURSA"
iller[34] = "İstanbul"

let il = iller[1]

for (anahtar,deger) in iller{
	print("\(anahtar) -> \(deger)")
	
}


iller.removeValue(forKey: 16)
print(iller)

