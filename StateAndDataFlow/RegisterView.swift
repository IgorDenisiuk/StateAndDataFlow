//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 31.03.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(name.count < 3 ? .red : .green)
            }
            
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .disabled(name.count < 3)
        }
        .padding()
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
            UserDefaults.standard.setValuesForKeys(["isRegister" : user.isRegister, "username" : name])
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
