doubleMe x = x + x
my_int = doubleMe 2
doubleSmallNumber x = if x > 100 then x else x * 2

lostNumbers = [4,8,15,16,23,42]

add_list = [1] ++ [2]

get_first_letter str = str !! 0

-- main = putStrLn $ show $ doubleSmallNumber 50
main = putStrLn $ show $ get_first_letter "Josh"
