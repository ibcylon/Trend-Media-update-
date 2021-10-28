//
//  MovieModel.swift
//  Trend Media
//
//  Created by Kanghos on 2021/10/26.
//

import Foundation

struct MovieModel:Decodable {
    
    let titleData:String
    let image:String
    let link:String
    let userRating:String
    let subtitle:String
}
