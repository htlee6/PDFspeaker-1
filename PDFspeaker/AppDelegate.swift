//
//  AppDelegate.swift
//  PDFspeaker
//
//  Created by HauTen Lee on 2020/5/28.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        
        let panel = filePanelSetup()

        // Create the window and set the content view.
        
        // Window set up
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        
        panel.begin { response in
            if response == NSApplication.ModalResponse.OK, let fileUrl = panel.url {
                NotificationCenter.default.post(name: .pdfFileLoaded, object: fileUrl)
                let pdfEntity = PdfEntity(pdfFilePath: fileUrl)
                let contentView = ContentView().environmentObject(pdfEntity)
                // window shows up after file successfully opened
                self.window.contentView = NSHostingView(rootView: contentView)
                self.window.makeKeyAndOrderFront(nil)
            }
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    /// Initialize a standard file panel for our app.
    /// - Returns: A file open panel.
    func filePanelSetup() -> NSSavePanel {
        let panel = NSOpenPanel()
        panel.title = "Select a file"
        panel.prompt = "Choose"
        panel.allowedFileTypes = ["pdf"]
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        return panel
    }
}

extension Notification.Name {
    static let pdfFileLoaded = Notification.Name("pdf_file_loaded")
}

