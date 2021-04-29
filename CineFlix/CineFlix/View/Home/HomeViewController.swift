//
//  HomeViewController.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 28/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewDestaque: UITableView!
    @IBOutlet weak var tableViewCorpo: UITableView!
    
    var homeviewmodel: HomeViewModel = HomeViewModel()
    
    private func configTableViews() {
        self.tableViewDestaque.register(UINib(nibName: "TopRatedContainerTableViewCell", bundle: nil), forCellReuseIdentifier: "TopRatedContainerTableViewCell")
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableViews()
        
        
        self.homeviewmodel.loadMovieList { (result, error) in
            
            if (result) {
                DispatchQueue.main.async {
                    self.tableViewDestaque.delegate = self
                    self.tableViewDestaque.dataSource = self
                }
            }
        }
        
        }
    }

// MARK: TABLEVIEW DE FILMES EM DESTAQUE
extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeviewmodel.getCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TopRatedContainerTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TopRatedContainerTableViewCell", for: indexPath) as? TopRatedContainerTableViewCell
        
        cell?.setup(value: self.homeviewmodel.loadMovies)
        
        return cell ?? UITableViewCell()
    }
}
