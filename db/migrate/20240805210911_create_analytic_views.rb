# frozen_string_literal: true

class CreateAnalyticViews < ActiveRecord::Migration[7.1]
  def change
    create_table :analytic_views do |t|
      t.uuid :visitor_id, null: false
      t.uuid :session_id, null: false
      t.string :path, null: false
      t.string :host, null: false
      t.jsonb :params, null: false, default: {}
      t.datetime :timestamp, null: false

      t.timestamps

      t.index %i[timestamp path]
      t.index %i[timestamp visitor_id]
      t.index %i[timestamp session_id]
    end
  end
end
