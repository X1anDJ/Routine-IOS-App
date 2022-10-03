//
//  TabBarView.swift
//  Routine
//
//  Created by Dajun Xian on 10/1/22.
//

import SwiftUI

enum Tab {
    case first
    case second
}

struct TabBarView: View {
    @State private var selectedTab: Tab = .first
    
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .first:
                NavigationView {
                    HomeView()
                }
            case .second:
                NavigationView{
                    UserPageView()
                }
            }
            CustomTabView(selectedTab: $selectedTab)
                .frame(height: 35)
                
        }
    }
}

struct CustomTabView: View {
    @Binding var selectedTab : Tab
    @State var presentSheet = false
    var body: some View {
        HStack {
            
            Spacer()
            
            Button {
                selectedTab = .first
            } label: {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(selectedTab == .first ? .blue : .primary)
            }
            
            Spacer()
            
            Button {
                print("add")
                presentSheet = true
            } label: {
                ZStack {
                    
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70)
                        .shadow(radius: 2)
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                }
                .offset(y: -15)
            }
            .sheet(isPresented: $presentSheet) {
                AddView(description: "", title: "", tabBarview: self)
            }
            
            Spacer()
            
            Button {
                selectedTab = .second
            } label: {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(selectedTab == .second ? .blue : .primary)
            }
            
            Spacer()
        }
    }
}
    
    
    
    
    
    
    /*
    var body: some View {
        
        NavigationView {
            ZStack {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                    
                    Button {
                        print("add")
                        presentSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                    .sheet(isPresented: $presentSheet) {
                        Text("Detail")
                    }
                    
                    Text("Myself")
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
                
                //.statusBar(hidden: true)
                /*
                VStack {
                    Spacer()
                    Button {
                        print("add")
                        presentSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                    .sheet(isPresented: $presentSheet) {
                        Text("Detail")
                    }
                }
                 */
                //.statusBar(hidden: true)

            }
            
        }

        .navigationBarHidden(true)
        
        
       
    }
    
}
     */

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
