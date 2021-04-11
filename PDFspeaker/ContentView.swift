//
//  ContentView.swift
//  PDFspeaker
//
//  Created by HauTen Lee on 2020/5/28.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pdfEntity: PdfEntity
    
    private let pdfLoadedUrl = NotificationCenter.default.publisher(for: .pdfFileLoaded)
    
    var body: some View {
        ZStack{
            Text(pdfEntity.filePath.path)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "zh_hk"))
    }
}
