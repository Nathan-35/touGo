//
//  AvatarsViewController.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 06/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class AvatarsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var cellId = "cell"
    var button = UIButton()
    var label = UILabel()
    var avatars = ["afro-boy","black-boy","girl-pigtail","girl","man-3.0","man-beard","man-blue","man-china","man-guide"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.register(TouristCell.self, forCellWithReuseIdentifier: cellId)
        let avatar = UICollectionViewFlowLayout()
        let ava = AvatarsViewController(collectionViewLayout: avatar)
        _ = UINavigationController(rootViewController: ava)
        
        collectionView.backgroundColor = .white
        createBackground()
        createButton()
        
    }
    
    func createBackground() {
        view.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.3647058824, blue: 0.5960784314, alpha: 1)
    }
    
    func createButton() {
        button.frame = CGRect(x: 137.5, y: view.center.y - 163, width: 100, height: 100)
        button.setImage(UIImage(named: "addUser-3"), for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(animBackButton(param:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func animBackButton(param: Any) {
        let touristVC = TouristSignUpVC()
        touristVC.labelImage.text = label.text
        dismiss(animated: true, completion: nil)
    }
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TouristCell
        cell.backgroundView = UIImageView(image: UIImage(named: avatars[indexPath.row]))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 40, height: 82)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 370, left: 30, bottom: 30, right: 30)

    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        button.setImage(UIImage(named: avatars[indexPath.row]), for: .normal)
        label.text = avatars[indexPath.row]
    }
    
    
    
    
    
}

class TouristCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        //self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
