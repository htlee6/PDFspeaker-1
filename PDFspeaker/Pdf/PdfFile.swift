//
//  PdfEntity.swift
//  PDFspeaker
//
//  Created by htlee on 10/4/2021.
//  Copyright © 2021 HauTen Lee. All rights reserved.
//

import Foundation
import AppKit

class PdfEntity: ObservableObject {
    @Published var filePath: URL
    @Published var pages: [PdfPage]
    
    init(pdfFilePath fp: URL) {
        self.filePath = fp
        self.pages = []
    }
}

class PdfPage: ObservableObject, Identifiable {
    @Published var thumbnail: NSImage
    
    init(preview: NSImage) {
        self.thumbnail = preview
    }
}
