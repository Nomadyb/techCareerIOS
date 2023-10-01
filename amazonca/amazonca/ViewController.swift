//
//  ViewController.swift
//  amazonca
//
//  Created by Ahmet Emin Yalçınkaya on 28.09.2023.
//

import UIKit

class ViewController: UIViewController {

	
	var productsLists = [Products]()
	
	
	@IBOutlet weak var UITableView: UITableView!
	
	@IBOutlet weak var productsCollectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		let f1 = Products(id: 1,
						  image: "11",
						  text: "Beats Studio Buds True Wireless Noise Cancelling Earbuds Compatible with Apple & Android, Built-in Microphone, IPX4 Rating, Sweat Resistant Earphones, Class 1 Bluetooth Headphones - Black",
						  newPrice: 129,
						  oldPrice: 149,
						  prime: "primeIcon")
		
		let f2 = Products(id: 2,
						  image: "ipadPro",
						  text: "Apple iPad Pro 12.9-inch (6th Generation): with M2 chip, Liquid Retina XDR Display, 128GB, Wi-Fi 6E, 12MP front/12MP and 10MP Back Cameras, Face ID, All-Day Battery Life – Space Grey",
						  newPrice: 129,
						  oldPrice: 149,
						  prime: "primeIcon")
		
		let f3 = Products(id: 3,
						  image: "thuleCase",
						  text: "Thule Gauntlet MacBook Sleeve(Perfectly fits a 13inch)",
						  newPrice: 129,
						  oldPrice: 149,
						  prime: "primeIcon")
		
		let f4 = Products(id: 4,
						  image: "hacktheML",
						  text: "Machine Learning for Hackers: Case Studies and Algorithms to Get You Started",
						  newPrice: 36,
						  oldPrice: 45,
						  prime: "primeIcon")
		
		let f5 = Products(id: 5,
						  image: "theStoryTeller",
						  text: "The Storyteller: Tales of Life and Music",
						  newPrice: 18,
						  oldPrice: 25,
						  prime: "primeIcon")
		
		
		let f6 = Products(id: 6,
						  image: "thinkpad",
						  text: "Lenovo Thinkpad X1 Carbon 14 Inch FHD 1080P Laptop, 8th Gen Intel 4-Core i7-8550U up to 4.0GHz, Intel UHD 620, 16GB DDR4 RAM, 512GB SSD, Backlit Keyboard, FP Reader, Windows 10 (Renewed)",
						  newPrice: 722,
						  oldPrice: 840,
						  prime: "primeIcon")
		
		
		let f7 = Products(id: 7,
						  image: "lego",
						  text: "LEGO Technic Peugeot 9X8 24H Le Mans Hybrid Hypercar 42156 Collectible Race Car Building Kit for Adults and Teens, 1:10 Scale Racing Car Model, Gift for Motorsport Fans",
						  newPrice: 722,
						  oldPrice: 840,
						  prime: "primeIcon")



		productsLists.append(f1)
		productsLists.append(f2)
		productsLists.append(f3)
		productsLists.append(f4)
		productsLists.append(f5)
		productsLists.append(f6)
		productsLists.append(f7)

		
		
		let tasarim = UICollectionViewFlowLayout()
		
		tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		tasarim.minimumLineSpacing = 10
		tasarim.minimumInteritemSpacing = 10
		
		let ekranGenislik = UIScreen.main.bounds.width
		let itemGenislik = (ekranGenislik - 30) / 2
		
		tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.5)
		
		productsCollectionView.collectionViewLayout = tasarim
		

		//let logo = UIImage(named: "amazonLogo")
		//let imageView = UIImageView(image:logo)
		//self.navigationItem.titleView = imageView
		
		
		productsCollectionView.delegate = self
		productsCollectionView.dataSource = self
		
		
		
		
	}



}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return productsLists.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductsCell
		
		let product = productsLists[indexPath.row]
		
		cell.imageViewProduct.image = UIImage(named: product.image!)
		
		// Ürün açıklaması
		cell.labelText.text = product.text
		
		// Yeni fiyat
		if let newPrice = product.newPrice {
			cell.labelNewFiyat.text = "\(newPrice)$"
		}
		
		// Eski fiyat
		if let oldPrice = product.oldPrice {
			let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(oldPrice)$")
			attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 4, range: NSMakeRange(0, attributeString.length))
			cell.labelOldFiyat.attributedText = attributeString
		}
		


		cell.layer.borderColor = UIColor.lightGray.cgColor
		cell.layer.borderWidth = 0.3
		cell.layer.cornerRadius = 10
		
		return cell
	}
}

