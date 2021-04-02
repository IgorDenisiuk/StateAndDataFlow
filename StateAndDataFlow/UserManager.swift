//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 31.03.2021.
//

import Combine
import Foundation

class UserManager: ObservableObject {
    @Published var isRegister = UserDefaults.standard.value(forKey: "isRegister") as? Bool ?? false
    @Published var name = UserDefaults.standard.value(forKey: "username") as? String ?? ""
    
    init(){}
    
    init(name: String) {
        self.name = name
    }
}
