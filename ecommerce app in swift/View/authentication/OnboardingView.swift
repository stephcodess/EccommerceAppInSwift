//
//  OnboardingView.swift
//  ecommerce app in swift
//
//  Created by MacBook Pro on 27/05/R5.
//

import SwiftUI

struct OnboardingView: View {
    @State var selectedItem = 18
    @State var whoDoYouShopFor: WhoDoYouShopFor = .women
    var body: some View {
            GeometryReader{proxy in
                VStack(alignment: .leading){
                    VStack(alignment: .leading,spacing: 25){
                        Text("Tell Us About Yourself.").font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom, 30)
                        
                            Text("who do you shop for?")
                            HStack{
                                WhoDoYouShopForButton(whoDoYouShopFor: $whoDoYouShopFor, proxy: proxy, optionFor: .men)

                                WhoDoYouShopForButton(whoDoYouShopFor: $whoDoYouShopFor, proxy: proxy, optionFor: .women)

                            }.frame(width: proxy.size.width - 40)
                            
                        VStack(alignment: .leading){
                                Text("How Old Are You?")
                                Picker("Pick a language", selection: $selectedItem) {
                                    ForEach((18...100), id: \.self) {
                                        Text("\($0)") // 5
                                    }
                                }.frame(width: proxy.size.width - 40, height: 50)
                                    
                                    .foregroundColor(.white)
                                    .background(
                                        
                                        RoundedRectangle(
                                            cornerRadius: proxy.size.width / 2,
                                            style: .continuous
                                        ).fill(Color.white)
                                    )

                        }.padding(.top, 40)
                        
                        
                        
                    }.frame(width: proxy.size.width)
                    Spacer()
                    NavigationLink(destination: productsView()){
                        Button(action: {
                            // ...
                        }) {
                            Text("Finish")
                        }
                        .frame(width: proxy.size.width - 40, height: 50)
                        
                        .foregroundColor(.white)
                        .background(
                            
                            RoundedRectangle(
                                cornerRadius: proxy.size.width / 2,
                                style: .continuous
                            ).fill(Color("primaryColor"))
                        )
                    }.padding(.horizontal, 20)
                        .navigationBarBackButtonHidden(true)
                        
                }.padding(.top, 70)
                    .background(Color("bgGrey"))
                    
                    
            
            }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

enum WhoDoYouShopFor {
    case men
    case women
}

struct WhoDoYouShopForButton: View {
    @Binding var whoDoYouShopFor: WhoDoYouShopFor
    var proxy: GeometryProxy
    var optionFor: WhoDoYouShopFor
    
    var body: some View {
        Button(optionFor == .men ? "men" : "women"){
            whoDoYouShopFor = optionFor
        }.frame(width: proxy.size.width/2 - 20, height: 50)
            .foregroundColor(whoDoYouShopFor == optionFor ? .white : .black)
            .background(
                
                RoundedRectangle(
                    cornerRadius: proxy.size.width / 2,
                    style: .continuous
                ).fill(optionFor == whoDoYouShopFor ? Color("primaryColor") : Color.white)
            )
        
    }
}
