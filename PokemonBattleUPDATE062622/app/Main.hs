
module Main where

import System.Random
import Control.Monad(when)


--Need to incorporate attacks and classtypes in the main io log
pikachu :: Pokemon
pikachu    = Pokemon {name = "Pikachu", attack1 = "Thunder Bolt", attack2 = "Quick Attack", classType = "Electric" } 
charmander :: Pokemon
charmander = Pokemon {name = "Charmander", attack1 = "Tail Whip", attack2 = "Scratch", classType = "Fire" }
bulbasaur :: Pokemon
bulbasaur  = Pokemon {name = "Bulbasaur", attack1 = "Vine Whip", attack2 = "Stun Spore", classType = "Grass"}
squirtle :: Pokemon
squirtle   = Pokemon {name = "Squirtle", attack1 = "Bubble", attack2 = "Tackle", classType = "Water"}
caterpie :: Pokemon
caterpie   = Pokemon {name = "Caterpie", attack1 = "Bug Bite", attack2 = "Tackle", classType = "Grass"}
magikarp :: Pokemon
magikarp   = Pokemon {name = "Magikarp", attack1 = "Splash", attack2 = "Struggle", classType = "Water"}
magnemite :: Pokemon
magnemite  = Pokemon {name = "Magnemite", attack1 = "Thunder Bolt", attack2 = "Magnet Bomb", classType = "Electric"}
growlithe :: Pokemon
growlithe  = Pokemon {name = "Growlithe", attack1 = "Ember", attack2 = "Flamethrower", classType = "Fire"}

pokeList :: [Pokemon]
pokeList = [pikachu, charmander, bulbasaur, squirtle, caterpie, magikarp, magnemite, growlithe]

-- main = do
--   g <- newStdGen
--   print . take 1 $ (randomRs (1, 10) g)

-- damage :: Int
--damage = <randomNumber> [10..40]
--figure out how to get a random number for dammage

damage :: IO Int
damage = randomRIO (35, 40)

-- damage :: Int
-- damage = 36 

-- damage2 :: Int
-- damage2 = 41

--need to figure out how to incorporate weaknesses to the types so players can deal maximum damage
-- classTypeWeakness :: String -> String -> Int
-- classTypeWeakness userClassType cpuClassType 
--  | userClassType == "Electric" && cpuClassType  == "Water"    = damage * 2
--  | userClassType == "Fire"     && cpuClassType  == "Grass"    = damage * 2
--  | userClassType == "Grass"    && cpuClassType  == "Electric" = damage * 2
--  | userClassType == "Water"    && cpuClassType  == "Fire"     = damage * 2
--  | cpuClassType  == "Electric" && userClassType == "Water"    = damage * 2
--  | cpuClassType  == "Fire"     && userClassType == "Grass"    = damage * 2
--  | cpuClassType  == "Grass"    && userClassType == "Electric" = damage * 2
--  | cpuClassType  == "Water"    && userClassType == "Fire"     = damage * 2
--  | otherwise                                                  = damage


data Pokemon = Pokemon { 
    name      :: String
  , attack1   :: String
  , attack2   :: String
  , classType :: String
} deriving Show


cpuHP :: Int
cpuHP = 100

userHP :: Int
userHP = 100


main :: IO ()
main = do
  putStrLn "Pick a number from 0 - 7: "
  oppon <- getLine
  let opponPokemon = read oppon :: Int
  if opponPokemon > 7 || opponPokemon < 0 then main else putStrLn "A Wild "
  print $ name $ pokeList !! opponPokemon
  putStrLn "appeared!"
  putStrLn "Would you like to FIGHT? Y / N"
  answer <- getLine
  if answer == "Y" || answer == "y"
    then do 
      putStrLn "Choose your Pokemon! Select 0 - 7"
      userPoke <- getLine
      let userP = read userPoke :: Int
      -- let userPoke  = name $ pokeList !! userP
      -- let userPokemon = read userPoke :: String
      -- putStrLn "I choose you " ++ userPokemon
      print $ name $ pokeList !! userP
      putStrLn "Would you like to ATTACK or RUN? Y / N"
      answer1 <- getLine
      if answer1 == "Y" || answer1 == "y"
        then do
          -- need to figure out how to deal damage randomly
          x <- damage
          putStrLn $ "You hit your opponent for: " ++ show x
          -- print damage
          let cpuTotalHP = cpuHP - x
          putStrLn $ "Your opponent now has " ++ show cpuTotalHP ++ " HP left."
          y <- damage
          putStrLn $ "Your opponent hits you for: " ++ show y ++ " HP"
          let userTotalHP = userHP - y
          putStrLn $ "You now have " ++ show userTotalHP ++ " HP left."
          putStrLn "Would you like to ATTACK or RUN? Y / N"
          answer2 <- getLine
          if answer2 == "Y" || answer2 == "y"
            then do
               -- need to figure out how to deal damage randomly
              x1 <- damage
              let cpuTotalHP2 = cpuTotalHP - x1
              putStrLn $ "You hit your opponent for:  " ++ show x1
              putStrLn $ "Your opponent now has " ++ show cpuTotalHP2 ++ " HP left"
              y1 <- damage 
              putStrLn $ "Your opponent hits you for " ++ show y1 ++ " HP"
              let userTotalHP2 = userTotalHP - y1
              putStrLn $ "You now have " ++ show userTotalHP2 ++ " HP left"
              putStrLn "Would you like to ATTACK or RUN? Y / N"
              answer3 <- getLine
              if answer3 == "y" || answer3 == "Y"
                then do
                   -- need to figure out how to deal damage randomly
                  x2 <- damage
                  putStrLn $ "You hit your opponent for: " ++ show x2
                  putStrLn "You beat that Pokemon!"
              else putStrLn "It's a good thing we ran away. That pokemon looked strong!"
          else putStrLn "It's a good thing we ran away. That pokemon looked strong!"
      else putStrLn "It's a good thing we ran away. That pokemon looked strong!"
    else putStrLn "We'll fight them next time!" 
  -- print $ name $ pokeList !! opponPokemon
  --choose to fight the <POkemon> or run away
  -- if fight 
    -- then putStrLn "I Choose you.. <Pokemon>"
    --else putStrLn "Got away safely"
