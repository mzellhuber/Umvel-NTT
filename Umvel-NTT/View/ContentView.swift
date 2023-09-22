//
//  ContentView.swift
//  Umvel-NTT
//
//  Created by Melissa Zellhuber on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var mostrandoModal: Bool = false
    @ObservedObject var tareaViewModel = TareaViewModel()
    
    var body: some View {
        NavigationView {
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

#Preview {
    ContentView()
}
