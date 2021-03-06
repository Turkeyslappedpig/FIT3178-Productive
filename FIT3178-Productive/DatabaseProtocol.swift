//
//  DatabaseProtocol.swift
//  FIT3178-Productive
//
//  Created by Dillon Frawley on 22/4/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

enum DatabaseChange {
    case add
    case remove
    case update
}

enum ListenerType {
    case task
    case currentTask
    case completedTask
    case auth
    case all
}

protocol DatabaseListener: AnyObject {
    var listenerType: ListenerType {get set}
    func onTaskChange(change: DatabaseChange, tasks: [ToDoTask])
    func onAuthChange(change: DatabaseChange, currentUser: FirebaseAuth.User)
}

protocol DatabaseProtocol: AnyObject {
    func cleanup()
    
    func addListener(listener: DatabaseListener)
    func removeListener(listener: DatabaseListener)
    
    func addTask(taskTitle: String, taskDescription: String) -> ToDoTask
    func deleteTask(task : ToDoTask)
    
    func getTaskById(_ id: String) -> ToDoTask?
    func signIn( email: String, password: String)
    func createNewSignIn( email: String, password: String)
    var currentUser: FirebaseAuth.User? {get set}
    
}
