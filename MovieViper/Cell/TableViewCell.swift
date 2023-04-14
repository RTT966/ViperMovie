//
//  TableViewCell.swift
//  MovieViper
//
//  Created by Рустам Т on 4/13/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    func configure(film: Film){
        textLabel?.text = film.nameRu
        DispatchQueue.global().async {
            ImageManager.shared.getImageData(from: film.posterURL) { imageData in
                guard let imageData else {return}
                DispatchQueue.main.async {
                    self.imageView?.image = UIImage(data: imageData )

                }

            }
        }
      
    }

}
