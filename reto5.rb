class Question

  def initialize(respuesta, definition)
    @definition = definition
    @respuesta = respuesta
  end

  def message
    "Pregunta\n#{@definition}"
  end

  def check
    while true
      puts "*** "
      @answer = gets.chomp
      
      if @answer == @respuesta
        puts "Bien!"
        puts "---------------------------------------------------------------"
        break
      end

      puts "Perdiste, Vamos de nuevo!"
    end
  end

end


class Game

  attr_reader :questions

  def initialize
      @questions = []
      build_questions
  end

  private 
    def build_questions 
      File.open("game.txt").each do |line|
        new_line = line.split(";")
        @questions << Question.new(new_line[1].strip, new_line[0])
      end
    end

end

puts "Hola! Por favor ingresa las respuestas corectas, si ganas te ganarás un viaje! :D"
puts ":D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D/:D"

game = Game.new

game.questions.each do |question|
  puts question.message
  question.check
end

puts "Terminaste! Espera nuestra llamada, te vas para Aití"