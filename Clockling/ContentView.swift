//
//  ContentView.swift
//  Clockling
//
//  Created by Lluís Merlos Pieri on 21/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Setting(title: "Wi-Fi", subtitle: "Home", image: "wifi")
                .modifier(ModulePadding())
                .modifier(Module())
            
            Timer(title: "Work", literalclock: "Nothing")
                .modifier(ModulePadding())
                .modifier(Module())
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        
    }
    
}

struct Setting: View {
    @State  var title: String
    @State  var subtitle: String?
    @State  var image: String
    
    var body: some View {
        HStack {
            Ellipse()
                .foregroundColor(Color(NSColor.systemBlue))
                .overlay(
                    Image(systemName: image)
                        .foregroundColor(.white)
                )
                .frame(width: 28, height: 28)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                
                if subtitle != nil {
                    Text(subtitle ?? "")
                        .font(.subheadline)
                        .foregroundColor(Color(NSColor.secondaryLabelColor))
                }
            }
            
            Spacer()
        }
    }
}

struct Timer: View {
    @State var title: String
    @State var literalclock: String
    
    var body: some View{
        HStack {
            Text(title)
                .font(.headline)
            
            Ellipse()
                .foregroundColor(Color(NSColor.systemPurple))
                .frame(width: 28, height: 28)
            
            VStack(alignment: .leading){
                Text("Remaining")
                    .font(.subheadline)
                
                Text("03:40 h")
                    .font(.caption)
                
                Text("-> 17:34 h")
                    .font(.caption)
            }
            
            Spacer()
        }
    }
}

struct Module: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(EffectsView(material: NSVisualEffectView.Material.popover, blendingMode: NSVisualEffectView.BlendingMode.withinWindow))
            .cornerRadius(10)
    }
}

struct ModulePadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 9)
            .padding(.vertical, 12)
    }
}

struct EffectsView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }
    
    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
