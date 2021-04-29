//
//  GenericError.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 28/04/21.
//

import Foundation

struct GenericError {
    var title: String?
    var code: Int?
    var errorDescription: String? { return description }
    
    private var description: String?
    
    init(title: String?, code: Int?, description: String?) {
        self.title = title ?? "Algum erro foi encontrado!"
        self.description = description
        self.code = code ?? 400
    }
    
    init() { }
}
