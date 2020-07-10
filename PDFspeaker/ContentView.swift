//
//  ContentView.swift
//  PDFspeaker
//
//  Created by HauTen Lee on 2020/5/28.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button("Choose file") {
                        
                    }
                    Spacer(minLength: 10.0)
                    Text("Preview Area")
                }
                .padding()
                Divider().padding()
                Spacer()
                VStack {
                    Text("Comment")
                    Spacer()
                }
                .padding()
            }
            Divider().padding()
            Button("Present") {
                
            }
        .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "zh_hk"))
    }
}
