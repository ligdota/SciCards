import SwiftUI


struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                                
                LinearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // MARK: Title Section
                        VStack(spacing: 8) {
                            // App Title
                            Text("Sci cards")
                                .font(.system(size: 48, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                            
                            Text("This app is to help students strengthen their introductory science knowledge. Chemistry, Physics, Psychology, Sociology, and more coming soon.")
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.title3.weight(.medium))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.primary.opacity(0.8))
                                .padding(.horizontal, 30)
                        }
        
                        
                        
                        
                        // MARK: Subjects
                        HStack(spacing: 35) {
                            NavigationLink(destination: BiologyTopics()) {
                                SubjectCardView(title: "Biology", icon: "leaf.fill", color: .green)
                            }
                            
                            NavigationLink(destination: LearningView(subject: "Computer Science", topics: ["Fundamentals"])) {
                                SubjectCardView(
                                    title: "Computer Science",
                                    icon: "desktopcomputer",
                                    color: .blue,
                                )
                            }
                        }
                        
                        
                        // Learning Stats Section
                        VStack(spacing: 30) {
                            Text("Progress stats coming soon!")
                                .font(.title2.bold())
                            
                            
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
                        
                    
                    }
                    .frame(maxWidth: .infinity)
                }
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
