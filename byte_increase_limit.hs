import System.Environment

{- For "Add a language to a polyglot" code golf challenge (http://codegolf.stackexchange.com/questions/102370/add-a-language-to-a-polyglot)
 - Calculates the score from Versatile Integer Printer (http://codegolf.stackexchange.com/questions/65641/the-versatile-integer-printer) and then determines how many bytes can be added to the next answer without the VIP score getting worse
 -
 - Usage: ./byte_increase_limits languages bytes
 -}

--VIP Score (versatile integer printer)
score :: (RealFloat a) => a -> a -> a 
score l b = b/(l**3)

--max byte increase
mbi :: (RealFloat a) => a -> a -> a -> a
mbi old_score langs bytes
    | old_score < score langs bytes = bytes-1
    | otherwise = mbi old_score langs (bytes+1)

main = do
    args <- getArgs
    let langs = read $ head args :: Double
        bytes = read $ args!!1 :: Double
        old_score = score langs bytes
    print (mbi old_score (langs+1) bytes)
