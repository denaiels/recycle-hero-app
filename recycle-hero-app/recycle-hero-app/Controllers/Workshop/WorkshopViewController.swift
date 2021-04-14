//
//  WorkshopViewController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 09/04/21.
//

import UIKit



class WorkshopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var items = [Item]()
    var message = ""
    var stage = 0
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var valueTestLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(message)
        //Di dalam viewDidLoad() kita delegasikan collection view & data source nya ke view controller saat ini:
        collectionView.delegate = self
        collectionView.dataSource = self
        

        //init data items
        initDataItems()
        
        var imageName : String
        
        if stage==1{
            imageName="bedroomStage1"
        }else if stage==2{
            imageName="gardenStage2"
        }else{
            imageName="beachStage3"
        }
        backgroundImage.image = UIImage(named: imageName)
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func backToPlaygroundDidTap(_ sender: UIButton) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    // MARK: - Helper Functions
    
    func initDataItems(){
//        for index in 1...10{
//            let num = index-1
//            items.append(RecycledItem(name: recycledItemNames[num], itemStage: recycledItemStage[num], image: recycledItemIconColor[num], description: "lol", itemFound: true, ingredient1Id: recycledItemIngredient1[num], ingredient2Id: recycledItemIngredient2[num], link: recycledItemLink[num]))
//        }
//
//        items.append(RecycledItem(name: "shit", itemStage: 1, image: recycledItemIconColor[10], description: "this is shit", itemFound: false, ingredient1Id: recycledItemIngredient1[10], ingredient2Id: recycledItemIngredient2[11], link: "https://www.google.com"))
//
//        for index in 1...20{
//            let num = index-1
//            items.append(Item(name: normalItemNames[num], itemStage: 1, image: normalItemIconColor[num], description: normalItemDescription[num], itemFound: true))
//        }
        
        var i = 0
        for item in items{
            print(i, item.name, item.itemFound, item.type)
            i+=1
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
            
//
            // set nilai ke view dalam cell
            let item = items[indexPath.row]
            if item.type == "recycled"{
                cell.layer.borderWidth = 3.0
                cell.layer.borderColor = #colorLiteral(red: 0.07058823529, green: 0.6235294118, blue: 0.1960784314, alpha: 1)
                print("HAHAHAHA \(item.name), \(item.type)")
            }
            
            if item.itemStage == 1{
                cell.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.2823529412, blue: 0.1529411765, alpha: 1)
            } else if item.itemStage == 2{
                cell.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.5254901961, blue: 0.2392156863, alpha: 1)
            } else if item.itemStage == 3{
                cell.backgroundColor = #colorLiteral(red: 0.5019607843, green: 0.8078431373, blue: 0.8823529412, alpha: 1)
            }
            
            if item.itemFound{
                let itemImageName = item.image
                cell.imageViewItem.image = UIImage(named: itemImageName)
            }else{
//                print("Item \(item.name) is \(item.itemFound)")
//                print("Black Imagenya: \(item.imageBlack)")
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
            destination.stage = stage
        }else{
            let destination = segue.destination as! NormalItemDetailViewController
            destination.item = sender as? Item
            destination.stage = stage
        }
    }
    

}
