//
//  ContentView.swift
//  ProxyCurvy
//
//  Created by Nate de Jager on 2022-11-02.
//

import SwiftUI

struct ContentView: View {
    
    static let maxEnergy: CGFloat = 80
    
    @StateObject var control1State = ControlState(maxEnergy)
    @StateObject var control2State = ControlState(maxEnergy)
    
    var body: some View {
        ScrollView {
            VStack {
                header
                photoBlock1
                photoBlock2
                photoBlock3
                photoBlock4
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
    
    var header: some View {
        VStack {
            VStack(spacing: -14) {
                Text("The more loving")
                    .font(Font.custom("Palatino", size: 26, relativeTo: .title))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("darkGray"))
                    .padding(.top, 200)
                Text("one")
                    .font(Font.custom("Palatino", size: 72, relativeTo: .largeTitle))
                    .multilineTextAlignment(.leading)
            }
            Text("by W.H. Auden")
                .font(Font.custom("Palatino", size: 14, relativeTo: .caption).italic())
                .padding(.bottom, 70)
            Text("scroll please")
                .font(Font.custom("Palatino", size: 14, relativeTo: .caption))
                .foregroundColor(Color("darkerGray"))
            Image(systemName: "arrow.down")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(Color("darkerGray"))
                .padding(.bottom, 70)
        }
    }
    
    var photoBlock1: some View {
        VStack {
            Text("""
                 Looking up at the stars, I know quite well
                 That, for all they care, I can go to hell,
                 But on earth indifference is the least
                 We have to dread from man or beast.
            """)
            .font(Font.custom("Palatino", size: 16, relativeTo: .body))
            .lineSpacing(14)
            .padding(.vertical, 20)
            
            WaveImage("photo1")
        }
    }
    
    var photoBlock2: some View {
        VStack {
            Text("""
                 How should we like it were stars to burn
                 With a passion for us we could not return?
                 If equal affection cannot be,
                 Let the more loving one be me.
            """)
            .font(Font.custom("Palatino", size: 16, relativeTo: .body))
            .lineSpacing(14)
            .padding(.vertical, 20)
            
            WaveImage("photo2")
        }
    }
    
    var photoBlock3: some View {
        VStack {
            Text("""
                 Admirer as I think I am
                 Of stars that do not give a damn,
                 I cannot, now I see them, say
                 I missed one terribly all day.
            """)
            .font(Font.custom("Palatino", size: 16, relativeTo: .body))
            .lineSpacing(14)
            .padding(.vertical, 20)
            
            WaveImage("photo3")
        }
    }
    
    var photoBlock4: some View {
        VStack {
            Text("""
                 Were all stars to disappear or die,
                 I should learn to look at an empty sky
                 And feel its total dark sublime,
                 Though this might take me a little time.
            """)
            .font(Font.custom("Palatino", size: 16, relativeTo: .body))
            .lineSpacing(14)
            .padding(.vertical, 20)
            
            Spacer()
                .frame(height: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
