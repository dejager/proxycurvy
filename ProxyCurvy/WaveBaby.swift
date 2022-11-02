//
//  WaveBaby.swift
//  ProxyCurvy
//
//  Created by Nate de Jager on 2022-11-02.
//

import SwiftUI

final class ControlState: ObservableObject {
    
    private let maxEnergy: CGFloat
    
    private let control1EnergyModifer: CGFloat = .random(in: 0.25...1)
    private let control2EnergyModifer: CGFloat = .random(in: 0.25...1) * -1
    
    let offset1: CGFloat = .random(in: -60...60)
    let offset2: CGFloat = .random(in: -60...60)
    
    init(_ maxEnergy: CGFloat) {
        self.maxEnergy = maxEnergy
    }
    
    func control1Energy(from energy: CGFloat) -> CGFloat {
        return energy * control1EnergyModifer
    }
    
    func control2Energy(from energy: CGFloat) -> CGFloat {
        return energy * control2EnergyModifer
    }
}

struct WaveBaby: Shape {
    
    private var energy: CGFloat

    var control1State: ControlState
    var control2State: ControlState
    
    init(energy: CGFloat,
         control1State: ControlState,
         control2State: ControlState) {
        self.energy = energy
        self.control1State = control1State
        self.control2State = control2State
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topLeft = CGPoint(x: rect.minX, y: rect.minY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let topControl1 = CGPoint(x:rect.midX + control1State.offset1,
                                  y: rect.minY + control1State.control1Energy(from: energy))
        let topControl2 = CGPoint(x: rect.midX + control1State.offset2,
                                  y: rect.minY + control1State.control2Energy(from: energy))
        
        path.move(to: bottomLeft)
        path.addLine(to: topLeft)
        path.addCurve(to: CGPoint(x:rect.maxX,y: rect.minY),
                      control1: topControl1,
                      control2: topControl2)
        
        path.addLine(to: bottomRight)
        
        path.addCurve(to: CGPoint(x:rect.minX,y: rect.maxY),
                      control1: CGPoint(x:rect.midX + control2State.offset1, y: rect.maxY + control2State.control2Energy(from: energy)),
                      control2: CGPoint(x: rect.midX + control2State.offset2, y: rect.maxY +  control2State.control1Energy(from: energy)))
        
        return path
    }
    
    var animatableData: CGFloat {
        get { return energy }
        set { energy = newValue }
    }
}


