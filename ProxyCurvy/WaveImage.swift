//
//  WaveImage.swift
//  ProxyCurvy
//
//  Created by Nate de Jager on 2022-11-02.
//

import SwiftUI

struct WaveImage: View {
    
    static let maxEnergy: CGFloat = 80
    
    @State var energy: CGFloat = 0
    
    @StateObject var control1State = ControlState(maxEnergy)
    @StateObject var control2State = ControlState(maxEnergy)
    
    let name: String
    
    @State private var minY: CGFloat = 0
    
    private let midScreen = UIScreen.main.bounds.height * 0.5
    private let waveStart = UIScreen.main.bounds.height * 0.66
    private let waveEnd = UIScreen.main.bounds.height * 0.33
    
    private var frameView: some View {
        GeometryReader { proxy in
            let midY = proxy.frame(in: CoordinateSpace.global).midY
            let pct: CGFloat = (midY - waveStart) < 0 ? (min(abs(midY - waveStart), waveEnd) / waveEnd) : 0
            
            DispatchQueue.main.async {
                self.energy = Self.maxEnergy * pct
            }
            return Color.clear
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .mask(
                WaveBaby(energy: energy,
                         control1State: control1State,
                         control2State: control2State)
                .fill(Color.gray)
                .frame(height: 460)
                .animation(.easeOut(duration: 2.0),
                           value: energy)
            )
            .background(frameView)
    }
}

struct WaveImage_Previews: PreviewProvider {
    static var previews: some View {
        WaveImage("photo1")
    }
}
