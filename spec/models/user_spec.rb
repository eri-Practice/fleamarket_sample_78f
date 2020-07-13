require 'rails_helper'
describe User do
  describe '#create' do

  it "登録完了しました" do
    user = build(:user)
    user.valid?
    expect(user).to be_valid
  end

  it "パスワードは7文字以上でないと無効" do
    user = build(:user, password: "123456")
    user.valid?
    expect(user.errors[:password]).to include("は7文字以上で入力してください")
  end

  it "パスワードが7文字以上なら登録できる " do
    user = build(:user, password: "1234567", password_confirmation: "1234567")
    expect(user).to be_valid
  end

  it "確認用パスワードが空では登録できない" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません", "を入力してください")
  end

  it "ニックネームが空では無効" do
    user = build(:user, nickname: "")
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end

  it "メールアドレスが空では無効" do
    user = build(:user, email: "")
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードが空では無効" do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "確認用パスワードが空では無効" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("を入力してください")
  end

  it "名が空では無効" do
    user = build(:profile, first_name: "")
    user.valid?
    expect(user.errors[:first_name]).to include("を入力してください")
  end

  it "性が空では無効" do
    user = build(:profile, family_name: "")
    user.valid?
    expect(user.errors[:family_name]).to include("を入力してください")
  end

  it "名(カナ)が空では無効" do
    user = build(:profile, first_name_kana: "")
    user.valid?
    expect(user.errors[:first_name_kana]).to include("を入力してください")
  end
  it "性(カナ)が空では無効" do
    user = build(:profile, family_name_kana: "")
    user.valid?
    expect(user.errors[:family_name_kana]).to include("を入力してください")
  end

  it "生年月日が空では無効" do
    user = build(:profile, birth_date: "")
    user.valid?
    expect(user.errors[:birth_date]).to include("を入力してください")
  end

  it "送り先名の名が空では無効" do
    user = build(:sending_destination, destination_first_name: "")
    user.valid?
    expect(user.errors[:destination_first_name]).to include("を入力してください")
  end

  it "送り先名の性が空では無効" do
    user = build(:sending_destination, destination_family_name: "")
    user.valid?
    expect(user.errors[:destination_family_name]).to include("を入力してください")
  end

  it "送り先名の性(カナ)を入力してください" do
    user = build(:sending_destination, destination_family_name_kana: "")
    user.valid?
    expect(user.errors[:destination_family_name_kana]).to include("を入力してください")
  end

  it "送り先名の名(カナ)が空では無効" do
    user = build(:sending_destination, destination_first_name_kana: "")
    user.valid?
    expect(user.errors[:destination_first_name_kana]).to include("を入力してください")
  end

  it "郵便番号が空では無効" do
    user = build(:sending_destination, post_code: "")
    user.valid?
    expect(user.errors[:post_code]).to include("を入力してください")
  end

  it "市区町村が空では無効" do
    user = build(:sending_destination, post_code: "")
    user.valid?
    expect(user.errors[:post_code]).to include("を入力してください")
  end

  it "都道府県が空では無効" do
    user = build(:sending_destination, prefecture_code: "")
    user.valid?
    expect(user.errors[:prefecture_code]).to include("を入力してください")
  end

  it "番地が空では無効" do
    user = build(:sending_destination, house_number: "")
    user.valid?
    expect(user.errors[:house_number]).to include("を入力してください")
  end


  it "メールアドレスが重複すると無効" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します")
  end

  end
end