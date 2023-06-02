//
//  SwiftUIView.swift
//  ecommerce app in swift
//
//  Created by MacBook Pro on 30/05/R5.
//

import SwiftUI

struct NotificationView: View {
    var notifications: [Notification] = [.init(notification: "Jasmine, you placed and order check your order history for full details"), .init(notification: "Jasmine, you placed and order check your order history for full details"), .init(notification: "Jasmine, you placed and order check your order history for full details")]
    var body: some View {
            NavigationView{
                ScrollView{
                VStack(alignment: .leading){
                    
                    if notifications.count == 0 {
                        VStack(alignment: .center){
                            
                            Image("notification").resizable().frame(width: 140, height: 120)
                            Text("No Notification yet").fontWeight(.bold)
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                                .padding(20)

                            NavigationLink(destination: signup()){
                                
                                
                                ButtonView(width: 250, text: "Explore Categories", height: 60)
                                    
                            }.navigationBarHidden(true)
                            
                        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 250)
                    }else {
                        ForEach(notifications, id: \.self){data in
                            HStack{
                                Spacer(minLength: 4)
                                Image("notification").resizable().frame(width: 55, height: 55)
                                    .background(Color("secondaryBtn"))
                                    .cornerRadius(55)
                                    
                                Text(data.notification).padding(.vertical, 20).lineSpacing(8)
                                    .font(.system(size: 12))
                                Spacer(minLength: 2)
                            }.background(.white)
                                .cornerRadius(10)
                                .padding(.horizontal,20)
                        }
                    }
                    Color("bgGrey")

                }.background(Color("bgGrey"))
                    .frame(height: UIScreen.main.bounds.height)
                   
            }.navigationBarTitle("Notification")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

struct Notification: Hashable, Identifiable {
    var id = UUID()
    var notification: String
}
