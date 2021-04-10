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
    var normalItems = [NormalItemsModel()]
    
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
        for index in 1...3{
            let num = index-1
            items.append(RecycledItemsModel(item_name: recycledItemNames[num], item_stage: 1, item_ingredient_1_id: recycledItemIngredient1[num], item_ingredient_2_id: recycledItemIngredient2[num], item_icon_color: recycledItemIconColor[num], item_icon_black: recycledItemIconColor[num], item_description: recycledItemDescription[num], item_link: recycledItemLink[num], item_found: recycledItemFound[num]))
        }
        
        for index in 1...3{
            let num = index-1
            normalItems.append(NormalItemsModel(item_name: normalItemNames[num], item_icon_color: normalItemIconColor[num], item_icon_black: "\(normalItemIconColor)Black.png", item_description: normalItemDescription[num], item_found: normalItemFound[num]))
        }
        //trigger refresh collection view
        collectionView.reloadData()
    }


    //MARK: Mengatur view cell
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCellItem", for: indexPath) as! RecycleCollectionViewCell
            
            cell.backgroundColor = UIColor.red
            // set nilai ke view dalam cell
            let item = items[indexPath.row]
            let itemImageName = "\(item.item_icon_color).png"
            cell.imageViewItem.image = UIImage(named: itemImageName)

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
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            //MARK: perintah ketika item dipilih
            performSegue(withIdentifier: "showItemDetail", sender: indexPath.row)
        }
    
    func addNormalItem(){
        
    }
    
        
    
    
    
    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! ItemDetailViewController
        let selectedRow = sender as! Int
        let selectedItem = items[selectedRow]
        destination.item = selectedItem
    }
    

}
