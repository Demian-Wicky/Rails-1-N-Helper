require 'colorize'
require 'linguistics'
Linguistics.use :en

system ('clear')
puts "┌─────────────────────────────────────────┐"
puts "│ On va créer une relation 1-N dans rails │"
puts "└─────────────────────────────────────────┘"
puts
puts "Quel est le nom de ta première table (1)?"
print "> "
table1 = gets.chomp.to_s
puts "$ " + "rails g model ".yellow + table1.yellow
puts

puts "Quel est le nom de ta deuxième table (N)?"
print "> "
table2 = gets.chomp.to_s
puts "$ " + "rails g model ".yellow + table2.yellow
puts

arrow = " 1 -----> M "

puts "┌".red + "─".red*(table1.size + 2) + "┐".red + " "*(arrow.size) + "┌".red + "─".red*(table2.size + 2) + "┐".red
puts "│ ".red + table1.red + " │".red + arrow + "│ ".red + table2.red + " │".red 
puts "└".red + "─".red*(table1.size + 2) + "┘".red + " "*(arrow.size) + "└".red + "─".red*(table2.size + 2) + "┘".red

line = "★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★ ☆ ★"

puts "Si tout est OK, appuie sur entrer."
gets
system ('clear')
puts line
puts
puts "Dans ton fichier de " + "MIGRATION ".red + "XXXXXXXX_create_#{table2.downcase.en.plural}.rb".cyan + " (dans db/migrate)" + ", ajoute ceci:"
puts "Vérifie bien que cette migration est " +"down".red + "."
puts
puts "t." + "belongs_to".green + " :#{table1.downcase}, index: true".blue
puts
puts line
puts
puts "Dans ton fichier " + "MODEL ".red + "#{table1.downcase}.rb".cyan + " (dans app/models)" + ", ajoute ceci:"
puts
puts "has_many" + " :#{table2.downcase.en.plural}".blue
puts
puts line
puts
puts "Dans ton fichier " + "MODEL ".red + "#{table2.downcase}.rb".cyan + " (dans app/models)" + ", ajoute ceci:"
puts
puts "belongs_to" + " :#{table1.downcase}".blue
puts
puts line
puts
puts "Un petit " + "rails db:migrate".green + " et tout est bon."
puts
puts line
puts