require 'rails_helper'

RSpec.describe "FoodEnquetes", type: :system do
  describe '正常' do
    context "アンケートに回答する" do
      it "回答できること" do
        # 「田中太郎」のテストデータを作成します
        enquete = FactoryBot.create(:food_enquete_takana)
        # アンケートページにアクセスします
        visit "/food_enquetes/new"
        # テキストボックスに値を入力します
        fill_in 'お名前', with: enquete.name
        # テキストボックスに値を入力します
        fill_in 'メールアドレス', with: enquete.mail
        # テキストボックスに値を入力します
        fill_in '年齢', with: enquete.age
        # セレクトボックスを選択します
        select enquete.food_name, from: 'お召し上がりになった料理'
        # ラジオボタンを選択します
        choose "food_enquete_score_#{enquete.score}"
        # テキストボックスに値を入力します
        fill_in 'ご意見・ご要望', with: enquete.request
        # セレクトボックスを選択します
        select enquete.present_name, from: 'ご希望のプレゼント'
        
        # 見た目をわかりやすくするために動作を2秒止める
        # 通常は自動テストが遅くなるため不要な処理
        sleep 2
        # 「登録する」ボタンをクリック
        click_button '登録する'
        
        # 回答が完了したか検証
        expect(page).to have_content 'ご回答ありがとうございました'
        expect(page).to have_content 'お名前: 田中 太郎'
        expect(page).to have_content 'メールアドレス: taro.tanaka@example.com'
        expect(page).to have_content '年齢: 25'
        expect(page).to have_content 'お召し上がりになった料理: やきそば'
        expect(page).to have_content '満足度: 良い'
        expect(page).to have_content 'ご意見・ご要望: おいしかったです。'
        expect(page).to have_content 'ご希望のプレゼント: 【10名に当たる】ビール飲み放題'

        # 見た目をわかりやすくするために動作を5秒止める
        # 通常は自動テストが遅くなるため不要な処理
        sleep 5
        
      end
    end
  end
end
