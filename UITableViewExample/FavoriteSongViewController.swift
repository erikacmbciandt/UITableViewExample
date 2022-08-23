//
//  FavoriteSongViewController.swift
//  UITableViewExample
//
//  Created by Erika C. Matesz Bueno on 23/08/22.
//

import UIKit

class FavoriteSongViewController: UIViewController {

    var viewModel = FavoriteSongsViewModel()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        setupTableView()
    }

    func setupUI() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .magenta
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        title = viewModel.title
    }

    func registerCell() {
        let songCell = UINib(nibName: "SongTableViewCell", bundle: nil)
        tableView.register(songCell, forCellReuseIdentifier: "songCell")
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FavoriteSongViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as? SongTableViewCell {
            let song = viewModel.songs[indexPath.row]
            cell.setup(withSong: song)
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
}
