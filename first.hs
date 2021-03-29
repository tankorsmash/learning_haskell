doubleMe x = x + x
my_int = doubleMe 2
doubleSmallNumber x = if x > 100 then x else x * 2

lostNumbers = [4,8,15,16,23,42]

add_list = [1] ++ [2]

get_first_letter str = str !! 0

print' x = putStrLn $ show x

-- main = putStrLn $ show $ doubleSmallNumber 50
-- main = putStrLn $ show $ get_first_letter "Josh"
-- main = putStrLn $ show $ length "Josh"
-- main = putStrLn $ show $ null [1, 2, 3]
-- main = putStrLn $ show $ reverse "Josh"
-- main = putStrLn $ show [2, 4..20] --make sure you give it a valid first set of two numbers, otherwise it goes forever with `[2, 1..2]`.

-- comp = [x*2 | x <- [1..10]]
-- complex_comp =[if x < 5 then x else 0 | x <- [1..10], or [odd x, even x]]
-- multi_input_comp = [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

is_uppercase c = elem c ['A'..'Z']
is_lowercase c = elem c ['a'..'z']

only_upper xs = [x | x <- xs, is_uppercase x]
only_lower xs = [x | x <- xs, is_lowercase x]

name = "Jackie"

main = print' $ only_upper name ++ " then only the lowercase letters: " ++ only_lower name
