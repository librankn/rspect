require 'rails_helper'

RSpec.describe "FoodEnquetes", type: :request do
  # describe "GET /food_enquetes" do
  #   it "works! (now write some real specs)" do
  #     get food_enquetes_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe '正常' do
    context 'アンケートに回答する' do
      it '回答できないこと' do
        # アンケートページにアクセスします
        get "/food_enquetes/new"
        # 正常に応答することを確認します
        expect(response).to have_http_status(200)

        # 正常な入力値を送信します
        post "/food_enquetes", params: { food_enquete: FactoryBot.attributes_for(:food_enquete_takana)}
        # リダイレクト先に移動します
        follow_redirect!
        # 送信完了のメッセージが含まれることを検証
        # expect(response.body).to include "お食事に関するアンケートを送信しました"
        expect(response.body).to include "ご回答ありがとうございました"
      end
    end
  end

  describe '異常' do
    context "アンケートに回答する" do
      it 'エラーメッセージが表示されること' do
        get "/food_enquetes/new"
        expect(response).to have_http_status(200)

        # 異常な入力値を送信します
        post "/food_enquetes" ,params: {food_enquete:{name: ''}}
        # 送信完了のメッセージが含まれないことを検証
        # expect(response.body).not_to include "お食事に関するアンケートを送信しました"
        expect(response.body).not_to include "ご回答ありがとうございました"
      end
    end
  end
end
