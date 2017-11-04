//
//  UserDefaultsHelper.swift
//  audible
//
//  Created by Paul Dong on 5/11/17.
//  Copyright © 2017 Paul Dong. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setLoggedIn(value: Bool) {
        set(false, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool{
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
