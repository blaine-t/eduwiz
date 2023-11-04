pub contract UserProfile {

    pub resource User {
        pub var name: String
        pub var level: Int
        pub var quizzesCompleted: Int

        init(name: String) {
            self.name = name
            self.level = 0
            self.quizzesCompleted = 0
        }

        destroy() {
            
        }

        pub fun getName(): String {
            return self.name
        }

        pub fun setName(name: String) {
            self.name = name
        }

        pub fun getLevel(): Int {
            return self.level
        }

        pub fun quizComplete() {
            self.quizzesCompleted = self.quizzesCompleted + 1
            
            if self.quizzesCompleted >= 100 {
                self.level = 5
            } else if self.quizzesCompleted >= 50 {
                self.level = 4
            } else if self.quizzesCompleted >= 25 {
                self.level = 3
            } else if self.quizzesCompleted >= 10 {
                self.level = 2
            } else {
                self.level = 1
            }
        }

        pub fun getNumQuiz(): Int {
            return self.quizzesCompleted
        }
    }

    pub fun createUser(name: String): @User {
        return <- create User(name: name)
    }

    init() {
        log("User Created")
    }
}