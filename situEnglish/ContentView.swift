import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabView()
    }
}

#Preview("Light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}
