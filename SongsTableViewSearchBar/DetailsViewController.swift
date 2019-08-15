//
//  DetailsViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Jason Ruan on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var song: Song!
    
    @IBOutlet weak var imageArtView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    private func setUpViews() {
        imageArtView.image = UIImage(named: "loveSongs")
        songNameLabel.text = song.name
        artistNameLabel.text = song.artist
    }
    
    static func setUpFromStoryboard() -> DetailsViewController? {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as? DetailsViewController {
            return viewController
        }
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
