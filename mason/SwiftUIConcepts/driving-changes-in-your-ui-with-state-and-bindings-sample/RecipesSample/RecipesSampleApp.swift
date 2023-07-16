import SwiftUI

@main
struct RecipesSampleApp: App {
<<<<<<< HEAD
//    @StateObject private var recipeBox = RecipeBox(recipes: load("recipeData.json"))
//    @State private var selectedSidebarItem: SidebarItem? = SidebarItem.all
//    @State private var selectedRecipeId: Recipe.ID?

    var body: some Scene {
        WindowGroup {
            ContentView()
//            NavigationSplitView {
//                SidebarView(selection: $selectedSidebarItem, recipeBox: recipeBox)
//            } content: {
//                ContentListView(selection: $selectedRecipeId, selectedSidebarItem: selectedSidebarItem ?? SidebarItem.all)
//            } detail: {
//                DetailView(recipeId: $selectedRecipeId)
//            }
//            .environmentObject(recipeBox)
        }
    }
}

struct ContentView: View {
    @StateObject private var recipeBox = RecipeBox(recipes: load("recipeData.json"))
    @State private var selectedSidebarItem: SidebarItem? = SidebarItem.all
    @State private var selectedRecipeId: Recipe.ID?
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selectedSidebarItem, recipeBox: recipeBox)
        } content: {
            ContentListView(selection: $selectedRecipeId, selectedSidebarItem: selectedSidebarItem ?? SidebarItem.all)
        } detail: {
            DetailView(recipeId: $selectedRecipeId)
        }
        .environmentObject(recipeBox)
    }
}

//struct ContentView: View {
//    @State private var selectedFolder: String?
//    @State private var selectedItem: String?
//
//    @State private var folders = [
//        "All": [
//            "Item1",
//            "Item2"
//        ],
//        "Favorites": [
//            "Item2"
//        ]
//    ]
//
//    var body: some View {
//        NavigationSplitView {
//            List(selection: $selectedFolder) {
//                ForEach(Array(folders.keys.sorted()), id: \.self) { folder in
//                    NavigationLink(value: folder) {
//                        Text(verbatim: folder)
//                    }
//                }
//            }
//            .navigationTitle("Sidebar")
//        } content: {
//            if let selectedFolder {
//                List(selection: $selectedItem) {
//                    ForEach(folders[selectedFolder, default: []], id: \.self) { item in
//                        NavigationLink(value: item) {
//                            Text(verbatim: item)
//                        }
//                    }
//                }
//                .navigationTitle(selectedFolder)
//            } else {
//                Text("Choose a folder from the sidebar")
//            }
//        } detail: {
//            if let selectedItem {
//                NavigationLink(value: selectedItem) {
//                    Text(verbatim: selectedItem)
//                        .navigationTitle(selectedItem)
//                }
//            } else {
//                Text("Choose an item from the content")
//            }
//        }
//    }
//}
=======
    @StateObject private var recipeBox = RecipeBox(recipes: load("recipeData.json"))
    @State private var selectedSidebarItem: SidebarItem? = SidebarItem.all
    @State private var selectedRecipeId: Recipe.ID?

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView(selection: $selectedSidebarItem, recipeBox: recipeBox)
            } content: {
                ContentListView(selection: $selectedRecipeId, selectedSidebarItem: selectedSidebarItem ?? SidebarItem.all)
            } detail: {
                DetailView(recipeId: $selectedRecipeId)
            }
            .environmentObject(recipeBox)
        }
    }
}
>>>>>>> 58e14f7bf35d4af40126536412480f12f9ddaab0
