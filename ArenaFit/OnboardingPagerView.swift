//
//  OnboardingPagerView.swift
//  ArenaFit
//
//  Created by Jaron Baston on 9/9/25.
//

import SwiftUI

private struct PagerDots: View {
    let current: Int, count: Int
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<count, id: \.self) { i in
                Circle().fill(i == current ? .white : .white.opacity(0.25))
                    .frame(width: i == current ? 10 : 8, height: i == current ? 10 : 8)
            }
        }.padding(.vertical, 8)
    }
}

private struct WelcomeScreen: View {
    var next: () -> Void
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 16) {
                Text("STEP INTO THE").font(.system(size: 28, weight: .heavy)).foregroundColor(.white.opacity(0.9))
                Text("ARENA").font(.system(size: 64, weight: .black)).foregroundColor(.white)
                Text("where training becomes sport.")
                    .foregroundColor(.white.opacity(0.75)).font(.system(size: 16, weight: .semibold))
                Spacer().frame(height: 20)
                Button("Enter Arena") { next() }
                    .font(.headline.bold()).padding(.horizontal, 28).padding(.vertical, 14)
                    .background(.white).foregroundColor(.black).clipShape(Capsule())
            }.padding(.bottom, 64).frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

private struct DifferentiatorScreen: View {
    var next: () -> Void
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 18) {
                Spacer()
                Text("Every rep is scored.").font(.system(size: 36, weight: .heavy)).foregroundColor(.white)
                    .multilineTextAlignment(.center).padding(.horizontal, 24)
                Text("Duels & leaderboards").font(.system(size: 22, weight: .bold)).foregroundColor(.white.opacity(0.9))
                Text("AI judges your form").font(.system(size: 22, weight: .bold)).foregroundColor(.white.opacity(0.9))
                Spacer()
                Button("Next") { next() }
                    .font(.headline.bold()).padding(.horizontal, 28).padding(.vertical, 14)
                    .background(.white).foregroundColor(.black).clipShape(Capsule())
                    .padding(.bottom, 64)
            }
        }
    }
}

private struct PainPointScreen: View {
    var buildProfile: () -> Void
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 16) {
                Spacer()
                Text("Tired of boring logs?")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                Text("Arena makes every workout gameday.")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 28)
                Spacer()
                Button("Build Your Athlete Profile") { buildProfile() }
                    .font(.headline.bold()).padding(.horizontal, 28).padding(.vertical, 14)
                    .background(.white).foregroundColor(.black).clipShape(Capsule())
                    .padding(.bottom, 64)
            }
        }
    }
}

struct OnboardingPagerView: View {
    @State private var idx = 0
    private let count = 3
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TabView(selection: $idx) {
                WelcomeScreen { withAnimation { idx = 1 } }.tag(0)
                DifferentiatorScreen { withAnimation { idx = 2 } }.tag(1)
                PainPointScreen { print("→ Phase 2 identity") }.tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            VStack { Spacer(); PagerDots(current: idx, count: count).padding(.bottom, 120) }
                .allowsHitTesting(false)
        }
    }
}

#Preview { OnboardingPagerView() }
