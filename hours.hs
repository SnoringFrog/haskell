{-
TODO:
  labeling projects
  automatic remaining time detection based on date/time
    flag for 'assume no hours yet today' vs 'partial day included'
  flag to assume all percentages equal
  assume basic cases?
    3 args = split last two evenly to reach first?
    2 args = split evenly to reach 40?
-}

-- ok function for balancing two weighted items with no known total
-- but it was overkill (and limited) for what I needed
{-
hours :: (RealFloat a) => [a] -> (a, a)  
hours [x, y, z] = hours [x, 0.5, y, 0.5, z]
hours [x, xp, y, yp, z] = (a, b)
    where p = yp/xp
          b = (x*p + z*p - y) / (p+1) 
          a = z - b
hours x = error "Must have 3 or 5 arguments!"
-}

import System.Environment 

-- odd elements of a list
o :: [a] -> [a]
o [] = []
o (x:y:xs) = x : o xs
o x = error "Wrong number of arguments!"

-- even elements of a list
e :: [e] -> [e]
e [] = []
e (x:y:xs) = y : e xs
e x = error "Wrong number of arguments!"

hours' :: (RealFloat a) => [a] -> [a]
hours' [] = []
hours' x = 
    let total_hours = head x
        pairs = tail x
        f = (\pair -> snd pair * 0.01 * total_hours - fst pair)
    in map (f) (zip (o pairs) (e pairs))

main = do
    args <- getArgs
    print (hours' (map rDouble args))

-- convert args to doubles
rDouble :: String -> Double
rDouble = read
