require 'rails_helper'

describe Event, type: :model do

  before do
    @event = FactoryBot.build(:event)
  end

  describe '予定の追加' do
    context '予定の追加がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@event).to be_valid
      end
    end
    
    context '予定の追加がうまくいかないとき' do
      it 'titleが空では登録されない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end