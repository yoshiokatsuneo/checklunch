desc "This task is called by the Heroku scheduler add-on"
task :update_all_restrants_menus => :environment do
    puts "Updating menu..."
    RestrantsController.update_all_restrants_menus_itr
    puts "done."
end

