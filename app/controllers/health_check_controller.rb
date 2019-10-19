class HealthCheckController < ApplicationController
  def index
# ヘルスチェック用に json を返します。
    render json: '{ "status": "ok" }'
  end
end