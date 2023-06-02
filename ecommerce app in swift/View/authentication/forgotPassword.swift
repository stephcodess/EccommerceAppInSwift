//
//  forgotPassword.swift
//  ecommerce app in swift
//
//  Created by MacBook Pro on 27/05/R5.
//

import SwiftUI

struct forgotPassword: View {
    @State private var password: String = ""
    var body: some View {
            VStack(alignment: .leading,spacing: 30){
                Text("Forgot Password")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                
                TextField(
                    "Enter Email Address",
                    text: $password
                ).frame(height: 50)
                .padding(.horizontal)
                .textInputAutocapitalization(.never)
                .background(.white)
                .cornerRadius(10)
                .disableAutocorrection(true)
                .border(Color.white)
                
                NavigationLink(destination: ResetLinkNotification()) {
                    Button(action: {
                        // ...
                    }) {
                        Text("Continue")
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .foregroundColor(.white)
                    .background(
                        
                        RoundedRectangle(
                            cornerRadius: 30,
                            style: .continuous
                        ).fill(Color("primaryColor"))
                    )
                    
                }.background(Color("bgGrey"))
                     
                Spacer()
            }.padding(.top, 50)
            .padding(20)
            .background(Color("bgGrey"))
        
    }
}

struct forgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        forgotPassword()
    }
}

struct ResetLinkNotification: View {
    var body: some View {
        VStack{
            
            VStack{
                Spacer()
                
                Image(systemName: "message").resizable().frame(width: 80, height: 70)
                Text("We Sent you an Email to reset your password.").fontWeight(.bold)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)

                NavigationLink(destination: signup()){
                    Button(action: {
                        
                    }){
                        Text("Return To Login")
                        
                    }.frame(width: 180, height: 40)
                        .foregroundColor(.white)
                        .background(
                            
                            RoundedRectangle(
                                cornerRadius: 30,
                                style: .continuous
                            ).fill(Color("primaryColor"))
                        )
                        
                }.navigationBarHidden(true)
                
            }
            Color("bgGrey")

        }.background(Color("bgGrey"))
            .padding(0)
    }
}
