//
//  signup.swift
//  ecommerce app in swift
//
//  Created by MacBook Pro on 27/05/R5.
//

import SwiftUI

struct signup: View {
    
    @State private var email: String = ""
    

    var body: some View {
        NavigationView{

                VStack{
                    VStack(alignment: .leading,spacing: 30){
                        Text("Sign In")
                            .fontWeight(.bold)
                            .font(.system(size: 30))
                        
                        TextField(
                            "User name (email address)",
                            text: $email
                        ).frame(height: 50)
                            .padding(.horizontal)
                            .textInputAutocapitalization(.never)
                            .background(.white)
                            .cornerRadius(10)
                            .disableAutocorrection(true)
                            .border(Color.white)
                        
                            NavigationLink(destination: SignInPassword()) {
                                ButtonView(width: UIScreen.main.bounds.width - 40, text: "Continue", color: Color("primaryColor"))
                            }
                            .navigationTitle("")
                        
                        Text("Dont have an Account ? **Create One**")
                        
                    }.padding(.top, 50)
                        .padding(20)
                    VStack(spacing: 15){
                        SocialLoginBtn(name: "Apple", logo: .apple )
                        SocialLoginBtn(name: "Google", logo: .google )
                        SocialLoginBtn(name: "Facebook", logo: .facebook )
                    }.padding(.top, 60)
                    Spacer()
                }.background(Color("bgGrey"))
                

        }
        
    }
}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup()
    }
}


enum SocialSigninLogos {
    case apple
    case google
    case facebook
}
struct SocialLoginBtn: View {
    let name: String
    let logo: SocialSigninLogos
    
    var body: some View {
        Button {
            print("apple login")
        } label: {
            HStack(spacing: 30){
                if logo == .apple{
                    Image(systemName: "applelogo").resizable()
                        .frame(width: 25, height: 25)
                        .scaledToFit()
                }else if logo == .google {
                    Image("googleLogo").resizable()
                        .frame(width: 35, height: 35)
                        .scaledToFit()
                }else {
                    Image("facebook").resizable()
                        .frame(width: 50, height: 35)
                        .scaledToFit()
                }
                Text("Continue With \(name)")
            }.frame(width: 300, alignment: .leading)
                
            
        }.padding(15)
            .background(.white)
            .cornerRadius(30)
            .foregroundColor(.black)
            
    }
}

struct SignInPassword: View {
    @State private var password: String = ""
    
    var body: some View {
            VStack(alignment: .leading,spacing: 30){
                Text("Sign In")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                
                TextField(
                    "password",
                    text: $password
                ).frame(height: 50)
                .padding(.horizontal)
                .textInputAutocapitalization(.never)
                .background(.white)
                .cornerRadius(10)
                .disableAutocorrection(true)
                .border(Color.white)
                
                NavigationLink(destination: OnboardingView()) {
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
                    
                }.navigationBarBackButtonHidden(true)
                NavigationLink(destination: forgotPassword()) {
                    Text("Forgot Password ? **Reset**").font(.system(size: 15))
                        .fontWeight(.medium)
                }.foregroundColor(.black)
                    
                Spacer()
            }.padding(.top, 50)
            .padding(20)
            .background(Color("bgGrey"))
    }
}
