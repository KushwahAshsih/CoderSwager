//
//  ProductVC.swift
//  CoderSwager
//
//  Created by Mellifera Labs on 2/26/18.
//  Copyright © 2018 Mellifera Labs. All rights reserved.
//

import UIKit

class ProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    private(set) public var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

       productsCollection.dataSource  = self
        productsCollection.delegate = self
    }

    
    
    func initProducts(category: Category){
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        
        navigationItem.title = category.title
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            return cell
        }
        return ProductCell()
    }
    
}
