import SwiftUI
import AVFoundation

struct TimerView: View {
    @State private var timeRemaining: Double = 50 // padrão: 50 segundos
    @State private var isRunning = false
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var alertShown = false
    @State private var backgroundToggle = true
    @State private var selectedTimerStyle = TimerStyle.round // padrão: cronômetro redondo
    @State private var messageShown = false // nova propriedade de estado para controlar a exibição da mensagem personalizada
    
    private let soundPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "notification_sound", ofType: "mp3") ?? ""))
    
    private var timeFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }
    
    private var backgroundColor: Color {
        return backgroundToggle ? .white : .red
    }
    
    private enum TimerStyle: String, CaseIterable {
        case round, square
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 10)
                    .opacity(0.3)
                Text(timeFormatter.string(from: timeRemaining) ?? "")
                    .font(.system(size: 80))
                    .fontWeight(.thin)
                    .onReceive(timer) { _ in
                        if isRunning {
                            if timeRemaining <= 0 {
                                isRunning = false
                                alertShown = true
                                messageShown = true // exibir a mensagem personalizada quando o tempo acabar
                                soundPlayer?.play()
                            } else {
                                timeRemaining -= 0.01
                            }
                        }
                    }
                    .padding()
            }
            .padding()
            .frame(width: selectedTimerStyle == .round ? 300 : 200, height: selectedTimerStyle == .round ? 300 : 200)
            .background(backgroundColor)
            .clipShape(selectedTimerStyle == .round ? Circle() : RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                messageShown = false // ocultar a mensagem personalizada quando o usuário clicar na tela
            } // adicionar o gesto de tap
            
            Slider(value: $timeRemaining, in: 1...3600, step: 1)
                .padding()
            
            Button(action: {
                if isRunning {
                    isRunning = false
                    timer.upstream.connect().cancel()
                } else {
                    isRunning = true
                    timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
                }
            }) {
                Text(isRunning ? "Pausar" : "Iniciar")
                    .padding()
                    .frame(width: 150, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()

    
                   Picker(selection: $selectedTimerStyle, label: Text("Estilo do Timer")) {
                            ForEach(TimerStyle.allCases, id: \.self) { style in
                                Text(style.rawValue.capitalized).tag(style)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        }
                        .alert(isPresented: $alertShown) {
                            Alert(title: Text("Tempo esgotado!"), message: Text("Seu tempo acabou."), dismissButton: .default(Text("OK")))
                        }
                        .onChange(of: backgroundToggle) { newValue in
                            if !isRunning {
                                backgroundColor = newValue ? .white : .red
                            }
                        }
                        .onChange(of: selectedTimerStyle) { _ in
                            if !isRunning {
                                backgroundColor = backgroundToggle ? .white : .red
                            }
                        }
                        .onAppear {
                            do {
                                try AVAudioSession.sharedInstance().setCategory(.playback)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                        .onDisappear {
                            if isRunning {
                                isRunning = false
                                timer.upstream.connect().cancel()
                            }
                        }
                        .navigationBarTitle("Timer")
                        .navigationBarItems(trailing: Toggle(isOn: $backgroundToggle) {
                            Text("Fundo \(backgroundToggle ? "claro" : "escuro")")
                        })
                    }
                    }

                    struct TimerView_Previews: PreviewProvider {
                        static var previews: some View {
                            TimerView()
                        }
                    }
