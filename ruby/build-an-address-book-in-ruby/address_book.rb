# frozen_string_literal: true

require './contact'

# Class
class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      results.push(contact) if contact.full_name.downcase.include?(search)
    end
    print_results("Name search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub('-', '')
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub('-', '').include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end

    print_results("Phone search results (#{search})", results)
  end

  def print_contat_list
    puts 'Contact list'
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

mohamed = Contact.new
mohamed.first_name = 'Mohamed'
mohamed.last_name = 'Zouari'
mohamed.add_phone_number('Home', '123-456-7890')
mohamed.add_phone_number('Work', '456-789-0123')
mohamed.add_address('Home', '123 Main St.', '', 'Portland', 'OR', '12345')

nick = Contact.new
nick.first_name = 'Nick'
nick.last_name = 'Pettit'
nick.add_phone_number('Home', '222-333-4444')
nick.add_address('Home', '222 Two Lane', '', 'Portland', 'OR', '12345')

address_book.contacts.push(mohamed)
address_book.contacts.push(nick)

# address_book.print_contat_list

address_book.find_by_name('e')
address_book.find_by_phone_number('2')
