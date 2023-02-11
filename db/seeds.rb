# frozen_string_literal: true

User.create!(email: 'admin@teste.com',
             name: 'Admin',
             last_name: 'Teste',
             role: 2,
             password: 'password',
             password_confirmation: 'password')
