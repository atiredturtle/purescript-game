module Main where

import Prelude
import Effect (Effect)
import Effect.Random (random)
import Effect.Console (log, logShow)


mySum :: Int -> Int -> Int
mySum x y = x + y

getRandomNum :: Effect String
getRandomNum = do
    r <- random
    pure (show r)

main :: Effect Unit
main = do
    r <- getRandomNum
    log ("Random Int: " <> show r)
    logShow (mySum 3 2)
    log "Hello sailor!"
