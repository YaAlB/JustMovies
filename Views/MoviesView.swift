//
//  MoviesView.swift
//  JustMovies
//
//  Created by Yassin Ali on 25/2/2023.
//

import SwiftUI

struct MoviesView: View {
    
    @State private var searchTerm = ""
    @State private var selectionIndex = 0
    @State private var tabs = ["Popular", "Upcoming"]
    
    @ObservedObject var movieManager = MovieDownloadManager()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .orange
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("prezzi_theme"))]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.medium)
                    
                    TextField("Find a movie", text: $searchTerm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                
            }.padding(.horizontal)
            
            //segment control
            VStack {
                Picker("_", selection: $selectionIndex) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        Text(tabs[index])
                            .font(.title)
                            .bold()
                            .tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selectionIndex) { (_) in
                        if selectionIndex == 0 {
                            movieManager.getPopular(page: 0)
                        } else if selectionIndex == 1 {
                            movieManager.getUpcoming()
                        }
                    }
            }.padding()
            
            List {
                ForEach(movieManager.movies.filter {
                    searchTerm.isEmpty ? true : $0.title?.lowercased().localizedStandardContains(searchTerm.lowercased()) ?? true }) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieCell(movie: movie)
                        }
                }
            }.onAppear {
                movieManager.getPopular(page: 0)
            }
            
            HStack(alignment: .top) {
                if (movieManager.currentPage ?? 0 > 1 && selectionIndex == 0) {
                Button(action: {
                    movieManager.getPopular(page: -1)
                }) {
                    Text("Previous")
                        .foregroundColor(Color("prezzi_theme"))
                        .bold()
                }.padding(.leading)
                }
                
                Spacer()

                if (movieManager.currentPage ?? 0 < movieManager.totalPage ?? 0 && selectionIndex == 0) {
                Button(action: {
                    movieManager.getPopular(page: 1)
                }) {
                
                    Text("Next")
                        .foregroundColor(Color("prezzi_theme"))
                        .bold()
                }.padding(.trailing)
                }
            }
            
            Spacer()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
