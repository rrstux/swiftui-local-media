//: A UIKit based Playground for presenting user interface
import SwiftUI
import PlaygroundSupport


class Track {
    var da = "nu"
}



struct ContentView: View {
    
    @State var track = Track()
    
    var body: some View {
        VStack {
            Nested1()
            Independent1()
        }
    }
}

struct Nested1: View {
    var body: some View {
        Nested2()
    }
}

struct Nested2: View {
    var body: some View {
        Nested3()
    }
}

struct Nested3: View {
    var body: some View {
        Text("nessted 5")
    }
}

struct Independent1: View {
    var body: some View {
        Text("DAda independebt")
    }
}

PlaygroundPage.current.setLiveView(ContentView())
