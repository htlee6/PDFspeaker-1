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
    
    @State var selectedItemInNavBar: Int? = 0
    
    private let pdfLoadedUrl = NotificationCenter.default.publisher(for: .pdfFileLoaded)
    
    var body: some View {
        VStack {
            // BUG: When this line is compiled, the master view of pdf will gone. Dont know why
            // Text("selected item in nav bar: \(selectedItemInNavBar ?? -1)")
        HStack {
            NavigationView {
                List {
                    ForEach(0..<pdfEntity.pageCount ) { page in
                        NavigationLink (destination: EmptyView(),
                            //PdfPreviewViewNew(page: page, pdfEntity: self.pdfEntity),
                                        tag: page,
                                        selection: self.$selectedItemInNavBar) {
                            PdfThumbnailViewNew(page: page, pdfEntity: self.pdfEntity)
                        }
                    }
                }
            }
            //TODO: Selection in nav bar is not binding with currentPage of PdfPreviewView. So bind them together.
            PdfPreviewView(url: self.pdfEntity.filePath)
                // Text("selected item in nav bar: \(selectedItemInNavBar ?? -1)")
                /*
                .onReceive(self.pdfEntity.$curPage, perform: { newCurPage in
                    self.selectedItemInNavBar = newCurPage
                })
                 */
                /*
                .onReceive(self.selectedItemInNavBar, perform: { newSelectedPageInNavBar in
                        print("New nav bar page: \(newSelectedPageInNavBar)")
                })
                */
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // PdfKitThumbnailView(url: pdfEntity.filePath)
        }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "zh_hk"))
            .environmentObject(PdfEntity(pdfFilePath: URL(fileURLWithPath: "/Users/Lihaotian/Desktop/pre.pdf")))
    }
}

struct PdfPreviewViewNew: View {
    var page: Int
    var pdfEntity: PdfEntity
    
    var body: some View {
        VStack {
            Text("Page \(page+1)/\(self.pdfEntity.pageCount)")
            Spacer()
            Image(nsImage: pdfEntity.pages[page].masterview!)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PdfThumbnailViewNew: View {
    var page: Int
    var pdfEntity: PdfEntity
    
    var body: some View {
        HStack {
            Text("\(page+1)")
            Image(nsImage: pdfEntity.pages[page].thumbnail!)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
