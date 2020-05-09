//
//  TrackRepository.swift
//  Local Media
//
//  Created by Robert Sandru on 5/9/20.
//  Copyright © 2020 codecontrive. All rights reserved.
//

import Foundation
import Combine

protocol TrackRepositoryProtocol: Repository {
    
}

protocol TrackError: Error {
    
}

class TrackRepository<T: Track, E: TrackError>: TrackRepositoryProtocol {
    func create() -> PassthroughSubject<T, E> {
        return PassthroughSubject<T, E>()
    }
    

    
}
