// Salva o user e a senha no localStorage como Json

import Foundation

struct User: Codable {
    var username: String
    var password: String
}

struct UserManager {
    static func saveUser(username: String, password: String) {
        // let nome = username
        let newUser = User(username: username, password: password)
        let userDefaults = UserDefaults.standard
        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(newUser)
            userDefaults.set(data, forKey: "user")
        } catch {
            print("Failed to encode user data: \(error.localizedDescription)")
        }
    }

    static func getUser() -> User? {
        let userDefaults = UserDefaults.standard
        let decoder = JSONDecoder()

        if let userData = userDefaults.data(forKey: "user") {
            do {
                let user = try decoder.decode(User.self, from: userData)
                return user
            } catch {
                print("Failed to decode user data: \(error.localizedDescription)")
            }
        }
        
        return nil
    }
}
