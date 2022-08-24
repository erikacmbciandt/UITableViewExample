//
//  AddSongViewController.swift
//  UITableViewExample
//
//  Created by Erika C. Matesz Bueno on 24/08/22.
//

import UIKit

class AddSongViewController: UIViewController {

    @IBOutlet weak var songTitleTextField: UITextField!

    @IBOutlet weak var songPerformerTextField: UITextField!

    weak var delegate: FavoriteSongDelegate? // Protocolo criado em FavoriteSongViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        navigationController?.navigationBar.tintColor = .yellow
    }

    @IBAction func saveFavoriteSong(_ sender: Any) {

        if let title = songTitleTextField.text, let performer = songPerformerTextField.text {
            self.delegate?.addNewSong(withTitle: title, andPerformedBy: performer)
        }

        songTitleTextField.text = ""
        songPerformerTextField.text = ""
    }
}
