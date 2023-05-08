// Primeira página carregada ao abrir o aplicativo
// aqui contém a tabview(semelhante a uma taskbar) que será utilizada para chamar outras 3 páginas:
// 1. FICHA - conterá as fichas de um usuário.
// 2. EXERCÍCIOS - conterá os exercícios disponíveis no aplicativo.
// 3. FERRAMENTAS - conterá ferramentas relacionadas a saúde

import SwiftUI // Para usar o SwiftUI

struct ContentView: View {
    var body: some View {
      
        TabView {
            // Página que será chamada ao clicar em cada item da tab view.
            Fichas().tabItem {
                    // Contém o nome (que fica em baixo), e o ícone de cada item
                    Label("Fichas", systemImage: "list.bullet.clipboard.fill")
            }
            Exercicios().tabItem {
                    Label("Exercícios", systemImage: "dumbbell.fill")
            }
            Ferramentas().tabItem {
                    Label("Ferramentas", systemImage: "hammer.circle.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
