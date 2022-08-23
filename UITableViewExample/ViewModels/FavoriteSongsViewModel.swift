//
//  FavoriteSongsViewModel.swift
//  UITableViewExample
//
//  Created by Erika C. Matesz Bueno on 23/08/22.
//

import Foundation

protocol FavoriteSongsViewModelProtocol {
    var title: String { get set }
    var songs: [Song] { get set }
}

final public class FavoriteSongsViewModel: FavoriteSongsViewModelProtocol {
    var title = "Favorite Songs"
    var songs = SongMock().loadSongs()
}
