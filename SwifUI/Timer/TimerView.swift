import SwiftUI
import AVFoundation

struct TimerView: View {
    @State private var timeRemaining: Double = 50 // padrão: 50 segundos
    @State private var isRunning = false
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var alertShown = false
    @State private var backgroundToggle = true
    @State private var selectedTimerStyle = TimerStyle.round // padrão: cronômetro redondo
    
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
                    .clipShape(Capsule())
            }
            
            Picker(selection: $selectedTimerStyle, label: Text("Estilo do cronômetro")) {
                ForEach(TimerStyle.allCases, id: \.self) { style in
                    Text(style.rawValue.capitalized)
                        .tag(style)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.top)
        }
        .alert(isPresented: $alertShown) {
            Alert(title: Text("Tempo acabou!"), message: Text("O tempo selecionado foi atingido."), dismissButton: .default(Text("OK")))
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}