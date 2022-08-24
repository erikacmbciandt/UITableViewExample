//
//  FavoriteSongViewController.swift
//  UITableViewExample
//
//  Created by Erika C. Matesz Bueno on 23/08/22.
//

import UIKit

// Este protocolo será utilizado para que a gente possa adicionar uma música favorita na tela AddSongViewController e seja possível atualizar a UITableView que se encontra em FavoriteSongViewController

public protocol FavoriteSongDelegate: AnyObject {
    func addNewSong(withTitle title: String, andPerformedBy performer: String)
}

class FavoriteSongViewController: UIViewController {

    var viewModel = FavoriteSongsViewModel()

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var addSongButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        setupTableView()
    }

    // MARK: View

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
        addSongButton.tintColor = .yellow
    }

    func registerCell() {
        let songCell = UINib(nibName: "SongTableViewCell", bundle: nil)
        tableView.register(songCell, forCellReuseIdentifier: "songCell")
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: Flow

    @IBAction func addFavoriteSong(_ sender: Any) {
        performSegue(withIdentifier: "addFavoriteSong", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AddSongViewController else { return }
        vc.delegate = self
    }

}

// Aqui é onde a "mágica" acontece \o/
extension FavoriteSongViewController: FavoriteSongDelegate {
    func addNewSong(withTitle title: String, andPerformedBy performer: String) {
        viewModel.addSong(withTitle: title, andPerformedBy: performer)
        tableView.reloadData()
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


