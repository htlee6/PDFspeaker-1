//
//  PdfEntity.swift
//  PDFspeaker
//
//  Created by htlee on 10/4/2021.
//  Copyright © 2021 HauTen Lee. All rights reserved.
//

import Foundation
import AppKit
import PDFKit

class PdfEntity: ObservableObject {
    @Published var filePath: URL
    @Published var pageCount: Int
    @Published var curPage: Int
    @Published var pdfDocument: PDFDocument?
    @Published var pages: [PdfPage] = []
    
    init(pdfFilePath fp: URL) {
        self.filePath = fp
        let pdfDoc = PDFDocument(url: fp)
        self.pdfDocument = pdfDoc
        self.pageCount = pdfDoc?.pageCount ?? -1
        self.curPage = 1
        for pageno in 0..<(self.pageCount) {
            self.pages.append(PdfPage(pdfDoc: pdfDoc!, at: pageno))
        }
    }
}

class PdfPage: ObservableObject, Identifiable {
    @Published var atPage: Int
    @Published var thumbnail: NSImage?
    @Published var masterview: NSImage?
    
    init(pdfDoc doc: PDFDocument, at page: Int) {
        self.atPage = page
        let pdfPage = doc.page(at: page)
        // print(pdfData)
        // self.thumbnail = NSImage(data: pdfData!) ?? NSImage()
        self.thumbnail = pdfPage?.thumbnail(of: NSSize(width: 80, height: 60), for: .mediaBox)
        self.masterview = pdfPage?.thumbnail(of: NSSize(width: 800, height: 600), for: .mediaBox)
    }
}

extension PDFDocument: ObservableObject {
    
}
