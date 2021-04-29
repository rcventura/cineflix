//
//  GenericWorker.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 28/04/21.
//

import Foundation


class GenericWorker {
    
    typealias completion <T> = (_ result: T, _ failure: GenericError?) -> Void
    
}
