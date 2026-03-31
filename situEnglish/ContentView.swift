import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeScreen()
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
