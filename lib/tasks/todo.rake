namespace :todo do
  desc "Deletes items that are more than 7 days old."
  task delete_expired: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
