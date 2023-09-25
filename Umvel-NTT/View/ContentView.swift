//
//  ContentView.swift
//  Umvel-NTT
//
//  Created by Melissa Zellhuber on 22/09/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var mostrandoModal: Bool = false
    @ObservedObject var tareaViewModel = TareaViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if tareaViewModel.tareas.isEmpty {
                    Text("No hay tareas")
                        .foregroundColor(.gray)
                        .italic()
                } else {
                    List {
                        ForEach(tareaViewModel.tareas) { tarea in
                            HStack {
                                Text(tarea.nombre)
                                
                                Toggle("", isOn: Binding(
                                    get: { tarea.estaCompleta },
                                    set: { newValue in
                                        if let index = tareaViewModel.tareas.firstIndex(where: { $0.id == tarea.id }) {
                                            tareaViewModel.cambiarTareaCompleta(at: index)
                                        }
                                    }
                                ))
                            }
                        }
                        .onDelete(perform: tareaViewModel.borrar)
                        
                        NavigationLink(destination: TareasPendientesView(tareaViewModel: tareaViewModel)) {
                            Text("Ver Tareas Pendientes")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Tareas")
            .navigationBarItems(trailing: Button(action: {
                mostrandoModal = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $mostrandoModal) {
                AgregarTareaView(tareaViewModel: tareaViewModel, mostrandoModal: $mostrandoModal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
