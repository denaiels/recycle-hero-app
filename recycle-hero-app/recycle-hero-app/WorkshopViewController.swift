//
//  WorkshopViewController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 09/04/21.
//

import UIKit



class WorkshopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items = [Item]()

    @IBOutlet weak var valueTestLabel: UILabel!
    
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
        for index in 1...10{
            let num = index-1
            items.append(RecycledItem(name: recycledItemNames[num], itemStage: recycledItemStage[num], image: recycledItemIconColor[num], description: "lol", itemFound: true, ingredient1Id: recycledItemIngredient1[num], ingredient2Id: recycledItemIngredient2[num], link: recycledItemLink[num]))
        }
        
        items.append(RecycledItem(name: "shit", itemStage: 1, image: recycledItemIconColor[10], description: "this is shit", itemFound: false, ingredient1Id: recycledItemIngredient1[10], ingredient2Id: recycledItemIngredient2[11], link: "https://www.google.com"))
        
        for index in 1...20{
            let num = index-1
            items.append(Item(name: normalItemNames[num], itemStage: 1, image: normalItemIconColor[num], description: normalItemDescription[num], itemFound: true))
        }
        //trigger refresh collection view
        collectionView.reloadData()
    }


    //MARK: Mengatur view cell
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCellItem", for: indexPath) as! RecycleCollectionViewCell
           
            
//            //Apply rounded corners
//            cell.contentView.layer.cornerRadius = 2.0;
//            cell.contentView.layer.borderWidth = 1.0;
//            cell.contentView.layer.borderColor = UIColor.clear.cgColor
//            cell.contentView.layer.masksToBounds = true;
//
//            cell.layer.shadowColor = UIColor.black.cgColor;
//            cell.layer.shadowOffset = CGSizeMake(0, 2.0);
//            cell.layer.shadowRadius = 2.0;
//            cell.layer.shadowOpacity = 0.5;
//            cell.layer.masksToBounds = false;
//            cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            cell.backgroundColor = UIColor.red
//
            // set nilai ke view dalam cell
            let item = items[indexPath.row]
            
            if item.itemFound{
                let itemImageName = "\(item.image).png"
                cell.imageViewItem.image = UIImage(named: itemImageName)
            }else{
                cell.imageViewItem.image = UIImage(named: item.imageBlack)
            }
            
            
            return cell
        }

        //MARK: Menentukan jumlah item yang akan ditampilkan
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{

            return items.count
        }

        //MARK: mengatur layout view cell
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{

            //Lebar dan tinggi cell(ini 1 cell 1 row)
              print("this function is called")
              return CGSize(width: collectionView.frame.width, height: 120)
//
//            return CGSize(width: 150 , height: 150)
//            let numberOfItemsPerRow:CGFloat = 4
//            let spacingBetweenCells:CGFloat = 16
//
//            let totalSpacing = (2 * 100.0) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
//
//            if let collection = self.collectionView{
//                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//                return CGSize(width: width, height: width)
//            }else{
//                return CGSize(width: 0, height: 0)
//            }
        }

        //MARK: untuk mengatur "margin"
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {


            return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 20)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            //MARK: perintah ketika item dipilih
            let item = items[indexPath.row]
            if item.itemFound{
                let segueIdentifier = item.type == "recycled" ? "showItemDetail" : "showNormalItemDetail"
                
                performSegue(withIdentifier: segueIdentifier, sender: item)
            }else{
                return
            }
        }
    
        
    
    
    
    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        let destination = segue.destination as! ItemDetailViewController
//        let selectedRow = sender as! Int
//        let selectedItem = items[selectedRow]
//        destination.item = selectedItem
        
        if segue.identifier == "showItemDetail"{
            let destination = segue.destination as! ItemDetailViewController
            destination.item = sender as? RecycledItem
        }else{
            let destination = segue.destination as! NormalItemDetailViewController
            destination.item = sender as? Item
        }
    }
    

}
