class CreateJoinTablePositionsRecruiters < ActiveRecord::Migration
  def change
    create_join_table :positions, :recruiters do |t|
      t.index [:position_id, :recruiter_id]
      t.index [:recruiter_id, :position_id]
    end
  end
end
