//
//  LibraryViewController.swift
//  MusicPlayerDemo
//
//  Created by Ali Shaker on 3/24/21.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var songTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "SongTableCellTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableCellTableViewCell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        songTitle.text = AudioPlayerManager.shared.songTitle()
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AudioPlayerManager.shared.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = AudioPlayerManager.shared.songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableCellTableViewCell", for: indexPath) as! SongTableCellTableViewCell
        cell.nameLbl.text = song
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        vc.index = indexPath.row
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
