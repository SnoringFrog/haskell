import System.IO

not_wv :: [Char] -> Bool
not_wv x
   | x == "West Virginia" || x == "WV" = False 
   | otherwise = True

main = do
   print "From whence do you hail?"
   hFlush stdout
   place <- getLine
   if (not_wv place) then
      print ("Greetings, denizen of " ++ place ++ ".")
   else print ("You are not welcome here.")
