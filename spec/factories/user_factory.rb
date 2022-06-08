# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Admin' }
    email  { 'admin@flix.com' }
    admin { true }
    password { '123123 ' }
    password_confirmation { '123123 ' }
  end
end
