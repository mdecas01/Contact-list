contact_list = []

#Prompts the question, which by default is set to string type
def ask_question(question, kind="String")
  print question + " "
  answer = gets.chomp
  answer.to_i if kind == "number"
  return answer
end

def add_contact
  contact = {"name" => " ", "numbers" => []}
  contact["name"] = ask_question("What is the contact name?")
  answer = " "
  while answer != "n"
    answer = ask_question("Would you like to add a number to the contact? (y/n)")
    if answer == "y"
      contact_number = ask_question("Enter phone number: ", "number")
      contact["numbers"].push(contact_number)
    else
      break
    end
  end
  return contact
end

contact_list = []


init  = ask_question("Which operation would you like to perform? (type '-h' for help or 'q' to quit")

  if init == "-h"
    puts "type 'Add contact' to add a new contact."
    puts "type 'Delete contact' to delete a contact contact."
    puts "type 'Edit contact' to edit a contact."
  elsif init == "Add contact"
    answer = " "
    while answer != "n"
      contact_list.push(add_contact())
      answer = ask_question("Add another? (y/n")
    end
  else
    puts "Operation not suppoeted"
  end

puts "--------------------------------------"

contact_list.each do |contact|
  puts "contact name: #{contact["name"]}"
  if contact["numbers"].size > 0
    contact["numbers"].each do |number|
      puts "Number: #{number}"
    end
  else
    puts "No number."
  end
  puts "------------------------------------\r\n"
end