//
//  FilmViewProtocol.swift
//  CleanArchitecture
//
//  Created by Marcin Kuptel on 21/02/2016.
//  Copyright © 2016 Marcin Kuptel. All rights reserved.
//

import Foundation

protocol FilmViewProtocol: class {
    func presentFilms(films: [FilmDisplay])
}