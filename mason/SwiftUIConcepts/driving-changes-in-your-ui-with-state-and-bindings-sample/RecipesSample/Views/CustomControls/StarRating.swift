import SwiftUI

struct StarRating: View {
    @Binding var rating: Int
    private let maxRating = 5

    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { value in
                Image(systemName: "star")
                    .symbolVariant(value <= rating ? .fill : .none)
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        if value != rating {
                            rating = value
                        } else {
                            rating = 0
                        }
                    }
            }
        }
    }
}
<<<<<<< HEAD
=======

struct Person {
    let age: Int
    let name: String
    
    init(age: Int = 0, name: String) {
        self.age = age
        self.name = name
    }
}
>>>>>>> 58e14f7bf35d4af40126536412480f12f9ddaab0
