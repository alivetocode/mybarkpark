namespace :checkout do
  desc "TODO"
  task auto_checkout: :environment do
    CheckIn.where(check_out_at: nil)
      .where("created_at < ?", Time.now - 30.minutes)
      .update_all(check_out_at: Time.now)
  end

end
