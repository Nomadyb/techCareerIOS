import UIKit

var a = 40
var b = 50

var x = 90
var y = 80

print(a > b ||  x > y)
print(a > b &&  x > y)

var varA:Int = 10;
if varA < 20 {
	print("var a 20den küçüktür.")
}


for i in 1...3{
	print("Döngü1: \(i)")
	
	
}

for i in Range(1...3){
	print("Döngü1: \(i)")
}


for i in stride(from: 10, to: 20, by: 5){
	print("Döngü1: \(i)")
}

for i in stride(from: 10, through: 20, by: 5){
	print("Döngü1: \(i)")
}


var sayac = 1
while sayac < 4 {
	sayac += 1
	print("döngü 5: \(sayac)")
}
