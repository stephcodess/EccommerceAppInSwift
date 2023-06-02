//
//  productsView.swift
//  ecommerce app in swift
//
//  Created by MacBook Pro on 28/05/R5.
//

import SwiftUI

struct productsView: View {
    
    var body: some View {
        NavigationView{
            GeometryReader{proxy in
                TabView {
                    ProductCategoriesView(proxy: proxy)
                        .tabItem {
                            Image(systemName: "house")
                            
                        }
                    NotificationView()
                        .tabItem {
                           Image(systemName: "bell.badge")
                           
                         }
                    OrdersView()
                        .tabItem {
                           Image(systemName: "chart.bar.doc.horizontal")
                           
                         }

                    Text("2nd view")
                        .tabItem {
                           Image(systemName: "person")
                          
                         }

                }
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct productsView_Previews: PreviewProvider {
    static var previews: some View {
        productsView()
    }
}


struct ProductCategory: Identifiable, Hashable {
    var id: Int
    var name: String
    var display_image : String
}


struct ProductCategoriesView: View {
    var proxy: GeometryProxy
    var allowedSelection = ["women", "men"]
    @State var selections: String = "women"
    var allCategories: [ProductCategory] = [.init(id: 1, name: "clothings", display_image: "product1"), .init(id: 1, name: "Accessories", display_image: "product2"),.init(id: 1, name: "Beauty", display_image: "product3"),.init(id: 1, name: "Shoes", display_image: "product4")]
    
    let roles = ["top1", "top2", "top3", "top4"]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    ButtonView(width: 50, text: "JK", color: Color.pink)
                    Spacer()
                    Picker("women", selection: $selections){
                        ForEach(allowedSelection, id: \.self){ i in
                            Text("\(i)")
                        }
                    }
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "cart")
                    }.frame(width: 50, height: 50)
                        .background(
                            
                            RoundedRectangle(
                                cornerRadius:50,
                                style: .continuous
                            ).fill(Color("primaryColor"))
                        )
                        .foregroundColor(.white)
                    
                }.padding(20)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Shop By Category").fontWeight(.bold)
                            .font(.system(size: 20))
                        Spacer()
                        Text("See All").font(.system(size: 12))
                    }.padding(20)
                    HStack{
                        ForEach(allCategories, id: \.self) { category in
                            VStack{
                                Image(category.display_image)
                                Text(category.name).font(.system(size: 12))
                            }.frame(width: proxy.size.width/4 - 10, alignment: .leading)
                        }
                    }.padding(.leading, 20)
                    VStack{
                        HStack{
                            Text("Top Selling").fontWeight(.bold)
                                .font(.system(size: 20))
                            Spacer()
                            Text("See All").font(.system(size: 12
                                                        ))
                        }.padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack{
                                ForEach(roles, id: \.self){category in
                                    VStack{
                                        Image(category)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width:175,height: 180)
                                        
                                        Text("top gown")
                                            
                                        Text("$20").foregroundColor(Color("primaryColor")).fontWeight(.bold)
                                    }.frame( width: 175, height: 250)
                                        .cornerRadius(15)
                                        .background(.white)
                                }
                            }
                        }.frame(height: 230)
                            .padding(.leading,20)
                            
                    }.frame(width: proxy.size.width)
                        .padding(.top, 25)
                    
                    VStack{
                        HStack{
                            Text("Ready To Wear").fontWeight(.bold)
                                .font(.system(size: 20))
                            Spacer()
                            Text("See All").font(.system(size: 12
                                                        ))
                        }.padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack{
                                ForEach(roles, id: \.self){category in
                                    VStack{
                                        Image(category)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width:175,height: 180)
                                        
                                        Text("top gown")
                                        Text("$20").foregroundColor(Color("primaryColor")).fontWeight(.bold)
                                    }.frame( width: 175, height: 230)
                                        .cornerRadius(15)
                                        .background(.white)
                                }
                            }
                        }.frame(height: 230)
                            .padding(.leading,20)
                    }.frame(width: proxy.size.width)
                        .padding(.top, 25)
                    
                }
                Spacer()
            }
                
        }.background(Color("bgGrey"))
            .frame(width: proxy.size.width)
            
        
    }
}
