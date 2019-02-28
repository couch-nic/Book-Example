require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  include Docs::Books::Api

  let(:valid_attributes) {
    {
      title: "Christine",
      plot: "Christine plot goes here",
      release_date: '1983-04-29'
    }
  }

  let(:invalid_attributes) {
    {
      title: nil,
      plot: nil,
      author: nil,
      release_date: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BooksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    include Docs::Books::Index

    it "returns a success response", :dox do
      book = Book.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    include Docs::Books::Show

    it "returns a success response", :dox do
      book = Book.create! valid_attributes
      get :show, params: {id: book.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    include Docs::Books::Create

    context "with valid params", :dox do
      it "creates a new Book" do
        expect {
          post :create, params: {book: valid_attributes}, session: valid_session
        }.to change(Book, :count).by(1)
      end

      it "renders a JSON response with the new book" do

        post :create, params: {book: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(book_url(Book.last))
      end
    end

    context "with invalid params", :dox do
      it "renders a JSON response with errors for the new book" do

        post :create, params: {book: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    include Docs::Books::Update

    context "with valid params", :dox do
      let(:new_attributes) {
        {
          title: "The Shining",
          plot: "Shining plot goes here",
          release_date: Date.parse('1977-01-28')
        }
      }

      it "updates the requested book" do
        book = Book.create! valid_attributes
        put :update, params: {id: book.to_param, book: new_attributes}, session: valid_session
        book.reload
        expect(book.attributes).to include("title" => "The Shining")
      end

      it "renders a JSON response with the book" do
        book = Book.create! valid_attributes

        put :update, params: {id: book.to_param, book: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params", :dox do
      it "renders a JSON response with errors for the book" do
        book = Book.create! valid_attributes

        put :update, params: {id: book.to_param, book: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    include Docs::Books::Destroy

    it "destroys the requested book", :dox do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, params: {id: book.to_param}, session: valid_session
      }.to change(Book, :count).by(-1)
    end
  end

end
