//
//  PdfPreviewView.swift
//  PDFspeaker
//
//  Created by htlee on 11/4/2021.
//  Copyright © 2021 HauTen Lee. All rights reserved.
//

import SwiftUI
import PDFKit

struct PdfPreviewView: View {
    var url: URL
    
    var body: some View {
        PDFKitView(url: url)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PdfKitRepresentedView: NSViewRepresentable {
    /* Adapted from post at https://pspdfkit.com/blog/2019/how-to-show-a-pdf-in-swiftui/ */
    typealias NSViewType = PDFView
    var url: URL
    
    func makeNSView(context: Context) -> PdfKitRepresentedView.NSViewType {
        let pdfView = PDFView()
        // PDFView configs
        pdfView.displayMode = .singlePage
        pdfView.displayBox = .mediaBox
        pdfView.autoScales = true
        pdfView.document = PDFDocument(url: self.url)
        return pdfView
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        //TODO: build in the future
    }
}


/// Show PDF files in SwiftUI directly with the given url.
struct PDFKitView: View {
    /* Adapted from post at https://pspdfkit.com/blog/2019/how-to-show-a-pdf-in-swiftui/ */
    var url: URL
    var body: some View {
        PdfKitRepresentedView(url: url)
    }
}

struct PdfKitThumbnailRepresentedView: NSViewRepresentable {
    typealias NSViewType = PDFThumbnailView
    var url: URL
    
    func makeNSView(context: Context) -> PDFThumbnailView {
        let pdfThumbnailView = PDFThumbnailView()
        let pdfView =  PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfThumbnailView.pdfView = pdfView
        return pdfThumbnailView
    }
    
    func updateNSView(_ nsView: PDFThumbnailView, context: Context) {
        //TODO
    }
}

struct PdfKitThumbnailView: View {
    var url: URL
    var body: some View {
        PdfKitThumbnailRepresentedView(url: url)
    }
}
