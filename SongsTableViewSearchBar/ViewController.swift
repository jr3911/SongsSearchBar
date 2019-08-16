//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var songsTableView: UITableView!
    @IBOutlet weak var noResultLabel: UILabel!
    
    let songs = Song.loveSongs
    
    var songsArrFilteredBySearch: [Song] {
        get {
            guard let searchString = searchString else {
                noResultLabel.isHidden = true
                return songs
            }
            guard searchString != "" else {
                noResultLabel.isHidden = true
                return songs
            }
            if let scopeTitles = searchBar.scopeButtonTitles {
                let currentScope = searchBar.selectedScopeButtonIndex
                noResultLabel.isHidden = true
                switch scopeTitles[currentScope] {
                case "Songs":
                    let results = songs.filter { $0.name.lowercased().contains(searchString) }
                    if results.count < 1 {
                        noResultLabel.isHidden = false
                    }
                    return results
                case "Artist":
                    let results = songs.filter { $0.artist.lowercased().contains(searchString) }
                    if results.count < 1 {
                        noResultLabel.isHidden = false
                    }
                    return results
                default:
                    return songs
                }
            }
            return songs
        }
    }
    
    var searchString: String? = nil {
        didSet {
            self.songsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTableView.delegate = self
        songsTableView.dataSource = self
        searchBar.delegate = self
        noResultLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = DetailsViewController.setUpFromStoryboard() {
            viewController.song = songsArrFilteredBySearch[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArrFilteredBySearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        cell.textLabel?.text = songsArrFilteredBySearch[indexPath.row].name
        cell.detailTextLabel?.text = songsArrFilteredBySearch[indexPath.row].artist
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text?.lowercased()
    }
    
}

