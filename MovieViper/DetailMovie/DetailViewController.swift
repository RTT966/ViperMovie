//
//  DetailViewController.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import UIKit

protocol DetailVCProtocol: AnyObject{
    func setMovieName(tittle: String)
    func setMovieRating(tittle: String)
    func setMovieYear(tittle: String)
    func setMovieImage(data: Data)
    func setImageForFavoriteButton()
}


class DetailViewController: UIViewController{
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    
    
     
    var presenter: DetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetail()
    }
    
    
    @IBAction func favButPressed(_ sender: Any) {
        presenter.favouriteButPressed()
    }
    
}


extension DetailViewController: DetailVCProtocol{
    func setMovieRating(tittle: String) {
        movieRating.text = tittle
    }
    
    func setMovieYear(tittle: String) {
        movieYear.text = tittle
    }
    
    func setMovieImage(data: Data) {
        DispatchQueue.main.async {
            self.movieImage.image = UIImage(data: data)

        }
    }
    
    func setMovieName(tittle: String) {
        movieName.text = tittle
    }
    
    func setImageForFavoriteButton() {
        let image = presenter.isFavourite ? #imageLiteral(resourceName: "fullHeart") : #imageLiteral(resourceName: "unsHeart")
        favButton.setImage(image, for: .normal)
    }
    
    
}
