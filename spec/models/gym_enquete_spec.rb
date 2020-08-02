require 'rails_helper'

RSpec.describe GymEnquete, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe '共通バリデーション' do
    it_behaves_like '入力項目の有無'
    it_behaves_like 'メールアドレスの形式'
  end

  describe '共通メソッド' do
    it_behaves_like '価格の表示'
    it_behaves_like '満足度の表示'
  end
end
