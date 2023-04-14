//
//  ViewController.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import UIKit

protocol MainViewProtocol: AnyObject{
   func reloadData()
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
   // var movies: [Film]?
    
    var presenter: MainPresenter!
    private let configurator: MainConfigProtocol = MainConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.config(viewController: self)
        presenter.viewDidLoad()
    }
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "det"{
            let detailVC = segue.destination as! DetailViewController
            guard let movie = sender as? Film else {return}
            let configurator: DetailConfigProtocol = DetailConfig()
            //detailVC.movies = movie
            configurator.configure(view: detailVC, movies: movie)
        }
    }


}


//MARK: - TVDelegate
extension MainViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        presenter.showMovieDetails(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

//MARK: - TVDataSource
extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.moviesCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        guard let film = presenter.movie(indexPath: indexPath) else {return UITableViewCell()}
        
        cell.configure(film: film)
        return cell
    }
    
    
}

//MARK: - Reload
extension MainViewController: MainViewProtocol{
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
