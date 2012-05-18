desc "This task is called by the Heroku scheduler add-on"
task :update_all_restaurants_menus => :environment do
    puts "Updating menu..."
    RestaurantsController.update_all_restaurants_menus_itr
    puts "done."
end

