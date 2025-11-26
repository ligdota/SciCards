import Foundation
import GRDB

@MainActor
class FlashcardViewModel: ObservableObject {
    @Published var flashcards: [Flashcard] = []

    
    /*
     Function to fetch the flashcards based on the topics the user has selected
     hasnt been tested yet
     */
    func loadFlashCards(topic: String) {
        do {
            try DB.queue.read { db in
                let cards = try Flashcard
                    .filter(Column("subject") == topic)
                    .fetchAll(db)
                
                flashcards = cards.shuffled()
            }
        } catch {
            print("Error loading flashcards: (error)")
        }
    }
}
