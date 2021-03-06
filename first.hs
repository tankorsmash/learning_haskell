-- This is all from http://learnyouahaskell.com/chapters, with the _tiniest_ of changes from me

import Data.Char
import Data.String as T
import qualified Data.Map as Map

import System.IO
import System.Directory
import Data.List

import System.Environment

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

lowerWord = map toLower

findKey :: String -> [(String, v)] -> Maybe v
-- findKey key [] = Nothing
-- findKey key ((k,v):xs) = if (map toLower key) == map toLower k
--                         then Just v
--                         else findKey key xs
findKey key = foldr (\(k,v) acc -> if lowerWord key == lowerWord k then Just v else acc) Nothing


fromList_si :: [(String, Int)] -> Map.Map String Int
fromList_si = foldr (\(k,v) acc -> Map.insert k v acc) (Map.fromList [("Nate", 555)])

fromList_sf :: [(String, Float)] -> Map.Map String Float
fromList_sf = foldr (\(k,v) acc -> Map.insert k v acc) (Map.fromList [("Nate", 555.0)])


book = [
    ("Josh", 123),
    ("Matt", 322),
    ("Olivia", 420)]

-- main = print' book


data Circle = Circle Int Int Int

print_circle :: Circle -> String
print_circle (circle) = "ASDADS"
-- print_circle (Circle, ox, oy, r) = "ASDADS"

-- instance Show Circle where
--     show (Circle ox oy r) = show ox
-- show :: Circle -> String
-- show (Circle ox oy r) = "The origin's xy are: "

-- my_circle = Circle 123 123 30
-- main = print' $ print_circle my_circle


data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
        Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
        Just (state, code) -> if state /= Taken
                            then Right code
                            else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken,"ZD39I"))
    ,(101,(Free,"JAH3I"))
    ,(103,(Free,"IQSA9"))
    ,(105,(Free,"QOTSA"))
    ,(109,(Taken,"893JJ"))
    ,(110,(Taken,"99292"))
    ]


data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
      | x < a  = Node a (treeInsert x left) right
        | x > a  = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
      | x < a  = treeElem x left
        | x > a  = treeElem x right


-- main = do
--     print' "hello whats your name?"
--     print' $ "Hey " ++ name ++ ", you rock!"

-- main = do
--     c <- getChar
--     if c /= ' '
--         then do
--             putChar c
--             main
--         else do
--             print' $ ": end of the world " ++ [c]
--             return ()

-- main = do
--     rs <- sequence [getLine, getLine, getLine]
--     print' rs

-- main = interact $ unlines . filter ((<10) . length) . lines

-- main = do
--     handle <- openFile "lyrics.txt" ReadMode
--     contents <- hGetContents handle
--     putStrLn contents
--     hClose handle

-- main = do
--     withFile "lyrics.txt" ReadMode (\handle -> do
--        contents <- hGetContents handle
--        putStrLn contents)

-- main = do
--     writeFile "new.txt" contents
--         where contents = "SSSS"

-- main = do
--     handle <- openFile "todo.txt" ReadMode
--     (tempName, tempHandle) <- openTempFile "." "temp"

-- addXY x y = x + y
-- main = print $ addXY 20 $ addXY 10 10

-- getNameTag :: IO String
-- ret10 :: Int
-- ret10 = 10
--
-- getNameTag :: IO Int
-- getNameTag = do
--     test <- return ret10
--     return test
--
-- main = putStrLn $ show getNameTag

-- addXY :: Int -> Int -> Int
-- addXY x y = x + y

-- pairXY = (10, 40)
-- (x, y) = pairXY
-- main = print x
-- main = print $ addXY (fst pairXY) (snd pairXY)

-- vals = (10, 20, 30, 40)
-- main = print $ vals!!0

-- main = do
--     putStr "Add something:\n> "
--     hFlush stdout
--     todoItem <- getLine
--     appendFile "todo.txt" (todoItem ++ "\n")

todoFilename = "todo.txt"

updateTodo = do
    handle <- openFile todoFilename ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp.tmp"
    contents <- hGetContents handle

    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks

    putStrLn "These are them"
    putStr $ unlines numberedTasks

    putStrLn "Which do you want to delete?"

    numberString <- getLine
    let number = read numberString
        -- look up the line for idx, then delete the first line that matches that line (might have duplicates though)
        newTodoItems = delete (todoTasks !! number) todoTasks

    -- print out the deleted lines
    putStrLn $ "Deleted " ++ show (todoTasks !! number)

    hPutStr tempHandle $ unlines newTodoItems
    hClose handle
    hClose tempHandle
    removeFile todoFilename
    renameFile tempName todoFilename

-- main = updateTodo

-- main = do
--     progName <- getProgName
--     args <- getArgs
--     print progName
--     print args



dispatch :: [(String, [String] -> IO ())]
dispatch = [("add", add),
            ("view", view),
            ("remove", remove)]

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let numberedContents = zipWith (\ n line -> show n ++ ") " ++ line) [0..]  (lines contents)
    putStr $ unlines numberedContents

remove :: [String] -> IO ()
remove [fileName, idx] = do
    -- get file handle
    handle <- openFile fileName ReadMode
    -- read file contents
    raw_contents <- hGetContents handle
    -- process file contents
    let contents = lines raw_contents
        newContents = delete (contents !! read idx) contents

    -- close handle
    -- hClose handle

    putStrLn "ASDSA"
    --open a new handle in Write this time
    handle2 <- openFile fileName WriteMode
    putStrLn "BBB"
    hPutStr handle2 $ unlines newContents
    putStrLn "Done"


-- main = do
--     (command:args) <- getArgs
--     let (Just action) = lookup command dispatch
--     action args


comma_join :: String -> String
comma_join str = str ++ ","

print_args :: [String] -> IO()
print_args [arg1] = print $ arg1 ++ " just by itself"
print_args [arg1, arg2] = print $ arg1 ++ " added to " ++ arg2
print_args [] = print "No args"
print_args args = print $ unwords $ (map comma_join $ init args) ++ [(last args)]
-- print_args args = print $ (intercalate ", ") args

dispatch2 :: [(String, [String]-> IO())]
dispatch2 = [("pp", print_args)]

main = do
    (command : args) <- getArgs
    -- let qwe = lookup command dispatch2
    case lookup command dispatch2 of
      Nothing -> print ("no match")
      Just qwe -> qwe args
