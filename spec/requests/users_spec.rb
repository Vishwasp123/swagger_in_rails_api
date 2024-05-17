require 'swagger_helper'

RSpec.describe 'Users', type: :request do
  path '/users' do
    get('list users') do
      tags 'Users'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   address: { type: :string },
                   age: { type: :integer }
                 }
               }

        run_test!
      end
    end

    post('create user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          age: { type: :integer }
        },
        required: ['name']
      }

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 age: { type: :integer }
               }

        run_test!
      end
    end
  end

  path '/users/{id}' do
    parameter name: 'id', in: :path, type: :integer, required: true

    get('show user') do
      tags 'Users'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 age: { type: :integer }
               }

        run_test!
      end
    end

    patch('update user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          age: { type: :integer }
        }
      }

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 age: { type: :integer }
               }

        run_test!
      end
    end

    put('update user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          age: { type: :integer }
        }
      }

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 age: { type: :integer }
               }

        run_test!
      end
    end

    delete('delete user') do
      tags 'Users'
      response(200, 'successful') do
        schema type: :object,
               properties: {
                 messages: { type: :string },
                 user: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     name: { type: :string },
                     address: { type: :string },
                     age: { type: :integer }
                   }
                 }
               }

        run_test!
      end
    end
  end
end
