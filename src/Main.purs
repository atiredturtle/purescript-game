module Main where

import Prelude
import Effect (Effect)
import Control.Monad.Eff.Random (random)
import Effect.Console (log, logShow)


mySum :: Int -> Int -> Int
mySum x y = x + y

main :: Effect Unit
main = do
    r <- randomInt
    log "Random Int" ++ r
    logShow (mySum 3 2)
    log "Hello sailor!"
