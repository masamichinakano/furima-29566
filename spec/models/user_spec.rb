require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '項目全て存在するときは新規登録できる' do
      # binding.pry
      expect(@user).to be_valid
    end

    it 'nicknameが存在しないと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'nicknameは重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.nickname = @user.nickname
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Nickname has already been taken')
    end

    it 'emailが存在しないと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@が存在しないと登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが存在しないと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは６文字以下では登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'f_nameが存在しないと登録できない' do
      @user.f_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("F name can't be blank")
    end

    it 'f_nameが半角であると登録できない' do
      @user.f_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('F name is invalid')
    end

    it 'l_nameが存在しないと登録できない' do
      @user.l_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("L name can't be blank")
    end

    it 'l_nameが半角であると登録できない' do
      @user.l_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('L name is invalid')
    end

    it 'f_name_leaderが存在しないと登録できない' do
      @user.f_name_leader = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("F name leader can't be blank")
    end

    it 'f_name_leaderが半角であると登録できない' do
      @user.f_name_leader = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('F name leader is invalid')
    end

    it 'f_name_leaderがひらがなであると登録できない' do
      @user.f_name_leader = 'やまだﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('F name leader is invalid')
    end

    it 'f_name_leaderが漢字であると登録できない' do
      @user.f_name_leader = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('F name leader is invalid')
    end

    it 'l_name_leaderが存在しないと登録できない' do
      @user.l_name_leader = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("L name leader can't be blank")
    end

    it 'f_name_leaderが半角であると登録できない' do
      @user.l_name_leader = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('L name leader is invalid')
    end

    it 'f_name_leaderがひらがなであると登録できない' do
      @user.l_name_leader = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('L name leader is invalid')
    end

    it 'f_name_leaderが漢字であると登録できない' do
      @user.l_name_leader = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('L name leader is invalid')
    end

    it 'birthdayが存在しないと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
