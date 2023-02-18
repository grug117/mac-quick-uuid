import SwiftUI
import Foundation
import UniformTypeIdentifiers

private var pasteboard = NSPasteboard.general

struct UuidView: View {
    @State private var uuid = UUID().uuidString
    @AppStorage("idVersion") var idVersion = 4
    
    func uuidRefresh() -> Void {
        uuid = UUID().uuidString
    }
    
    func uuidCopyToClipboard() -> Void {
        pasteboard.clearContents()
        pasteboard.setString(uuid, forType: .string)
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text(uuid)
            Button(action: uuidCopyToClipboard){
                Image(systemName: "doc.on.doc")
            }
            Button(action: uuidRefresh){
                Image(systemName: "arrow.clockwise")
            }
            
        }
        .buttonStyle(.borderless)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UuidView()
            .frame(width: 500, height: 35)
    }
}
