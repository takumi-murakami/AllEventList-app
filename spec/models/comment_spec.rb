require 'rails_helper'

describe Comment, type: :model do

  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント' do
    context 'コメントがうまくいくとき' do
      it 'textが入力されていれば出品ができる' do
        expect(@comment).to be_valid
      end
    end
    
    context '予定の追加がうまくいかないとき' do
      it 'textが空では登録されない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end