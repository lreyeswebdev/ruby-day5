#Single Responsibility Principle
#class is responsible for only one aspect of the program 
class Age 
    def initialize(current_year, birth_year)
        @current_year = current_year
        @birth_year = birth_year
    end

    def current_age
        @current_year - @birth_year
    end
end

baby = Age.new(2020, 2017)
puts baby.current_age

#Open/ Closed Principle
#class is open for extension or modification
#additional sender types can be included in the future
class Sender
    def initialize(user, message)
        @user = user
        @message = message
    end
end

class EmailSender < Sender
    def send 
        puts "#{@user} sent #{@message} via email."
    end
end

class SmsSender < Sender
    def send 
        puts "#{@user} sent #{@message} via SMS."
    end
end

#Liskov substitution principle
#you can replace instances of parent class with an instance of one of its children without errors
class Human
    def talk
        "I'm Human"
    end
end

class HomoHabilis < Human
    def talk
        "Arrgghh"
    end
end

class HomoSapiens < Human
    def talk
        "Hello!"
    end
end

class Introduction
    def introduce_human(human)
        puts "#{human.talk}"
    end
end

lucy = Introduction.new
lucy.introduce_human(Human.new)
lucy.introduce_human(HomoHabilis.new)
lucy.introduce_human(HomoSapiens.new)

#Interface Segregation Principle
#client should not be forced to depend on methods that it does not use
class FastFoodUserInterface
    def select_meal
        "selecting preferred meal"
    end

    def provide_payment
        "payment given"
    end
end

class FastFoodServiceInterface
    def accept_order
        "order accepted"
    end

    def prepare_order
        "preparing order"
    end

    def accept_payment
        "payment accepted"
    end

    def serve_food
        "serving ordered food"
    end
end

class Person
    def initialize
        @fast_food = FastFoodUserInterface.new
    end

    def buy_food
        puts @fast_food.select_meal
        puts @fast_food.provide_payment
    end
end

class Staff
    def initialize
        @fast_food = FastFoodServiceInterface.new
    end

    def service 
        puts @fast_food.accept_order
        puts @fast_food.prepare_order
        puts @fast_food.accept_payment
        puts @fast_food.serve_food
    end
end

karen = Person.new
karen.buy_food

jollibee = Staff.new
jollibee.service

#Dependency Inversion Principle
#high-level modules shouldn't depend on low-level modules
class Printer
    def initialize(data)
        @data = data
    end

    def print(formatter: PdfFormatter.new)
        formatter.format(@data)
    end
end

class PdfFormatter
    def format(data)
        # format data to Pdf logic
    end
end

class HtmlFormatter
    def format(data)
        # format data to Html logic
    end
end
