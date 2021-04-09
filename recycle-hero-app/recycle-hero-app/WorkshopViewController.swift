//
//  WorkshopViewController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 09/04/21.
//

import UIKit



class WorkshopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items = [RecycledItemsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Di dalam viewDidLoad() kita delegasikan collection view & data source nya ke view controller saat ini:
        collectionView.delegate = self
        collectionView.dataSource = self

        //init data items
        initDataItems()
    }
    
    func initDataItems(){
        let bottle = RecycledItemsModel(item_name: "bottle", imageName: "bottle.png")
        let banana = RecycledItemsModel(item_name: "banana", imageName: "banana.png")
        let compost = RecycledItemsModel(item_name: "compost", imageName: "compost.png")
        let newspaper = RecycledItemsModel(item_name: "newspaper", imageName: "newspaper.png")
        
        let milkJug = RecycledItemsModel(item_name: "milkjug", imageName: "milkJug.png")
        
        let needle = RecycledItemsModel(item_name: "needle", imageName: "needle.png")
        
        items.append(bottle)
        items.append(banana)
        items.append(compost)
        items.append(newspaper)
        items.append(milkJug)
        items.append(needle)
        
        //trigger refresh collection view
        collectionView.reloadData()
    }
    
    
    //MARK: Mengatur view cell
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCellItem", for: indexPath) as! RecycleCollectionViewCell
    
            // set nilai ke view dalam cell
            let item = items[indexPath.row]
            cell.imageViewItem.image = UIImage(named: item.imageName)
    
            return cell
        }
    
        //MARK: Menentukan jumlah item yang akan ditampilkan
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
            return items.count
        }
    
        //MARK: mengatur layout view cell
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
            //Lebar dan tinggi cell(ini 1 cell 1 row)
            //return CGSize(width: collectionView.frame.width, height: 120)
            
            return CGSize(width: 100, height: 120)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
