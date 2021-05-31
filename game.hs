import System.Environment


print_name :: [String] -> String
print_name (name:_) = "Your name is: " ++ name

goodbye :: String -> String
goodbye _ = "Good bye!"

single_responses :: [(String, String-> String)]
single_responses = [
    ("hello", (\_ -> "goodbye!"))
    ]


handle_single_responses :: String -> String
handle_single_responses command =
    case lookup command single_responses of
        Just response -> response "asds"
        Nothing -> (\_ -> "no matching response") ""


arg_responses :: [(String, [String] -> String)]
arg_responses = [
    ("name", print_name)
    ]

dump_args :: [String] -> String
dump_args (command: args) = "Unknown command was: "++command++" and the args were: "++unwords args

handle_arg_responses :: [String] -> String
handle_arg_responses (command: args) =
    case lookup command arg_responses of
      Just response -> response (command:args)
      Nothing -> dump_args (command:args)


main = do
    all_args <- getArgs
    case all_args of
      [command] -> print $ handle_single_responses command
      (command:args) -> print $ handle_arg_responses (command:args)
      [] -> print "no args"


