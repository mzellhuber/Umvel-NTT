//
//  TareasPendientesView.swift
//  Umvel-NTT
//
//  Created by Melissa Zellhuber on 25/09/23.
//

import SwiftUI

struct TareasPendientesView: View {
    @ObservedObject var tareaViewModel: TareaViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tareaViewModel.tareas.filter { !$0.estaCompleta }) { tarea in
                    Text(tarea.nombre)
                }
            }
            .navigationTitle("Tareas Pendientes")
        }
    }
}

#Preview {
    TareasPendientesView(tareaViewModel: TareaViewModel())
}
