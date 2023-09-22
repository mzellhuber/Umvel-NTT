//
//  TareaViewModel.swift
//  Umvel-NTT
//
//  Created by Melissa Zellhuber on 22/09/23.
//

import Foundation

class TareaViewModel: ObservableObject {
    @Published var tareas: [Tarea] = []
    
    func agregarTarea(nombre: String) {
        let tarea = Tarea(nombre: nombre, estaCompleta: false)
        tareas.append(tarea)
    }
    
    func borrar(at offsets: IndexSet) {
        tareas.remove(atOffsets: offsets)
    }
    
    func cambiarTareaCompleta(at index: Int) {
        tareas[index].estaCompleta.toggle()
    }
}
