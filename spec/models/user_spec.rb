require 'rails_helper'

RSpec.describe User, type: :model do
   
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
       expect(@user).to be_valid
      end
    end
   context "ユーザー新規登録できない時" do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'brith_dayがからでは登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが一意性では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'あ'
      @user.password_confirmation = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password は半角英数を両方含む必要があります")
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '333333'
      @user.password_confirmation = '333333'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'a'
      @user.password_confirmation = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password は半角英数を両方含む必要があります")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
   end
   context '姓（全角）が空の場合' do
    it '登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
  end
   context '姓（全角）に半角文字が含まれている場合' do
    it '登録できないこと' do
      @user.family_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name は全角で入力してください')
    end
    it '登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '登録できないこと' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください")
    end
    it '登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it '登録できないこと' do
      @user.family_name_kana = '山田太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana は全角カタカナで入力してください")
    end
    it '登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it '登録できないこと' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください")
    end
   end
  end
end
