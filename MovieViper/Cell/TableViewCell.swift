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
        guard let imageData = ImageManager.shared.getImageData(from: film.posterURL) else {return}
        imageView?.image = UIImage(data: imageData )
    }

}
