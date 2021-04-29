//
//  TopRatedContainerTableViewCell.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 28/04/21.
//

import UIKit

class TopRatedContainerTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionViewDestaque: UICollectionView!
    
    var homeviewmodel: HomeViewModel = HomeViewModel()
    
    private var movieresult: MovieList?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.homeviewmodel.getMoviePlaying { (result, error) in
            print("000000000000000\(result?.results.count)")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(value: MovieList?) {
        
        self.collectionViewDestaque.register(UINib(nibName: "TopRatedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopRatedCollectionViewCell")
        
        self.movieresult = value
        self.collectionViewDestaque.delegate = self
        self.collectionViewDestaque.dataSource = self
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = self.movieresult?.results.count ?? 0
        return count + 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TopRatedCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedCollectionViewCell", for: indexPath) as? TopRatedCollectionViewCell
        cell?.setup(value: self.movieresult?.results[indexPath.row])
        return cell ?? UICollectionViewCell()
        
    }
}
