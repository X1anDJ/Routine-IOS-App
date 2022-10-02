//
//  CurrentView.swift
//  Routine
//
//  Created by Dajun Xian on 10/1/22.
//

import SwiftUI

struct CurrentView: View {
    let currentTask = Task.sampleTask[0]
    
    var body: some View {
        VStack {
            HStack {
                Text("CURRENT")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            CurrentDynamicButtonView(currentTask: currentTask)
                .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 50.0/*@END_MENU_TOKEN@*/)
                
        }
    }
}

struct CurrentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView()
        
    }
}
