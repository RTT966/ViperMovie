//
//  UserDefManager.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation


class DataManager{
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavouriteStatus(courseName: String, status: Bool){
        userDefaults.set(status, forKey: courseName)
    }
    
    func loadFavouriteStatus(courseName: String)-> Bool{
        userDefaults.bool(forKey: courseName)
    }
    
}
