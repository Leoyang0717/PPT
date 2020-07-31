namespace :db do
  desc '更新文章序號'
  task :update_serial => :environment do
    puts "--------------"
    puts "更新中"
    puts "--------------"
    Post.where(serial: nil).each do |post| 
      post.update(serial: serial_generator(10))
    end
    puts "好了辣"
  end

  private
  def serial_generator(n)
    ([*0..9,*'a'..'z',*'A'..'Z'] - ['i',1,'l',0,'o','I']).sample(n).join  
  end
end