import Foundation

struct RecipeEditorConfig {
    var recipe = Recipe.emptyRecipe()
    var shouldSaveChanges = false
<<<<<<< HEAD
    var isPresented = false
    
    func presentAddRecipe(sidebarItem: SidebarItem) {
=======
    var isPresented = false {
        didSet {
            print("Mason🍎🍎🍎: \(isPresented)")
        }
    }
    
    mutating func presentAddRecipe(sidebarItem: SidebarItem) {
>>>>>>> 58e14f7bf35d4af40126536412480f12f9ddaab0
        recipe = Recipe.emptyRecipe()

        switch sidebarItem {
        case .favorites:
            // Associate the recipe to the favorites collection.
            recipe.isFavorite = true
        case .collection(let name):
            // Associate the recipe to a custom collection.
            recipe.collections = [name]
        default:
            // Nothing else to do.
            break
        }
            
        shouldSaveChanges = false
        isPresented = true
    }
    
<<<<<<< HEAD
    func presentEditRecipe(_ recipeToEdit: Recipe) {
=======
    mutating func presentEditRecipe(_ recipeToEdit: Recipe) {
>>>>>>> 58e14f7bf35d4af40126536412480f12f9ddaab0
        recipe = recipeToEdit
        shouldSaveChanges = false
        isPresented = true
    }
    
<<<<<<< HEAD
    func done() {
=======
    mutating func done() {
>>>>>>> 58e14f7bf35d4af40126536412480f12f9ddaab0
        shouldSaveChanges = true
        isPresented = false
    }
    
<<<<<<< HEAD
    func cancel() {
=======
    mutating func cancel() {
>>>>>>> 58e14f7bf35d4af40126536412480f12f9ddaab0
        shouldSaveChanges = false
        isPresented = false
    }
}
