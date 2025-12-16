import SwiftUI
import GRDB
import Foundation


/*
 The main flow of the app will be as follows.
 
 There is a main home screen that shows the name of the app, the description of the app followed by the two subject buttons "Biology" and "Computer Science"
 When a user clicks the biology section they will be transferred to the biology subtopic picker.
 When a user clicks the + sign for a subtopic the subtopic name for that section needs to be recorded so when the user is finished selecting and presses next, all the flashcards can be grabbed at once and shuffled.
 There should be a next button at the bottom of this screen that cannot be pressed if a topic isnt currently active (Note users can activate and then inactivate so curr state has to be checked and managed)
 Main topics i.e biology and computer science are split now, arent going to intertwine them.
 When user selects next, all flashcards are shuffled, and displayed to the user, no longer doing automatic next card just have a next button appear when the user selects an answer or selects the screen if a self checking question
 Need some way to go back i.e quit learning when currently learning flashcards
 When the user finishes learning all cards a score is shown to the user.
 A difference im going to do from ANKI is that we arent going to reshow you in the same learning session a card that you got wrong as i believe this falsly inflates your feeling of learning.
 
 If we want to track stats about the users progress on different cards we need some way in our DB to store a counter for the number of correct and incorrect for each card.
 
 
 
 
 Current problems
 1- When finishing a self check question, the same question can appear again
 2- Clean up navigation stack and delete unused files
 3- Get a color scheme
 4- Fix progress i.e stats section
 5- implement some kind of card algorithm that identifies hard cards for the user.. could automatically create custom decks for the user based on cards they get right often and cards they get wrong often.. This could be shown in the stats section
6- We should probably limit the number of subtopics the user can select to 3.
7- W
 
 
 
 */

/*
 Restructure this to become a generic LearningView that takes in a string. If the user selects biology, this function gets subject: "biology", else subject: "computer science"
 
 */



struct LearningView: View {
    @StateObject var viewModel = LearningViewModel()
    let subject: String
    let topics: [String]
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .blue, .red],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                if let card = viewModel.currentCard {
                    FlashcardView(
                        card: card,
                        selectedAnswer: viewModel.selectedAnswer,
                        showFeedback: viewModel.showFeedback,
                        onSelectAnswer: viewModel.checkAnswer,
                        onNext: viewModel.goToNextCard
                    )
                    .padding()
                } else {
                    VStack(spacing: 20) {
                        Text("Finished Learning your score is ")
                        
                        Button("Restart") {
                            viewModel.restart()
                        }
                        
                        Button("Back to topics") {
                            dismiss()
                        }
                    }
                    .padding()
                }
                    

                Button(action: {
                    dismiss()
                }) {
                    Text("End learning")
                        .foregroundColor(.white)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .frame(maxHeight: .infinity)
            .task {
                await viewModel.loadFlashcards(subject: subject, topics: topics)
            }
        }
    }
}

extension Flashcard {
    static var test: Flashcard {
        Flashcard(
            id: "1",
            subject: "Biology",
            topic: "testing topic",
            format: "Self",
            question: "this is a test question",
            answer: "this is a test answer",
            wrong_answers: [""]
        )
    }
}



    
    
