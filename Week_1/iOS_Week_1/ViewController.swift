//
//  ViewController.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToAlgorithmPage(_ sender: Any) {
        
        guard let viewController = storyboard?.instantiateViewController(identifier: "AlgorithmViewController") else {
            fatalError("Opps there is no such viewController")
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func basicsTest(_ sender: Any) {
        let teamName = "Fenerbahce"
        let country = "Turkey"
        let name = "Burhan"
        let surname = "Aliskan"
        
        let team = Team(teamName: teamName, country: country)
        selection(select: .boxer, team: team, name: name, surname: surname)
    }
    
    private func selection(select: SelectPlayer, team: Team, name: String, surname: String) {
        switch select {
        case .boxer:
            let boxer = Boxer(name: name, surname: surname)
            boxer.hello()
            boxer.setTeam(with: team)
            boxer.straight()
            boxer.leftCross()
            boxer.rightCross()
            boxer.uppercut()
        case .footballer:
            let footballer = Footballer(name: name, surname: surname)
            footballer.hello()
            footballer.setTeam(with: team)
            footballer.acceleration()
            footballer.feınt()
            footballer.shot()
            footballer.overheadKick()
        }
    }
}

