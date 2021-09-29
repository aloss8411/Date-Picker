//
//  ViewController.swift
//  horizontal
//
//  Created by Lan Ran on 2021/9/9.
//

import UIKit
import CloudKit


class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var month: UILabel!
    
    @IBOutlet weak var collectionViews: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViews.backgroundColor = UIColor(red: 65/256, green: 72/256, blue: 77/256, alpha: 1)
        
        
        
       // appearCircle(red: 134, green: 103, blue: 56, alpha: 0.8)
        
       
       // let gesture = UITapGestureRecognizer(target: self, action: #selector(dealwithTapGesture(_:)))
       // collectionViews.addGestureRecognizer(gesture)
    }
    override func viewDidAppear(_ animated: Bool) {
        configureCellSize()
    }
    //Collection Setting
   
    /*
    @objc func dealwithTapGesture(_ gesture:UITapGestureRecognizer){
        guard let collectionViews = collectionViews else {
            return
        }
        switch gesture.state{
        case .began:
            
            
        case .changed:
            collectionViews.updateInteractiveMovementTargetPosition(gesture.location(in: collectionViews ))
        case .ended:
            collectionViews.endInteractiveMovement()
        default :
            collectionViews.cancelInteractiveMovement()
        }
        
    }
     */
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dateDiff()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else{return CollectionViewCell()}
        
        let date = Date()
        let dayformatter = DateFormatter()
        let englishMatter = DateFormatter()
        let mothMatter = DateFormatter()
        
        englishMatter.dateFormat = "E"
        dayformatter.dateFormat = "dd"
        mothMatter.dateFormat = "MMMM YYYY"
        
        if let choseDay = Calendar.current.date(byAdding: .day, value: indexPath.row-30, to: date,wrappingComponents: false) ,let choseMonth = Calendar.current.date(byAdding: .day, value: indexPath.row - 36, to: date){
            //注意日期及月份的連動
            let choseTimes = dayformatter.string(from: choseDay)
            let choseDays = englishMatter.string(from: choseDay)
            let choseMonths = mothMatter.string(from: choseMonth)
           
            
            cell.daytext.text = choseTimes
            cell.englishText.text = choseDays
            month.text = choseMonths
        
            cell.daytext.textColor = UIColor(red: 190/256, green: 182/256, blue: 159/256, alpha: 1)
            cell.englishText.textColor = UIColor(red: 190/256, green: 182/256, blue: 159/256, alpha: 1)
           
        }
        return cell
        
        
         
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        if indexPath.row > 3{
            
            let  newIndexPath = IndexPath(row: indexPath.row , section: 0)
            collectionViews.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
            
        }
        
        //appearCircle(red: 134, green: 103, blue: 56, alpha: 0.7)
            
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
       
        //removeCircle()
    
       
    }
    
    
    
    
    //functions
    func configureCellSize(){
        
        let layout = collectionViews.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.estimatedItemSize = .zero
        layout?.minimumLineSpacing = 0
        let width = collectionViews.bounds.width / 5
        layout?.itemSize = CGSize(width: width, height: collectionViews.bounds.height)
        print(collectionViews.bounds.height)
        
    }
    
    
    //計算日期差並陣列使用
    func dateDiff()-> Int{
        
        let f = DateFormatter()
        let calender = Calendar.current
        f.dateFormat = "YYYY-MM-dd"
        let startDate = f.date(from: "2021/09/01")
        let endDate = f.date(from: "2025/12/31")
        let diff:DateComponents = calender.dateComponents([.day], from:startDate!,to: endDate!)
        return diff.day!
        
 
    }
   
    //點選時出現圓形
    func appearCircle(red:Int,green:Int,blue:Int,alpha:Float){
        
        let circle = UIBezierPath(ovalIn: CGRect(x: 20, y: 30, width: 60, height: 60))
        let layer = CAShapeLayer()
        layer.path = circle.cgPath
        layer.fillColor = CGColor(red: CGFloat(red / 255), green: CGFloat(green/256), blue: CGFloat(blue/256), alpha: 0.7)
        
        
        collectionViews.layer.insertSublayer(layer, at: 0)
        
    }
    func testGit(){
        
        print("測試完成")
    }
  
    
    
 
    
}

