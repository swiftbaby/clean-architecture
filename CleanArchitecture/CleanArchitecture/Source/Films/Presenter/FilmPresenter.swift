//
//  FilmPresenter.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

class FilmPresenter {
    weak var view: FilmViewProtocol!
    private let router: FilmRouter
    private let interactor: FilmInteractor
    private static let dataFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd'-'MM'-'yyyy"
        return formatter
    }()
    
    init(router r: FilmRouter, interactor i: FilmInteractor){
        router = r
        interactor = i
    }
    
    func viewDidLoad(){
        interactor.fetchNominatedFilms()
    }
}

extension FilmPresenter: FilmPresenterProtocol {
    func fetchingNominatedFilmsSucceeded(films: [Film]) {
        let converted = films.map {
            FilmDisplay(title: $0.title, releaseDate:  FilmPresenter.dataFormatter.stringFromDate($0.releaseDate))
        }
        view.presentFilms(converted)
    }
    
    func fetchingNominatedFilmsFailed() {
        
    }
}