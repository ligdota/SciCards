import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(
                    colors: [Color.blue.opacity(0.9), Color.purple.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 40) {
                    // App Title
                    Text("Flash Learn")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 4)
                        .padding(.top, 10)

                    // Tagline
                    Text("Master Biology & Computer Science The Flash Card Way")
                        .font(.title3.weight(.medium))
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    // Subject Cards
                    HStack(spacing: 35) {
                        NavigationLink(destination: LearningView(subject: "biology")) {
                            SubjectCardView(
                                title: "Biology",
                                icon: "leaf.fill",
                                color: .green
                            )
                        }

                        NavigationLink(destination: ComputerScienceView()) {
                            SubjectCardView(
                                title: "Computer Science",
                                icon: "desktopcomputer",
                                color: .blue
                            )
                        }
                    }
                    .padding(.top, 10)

                    // Learning Stats Section
                    VStack(spacing: 15) {
                        Text("Your Progress")
                            .font(.title2.bold())
                            .foregroundColor(.white)

                        HStack(spacing: 40) {
                            StatItemView(icon: "checkmark.circle.fill", label: "Cards Learned", value: "")
                            StatItemView(icon: "clock.fill", label: "Study Time", value: "")
                            StatItemView(icon: "flame.fill", label: "Streak", value: "")
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top, 100)

                    Spacer()
                }
                .padding(.top, 0)
            }
        }
    }
}

struct SubjectCardView: View {
    var title: String
    var icon: String
    var color: Color

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)

            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(
            LinearGradient(colors: [color, color.opacity(0.7)], startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(25)
        .shadow(color: color.opacity(0.4), radius: 10, x: 0, y: 6)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(.white.opacity(0.2), lineWidth: 1)
        )
    }
}

struct StatItemView: View {
    var icon: String
    var label: String
    var value: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
            Text(value)
                .font(.headline)
                .foregroundColor(.white)
            Text(label)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
        }
    }
}



struct ComputerScienceView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Text("")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding()
        }
        .navigationTitle("Computer Science")
    }
}

#Preview {
    MainView()
}
