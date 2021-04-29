//
//  Home.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 28/04/21.
//

import Foundation


class HomeViewModel: GenericWorker {
    
    private var moviesl: MovieList?
    
    func getMoviePlaying(completion: @escaping completion<MovieList?>) {
        
        let session: URLSession = URLSession.shared
        let url: URL? = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=66dd5be8e94c92bb41079025a550b376&language=pt-BR")
        if let _url = url {
            let task: URLSessionTask = session.dataTask(with: _url) { (data, response, error)  in
            do {
                let movies = try JSONDecoder().decode(MovieList.self, from: data ?? Data())
                    completion(movies, nil)
                print("000000000000000000000\(movies)")
            } catch {
                    completion(nil,nil)
                print("ssssssssssssssssssssssss")
                }
            }
            task.resume()
        }
    }
    
    var getCount: Int {
            return 1
        }
        
    var loadMovies: MovieList? {
        return self.moviesl
    }
    
}



