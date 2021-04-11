//
//  ContentView.swift
//  CollectionViewSwiiftUI
//
//  Created by Hossein Ali Alborzi on 4/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView().previewDevice("iPhone 8")
            ContentView().previewDevice("iPhone X")
            ContentView().previewDevice("iPhone 11 Pro Max")
        }
        
    }
}

struct HomeView:View {
    @State var selected = "grid"
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {}, label: {
                        Image("Settings").resizable().frame(width: 25, height: 25).foregroundColor(Color.black.opacity(0.2))
                    }).offset( y: -15)
                    Spacer()
                    Button(action: {}, label: {
    
                        Image("search").resizable().frame(width: 25, height: 25).foregroundColor(Color.black.opacity(0.2)).offset(y: -15)
                    })
                }
                HStack(spacing: 15) {
                    Button(action: {
                        self.selected = "row"
                    }) {
                        VStack {
                            Image("row").resizable().frame(width: 25, height: 25).foregroundColor( self.selected == "row" ? Color.pink :Color.black.opacity(0.2))
                            Circle().fill().foregroundColor(self.selected == "row" ? Color.pink :Color.clear).frame(width: 5, height: 5).padding(.vertical, 4)
                        }
                      
                    }
                    Button(action: {
                        self.selected = "grid"
                    }) {
                        VStack {
                            Image("grid").resizable().frame(width: 25, height: 25).foregroundColor( self.selected == "grid" ? Color.pink :Color.black.opacity(0.2))
                            Circle().fill(self.selected == "grid" ? Color.pink :Color.clear).frame(width: 5, height: 5).padding(.vertical, 4)
                        }
                    }
                }
            }.padding([.horizontal]).background(Color.white)
            ScrollView.init(.vertical, showsIndicators: false, content: {
                if self.selected == "row" {
                    RowView()
                } else {
                    GridView()
                }
            })
        }.background(Color("Color")).padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .padding(.bottom,10)
     
    }
    
}

struct RowView:View {
    var body: some View {
        VStack(spacing: 18) {
            ForEach(rowData) { i in
                VStack {
                    Image(i.pic).resizable().frame(height: 200)
                    HStack {
                        Text(i.name).font(.title)
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        Text(i.likes)
                        Button(action: {
                      
                        }) {
                            Image("heart").renderingMode(.original)
                            
                        }
                    }.padding()
                }.background(Color.white).cornerRadius(10)
            }
        }
    }
}

struct GridView : View {
    
    var body : some View{
        
        VStack(spacing: 18){
            
            ForEach(gridData){i in
                
                HStack(spacing: 15){
                    
                    ForEach(i.rows){j in
                        
                        VStack(spacing: 20){
                            
                            Image(j.pic).resizable().frame(height: 200)
                            
                            HStack{
                                
                                Text(j.name)
                                
                                Spacer(minLength: 0)
                                
                            }.padding(.horizontal)
                            
                            HStack{
                                
                                Spacer()
                                
                                Text(j.likes)
                                
                                Button(action: {
                                    
                                }) {
                                    
                                    Image("heart").renderingMode(.original)
                                }
                            }.padding([.horizontal,.bottom])
                            
                        }.background(Color.white)
                        .cornerRadius(10)
                    }
                }
            }
            
        }.padding()
    }
}
struct DataType: Identifiable {
    var id:Int
    var rows: [row]
}

struct row : Identifiable {

    var id : Int
    var name : String
    var pic : String
    var likes : String
    
}

var gridData = [
    
DataType(id: 0, rows:
    
    [row(id: 0, name: "Cows Ice Cream,", pic: "r11", likes: "190"),row(id: 1, name: "Flayvors of Cook Farm", pic: "r12", likes: "98")]
),

DataType(id: 1, rows:
    [row(id: 0, name: "Cool Moon Ice Cream", pic: "r21", likes: "92"),row(id: 1, name: "WhiteysIceCream", pic: "r22", likes: "88")]
),

DataType(id: 2, rows: [row(id: 0, name: "MurphysIceCream", pic: "r31", likes: "32"),row(id: 1, name: "Delisious GelatoGusto", pic: "r32", likes: "160")]
)
    
]

var rowData = [
    
    row(id: 0, name: "Cows Ice Cream,", pic: "r11", likes: "190"),row(id: 1, name: "Flayvors of Cook Farm", pic: "r12", likes: "98"),

    row(id: 2, name: "Cool Moon Ice Cream", pic: "r21", likes: "92"),row(id: 3, name: "WhiteysIceCream", pic: "r22", likes: "88"),

    row(id: 4, name: "MurphysIceCream", pic: "r31", likes: "32"),row(id: 5, name: "Delisious GelatoGusto", pic: "r32", likes: "160")
    
]
