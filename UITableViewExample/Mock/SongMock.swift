//
//  SongMock.swift
//  UITableViewExample
//
//  Created by Erika C. Matesz Bueno on 23/08/22.
//

import Foundation

class SongMock {

    private var songs: [Song] = []

    public func loadSongs() -> [Song] {
        songs.append(Song(title: "Innuendo", performer: "Queen"))
        songs.append(Song(title: "Orinoco Flow", performer: "Enya"))
        songs.append(Song(title: "Enae Volare Mezzo", performer: "Era"))
        songs.append(Song(title: "Pompeii", performer: "Bastille"))
        songs.append(Song(title: "Innuendo", performer: "Queen"))
        songs.append(Song(title: "Bailando", performer: "Enrique Iglesias"))
        songs.append(Song(title: "Yellow", performer: "Coldplay"))
        return songs
    }

}
