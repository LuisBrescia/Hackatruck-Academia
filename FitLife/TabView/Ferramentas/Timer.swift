import SwiftUI
import AVFoundation

struct TimerView: View {
    @State var timeRemaining = 50
    @State var selectedTime = 0
    @State var timerPaused = true
    @State private var audioPlayer: AVAudioPlayer!
    @State var showPicker = false
    @State var alarmEnabled = true
    
    func formatTime(_ time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {

        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.white, .white, .gray]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                
                Text("Timer")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 100)
                
                Text(formatTime(timeRemaining))
                    .font(.system(size: 100))
                    .padding()
                    .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                        if timeRemaining > 0 && !timerPaused {
                            timeRemaining -= 1
                        } else if timeRemaining == 0 {
                            timerPaused = true
                            if alarmEnabled {
                                guard let soundFile = NSDataAsset (name: "alarm") else{
                                    print("@ Could not read file named \("alarm")")
                                    return
                                }
                                do {
                                    audioPlayer = try AVAudioPlayer (data: soundFile.data)
                                    audioPlayer.play()
                                } catch {
                                    print("@ERROR: \(error.localizedDescription) creating audioPlayer.")
                                }
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, 100)
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack() {
                    Spacer()
                    Button(action: {
                        resetTimer()
                    }) {
                        Text("Reset")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button(action: {
                        if timeRemaining == 0 {
                            timeRemaining = selectedTime
                        }
                        timerPaused.toggle()
                    }) {
                        Image(systemName: timeRemaining == 0 ? "play.fill" : (timerPaused ? "play.fill" : "pause.fill"))
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                            .clipShape(Circle())
                        
                    } .padding(.leading, 28.0)
                    
                    VStack(alignment: .center) {
                        Toggle("", isOn: $alarmEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .padding(.trailing, 33)
                        Text("Alarme")
                            .foregroundColor(.blue)
                    }
                    
                }
                .padding()
                Button(action: {
                    showPicker.toggle()
                }) {
                    Image(systemName: "clock")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .sheet(isPresented: $showPicker) {
                    VStack {
                        Picker(selection: $selectedTime, label: Text("Select Time")) {
                            ForEach(1...60, id: \.self) {
                                Text("\($0 * 5) seconds")
                            }
                        }
                        .padding()
                        Button("Confirm") {
                            selectedTime = selectedTime * 5
                            if timeRemaining > 0 {
                                timeRemaining = selectedTime
                            }
                            showPicker.toggle()
                        }
                    }
                }
            }
        }.toolbar(.hidden, for: .tabBar)
    }
    
    func resetTimer() {
        timeRemaining = 50
        selectedTime = 0
        timerPaused = true
        showPicker = false
        audioPlayer.pause()
    }
    
    struct TimerView_Previews: PreviewProvider {
        static var previews: some View {
            TimerView()
        }
    }
}
