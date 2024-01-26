import Parchment
import SwiftUI
import UIKit

struct DefaultView: View {
    @StateObject var theme: Theme = Theme()
    
    var body: some View {
        PageView {
            Page { _ in
                Image(systemName: "star.fill")
                    .padding()
            } content: {
                Text("Page 1")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Button("Change Theme") {
                    theme.color1 = Color.random()
                    theme.color2 = Color.random()
                    theme.color3 = Color.random()
                    theme.indicatorHeight = CGFloat.random(in: 2...16)
                }
            }

            Page("Title 2") {
                Text("Page 2")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 3") {
                Text("Page 3")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 4") {
                Text("Page 4")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Some very long title") {
                Text("Page 5")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 6") {
                Text("Page 6")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }

            Page("Title 7") {
                Text("Page 7")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
        .indicatorColor(theme.color1)
        .selectedColor(theme.color2)
        .borderColor(theme.color1)
        .menuBackgroundColor(theme.color3)
        .indicatorOptions(.visible(height: theme.indicatorHeight,
                                   zIndex: Int.max,
                                   spacing: .zero,
                                   insets: .init(top: 0, left: 2, bottom: 0, right: 2)))
    }
}

class Theme: ObservableObject {
    @Published var color1: Color
    @Published var color2: Color
    @Published var color3: Color
    @Published var indicatorHeight: CGFloat
    
    init() {
        color1 = .red
        color2 = .orange
        color3 = .white
        indicatorHeight = 2.0
    }
}
extension Color {
    static func random() -> Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
