# block
# 1. {}
# 2. do ~ end

arr = ["John", "mino", "tak"]
arr.each do |name|
    puts name
    puts "저는 " + name + " 입니다."
end

phone_book = {
    "John" => "28561607",
    "mino" => "45623135",
    "tak" => "48652123"
}

phone_book.each {|key| puts key}