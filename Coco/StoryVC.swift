//
//  StoryVC.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 15/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import UIKit

class StoryVC: UIViewController {
    
    let collectionViewContainer: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .none
        cv.isPagingEnabled = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    let content = [
        Content(image: #imageLiteral(resourceName: "Home image"), title: "Foreign Island"),
        Content(image: #imageLiteral(resourceName: "View 22"), title: "New Friend")
    ]
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        collectionViewContainer.delegate = self
        collectionViewContainer.dataSource = self
    }
    
    func layout() {
        view.addSubview(collectionViewContainer)

        NSLayoutConstraint.activate([
            collectionViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            collectionViewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            collectionViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            
        ])
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

extension StoryVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.data = self.content[indexPath.row]
        return cell

    }
}

extension StoryVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 1.5, height: view.frame.height / 1.8)
    }

}
