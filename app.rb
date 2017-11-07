require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'uri'




get '/' do
    send_file 'index.html'
end

get '/welcome/:name' do
    "Welcome! #{params['name']} page"
end

get '/lunch' do
    lunch = ["20층","순남시레기","시골집","김밥까페"]
    @photos = {
        "20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/20987024_1431422050287339_2004189507347283968_n.jpg?ig_cache_key=MTU4NzUwMTg2NjEwNzc3MTI0Nw%3D%3D.2",
        "김밥까페" =>"http://www.gimgane.co.kr/board/data/file/menu/1935589795_afscgN0k_EAB980EAB080EB84A4EAB980EBB0A5_EC8B9CEAB888ECB998_.jpg",
        "순남시레기" =>"http://cfile25.uf.tistory.com/image/235FF03455A3421504721F",
        "시골집" =>"http://scontent.cdninstagram.com/t51.2885-15/s480x480/e35/c135.0.809.809/16123011_598795153637429_9199733400146018304_n.jpg?ig_cache_key=MTQzNDg2NDg2MjQ0MjE5ODQxOQ%3D%3D.2.c"
        
    }
    
    @menu = lunch.sample
    erb :lunch

end


get '/lotto' do
    @lotto = (1..45).to_a.sample(6).sort
    erb :lotto
end


get '/lol' do
    erb :lol
end

get '/search' do
    url = "http://www.op.gg/summoner/userName="
    @id = params[:userName]
    keyword = URI.encode(params[:userName])
    res = HTTParty.get(url + keyword)
    text = Nokogiri::HTML(res.body)
    @win = text.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
    @lose = text.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")
    erb:search
end
    

get '/cube/:number' do 
    input = params['number']
    result = input.to_i ** 3
    "#{params['number']}의 세제곱 값은 #{result}"
end