import Data.Char
import Data.String as T

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

-- main = print' $ only_upper name ++ " then only the lowercase letters: " ++ only_lower name

my_pair = (1, name)

-- main = print' $ my_pair

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

-- main = print' $ lucky 6

say_my_name :: String -> String
say_my_name "Josh" = "Your name is NOT Josh"
say_my_name my_name = "alright your name is " ++ my_name

-- main = print' $ say_my_name "Peter"

addVectors :: (Num v) => (v, v) -> (v, v) -> (v, v)
addVectors (x1, y1) (x2, y2) = (x1+x2, y1+y2)
-- addVectors a b = (fst a + fst b, snd a + snd b)

-- main = print' $ addVectors (10, 11) (5, 6)

--
-- tell :: (Show a) => [a] -> String
-- tell [] = "Empty"
-- tell (x:[]) = "One element" ++ show x
-- tell (x:_) = "many"

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- main = print' $ tell ([] :: [Int])
-- main = print' $ tell [123, 222, 33, 4444]

-- main = putStrLn $ "ASDASD"

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- main = print' $ length' [1,2,3, 4, 5]

capital :: String -> String
capital "" = "No letter to capitalize"
capital all@(x:xs) = "The first letter of "++all++" is " ++ [x] -- [x] has to be wrapped because otherwise you can't add a Char to a String

-- main = print' $ capital "Josh"

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "underweight"
    | bmi <= 25.0 = "normal"
    | bmi <= 30.0 = "fat"
    | otherwise = "whale"

-- main = print' $ bmiTell 29

myCompare :: (Ord a) => a -> a -> Ordering
-- a `myCompare` b
myCompare a b
    | a > b = GT
    | a ==b = EQ
    | a < b = LT

-- main = print' $ myCompare 3 2
-- main = print' $ 3 `myCompare` 2

-- calc :: (Int a) => a -> a -> a --idk why this doesn't work
calc :: Int ->Int ->Int
calc x y
    | xy < 10 = 0
    | otherwise = xy
    where xy = x + y

-- main = print' $ calc 10 25

-- round to two digits TODO: figure out how to dynically round returned value
round2 :: (RealFloat a) => a -> a
round2 x = fromIntegral (round x*100) / 100.0

calcBMIs :: (RealFloat a) => [(a, a)] -> [a]
calcBMIs xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = round2 $ (weight / height ^ 2)

-- main = print' $ calcBMIs [(76, 1.23), (67, 1.11), (89, 1.22)]

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g y x = f x y


sub' :: (Num a) => a -> a -> a
sub' x y = x - y

-- main = print' $ (flip' sub') 10 1

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0


-- findKey :: (Eq k) => k -> [(k,v)] -> v
-- findKey key xs = snd . head . filter (\(k,v) -> key == k) $ xs

findKey :: String -> [(String, v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs) = if (map toLower key) == map toLower k
                        then Just v
                        else findKey key xs


book = [
    ("Josh", 123),
    ("Matt", 322),
    ("Olivia", 420)]

main = print' book
