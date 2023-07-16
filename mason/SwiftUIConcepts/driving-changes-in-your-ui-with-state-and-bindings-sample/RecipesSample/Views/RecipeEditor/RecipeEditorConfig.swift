import Foundation

struct RecipeEditorConfig {
    var recipe = Recipe.emptyRecipe()
    var shouldSaveChanges = false
    var isPresented = false
    
    func presentAddRecipe(sidebarItem: SidebarItem) {
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
    
    func presentEditRecipe(_ recipeToEdit: Recipe) {
        recipe = recipeToEdit
        shouldSaveChanges = false
        isPresented = true
    }
    
    func done() {
        shouldSaveChanges = true
        isPresented = false
    }
    
    func cancel() {
        shouldSaveChanges = false
        isPresented = false
    }
}
