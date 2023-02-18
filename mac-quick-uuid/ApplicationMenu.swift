//
//  ApplicationMenu.swift
//  mac-quick-uuid
//
//  Created by Greg Ford on 17/02/2023.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        // main view
        let uuidView = UuidView()
        let topView = NSHostingController(rootView: uuidView)
        topView.view.frame.size = CGSize(width: 400, height: 35)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        
        menu.addItem(customMenuItem)
        
        // github
        let gitHubMenuItem = NSMenuItem(title: "github", action: #selector(github), keyEquivalent: "")
        gitHubMenuItem.target = self
        menu.addItem(gitHubMenuItem)
        
        //quit
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q")
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)
        
        return menu
    }
    
    @objc func github(sender: NSMenuItem) {
        let link = "https://github.com/grug117"
        guard let url = URL(string: link) else { return }
        NSWorkspace.shared.open(url)
    }
    
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
