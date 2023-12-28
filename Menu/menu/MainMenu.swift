//
//  CustomCollectionViewCell.swift
//  Menu
//
//  Created by A on 2023/12/28.
//

import UIKit

class MainMenu: UICollectionViewCell {
    
    @IBOutlet var someImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
struct Data{
    private var someArray = [UIImage]()
    
    init(){
        createImage()
    }
    
    mutating func createImage(){
        for index in 0...6{
            if let image = UIImage(named: "Image\(index).png"){someArray.append(image)
            }
        }
    }
    var imageArray: [UIImage]{
        return someArray
    }
}
