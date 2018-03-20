//
//  NetworkingBootstrapper.swift
//  WBooks
//
//  Created by Ariel Cid on 3/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import AlamofireNetworkActivityIndicator
import AlamofireNetworkActivityLogger

class NetworkingBootstrapper {

    static let shared = NetworkingBootstrapper()
    
    fileprivate let _sessionManager = SessionManager()
    
    fileprivate var networkingConfiguration: NetworkingConfiguration {
        return NetworkingConfiguration(
            useSecureConnection: true,
            domainURL: "wbooks-api-stage.herokuapp.com",
            subdomainURL: "/api/v1",
            usePinningCertificate: false)
    }
    
    private init() { }
    
    func bootstrap() {
        enableAlamofireNetworkActivityLogger()
        enableNetworkActivityIndicatorManager()
        bootstrapSessionManager()
        injectCurrentUserFetcher()
    }
    
    func createLibraryRepository() -> LibraryRepositoryType {
        return LibraryRepository(networkingConfiguration: networkingConfiguration, sessionManager: _sessionManager)
    }
    
}

// MARK: Private Methods
fileprivate extension NetworkingBootstrapper {
    
    func enableAlamofireNetworkActivityLogger() {
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
    }

    func enableNetworkActivityIndicatorManager() {
        NetworkActivityIndicatorManager.shared.isEnabled = true
    }

    func bootstrapSessionManager() {
        _sessionManager.bootstrap()
    }

    func injectCurrentUserFetcher() {
        let currentUser = User()
        
        if !_sessionManager.isLoggedIn {
            _sessionManager.login(user: currentUser)
        } else {
            print("User is already logged")
        }
    }
    
}
