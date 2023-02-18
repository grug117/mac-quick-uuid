import SwiftUI
import Foundation
import UniformTypeIdentifiers

private var pasteboard = NSPasteboard.general

struct UuidView: View {
    @State private var uuid = UUID().uuidString
    @State private var showCopiedConfirm: Bool = false
    
    func uuidRefresh() -> Void {
        uuid = UUID().uuidString
    }
    
    func uuidCopyToClipboard() -> Void {
        pasteboard.clearContents()
        pasteboard.setString(uuid, forType: .string)
        showCopiedConfirm = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            showCopiedConfirm = false
        }
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text(uuid)

            Button(action: uuidCopyToClipboard){
                Image(systemName: "doc.on.doc")
            }
            .popover(isPresented: $showCopiedConfirm, arrowEdge: .bottom) {
                Text("Copied")
                    .padding(.all, 10)
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
