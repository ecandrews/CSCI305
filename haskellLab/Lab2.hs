--Elizabeth Andrews
--CSCI305, Lab2, Spring 2017
--collaboration with Brock Ellefson

module Lab2
--how to export functions, this was covered in class
(f 
, fForIntegral
, setMem
, validSet
, setEQ
, unionEQ
, intersection
) where 
--imported the Data.List library in order to use basic list operations
import Data.List

-------------------------------------------------------------------------------
    -- Warmup
f list k =
    -- a
    if null list
    -- b
    then []
    -- c
    else head list + k : f (tail list) k

-------------------------------------------------------------------------------
    -- Pattern Matching

--similar to the warmup function
--only accepts Int types, and outputs a list of Ints
fForIntegral :: [Int] -> Int -> [Int]
--adds the value k to every value a in the list
fForIntegral list k = [k + a | a <- list]

-------------------------------------------------------------------------------
    -- Set membership

--determines whether an element is a member of a set
--takes in an element and a list, outputs a boolean
setMem :: (Eq a) => a -> [a] -> Bool
--if the set is empty, return false
setMem a [] = False
--compare a to the head of the list, b, which is popped from the top of the list
setMem a (b:list)
    --if a is the same as b, return True
    | a == b = True
    --if a is not the same as b, recursively call setMem on the new list
    | otherwise = setMem a list

-------------------------------------------------------------------------------
    -- Valid set

--determines whether the input list is valid, that is, there are no duplicates
--takes in a list and outputs a boolean
validSet :: (Eq a) => [a] -> Bool
--if the list is empty, return true
validSet [] = True
--pop the top element of the list off
validSet (a:as)
    --if a is a member of as, return False, because it is a duplicate
    | setMem a as == True = False
    --if it is not a member, call validSet recursively on the new list
    | otherwise = validSet as

-------------------------------------------------------------------------------
    -- Set eq

--determines whether two lists are equal, that is, they have the same elements, although not necessarily in the same order
--takes in two lists and outputs a boolean if they are equal
setEQ :: (Eq a) => [a] -> [a] -> Bool
--if the list is empty return True
setEQ [] bs = True
--pop the top element off list as
setEQ (a:as) bs
    --if element a is not in the set bs, return False
    | setMem a bs == False = False
    --if the element is in the set call setEQ recursively on the new list as
    | otherwise = setEQ as bs 

-------------------------------------------------------------------------------
    -- Union

--takes the union of the two lists and returns a list containing all elements of the union
--takes in two lists and outputs a new list
unionEQ :: (Eq a) => [a] -> [a] -> [a]
--returns all duplicates from combining list a and b
unionEQ a b = nub(a ++ b)

-------------------------------------------------------------------------------
    -- Intersecton

--takes the intersection of two lists and returns a list containing all elements of the intersection
intersection :: (Eq a) => [a] -> [a] -> [a]
--creates a list of elements a such that a is in listA and a is a member of listB
intersection listA listB = [a | a <- listA, setMem a listB]


