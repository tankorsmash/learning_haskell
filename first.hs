doubleMe x = x + x
my_int = doubleMe 2
doubleSmallNumber x = if x > 100 then x else x * 2
main = putStrLn $ show $ doubleSmallNumber 50
