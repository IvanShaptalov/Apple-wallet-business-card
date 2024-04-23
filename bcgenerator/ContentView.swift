import SwiftUI
import PassKit

struct ContentView: View {
    
    // File name of the .pkpass file in the assets
    let passFileName = "custom"
    
    var body: some View {
        VStack {
            Form {
                Section("Open Pass") {
                    Button("Open Pass") {
                        openPass()
                    }
                }
            }
        }
    }
    
    func openPass() {
       
       
        let url = Bundle.main.url(forResource: "custom", withExtension: "pkpass")!
        var data: Data?
        var pasesViewController: PKAddPassesViewController?
        do {
            data = try Data(contentsOf: url)
            pasesViewController = PKAddPassesViewController(pass: try PKPass(data: data!))
        } catch {
            return
        }
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController?.present(pasesViewController!, animated: true)
            }
        }

    }
}
