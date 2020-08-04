module Main where

import Prelude
import Data.Maybe
import Partial.Unsafe (unsafePartial)
import Effect (Effect)
import Effect.Console (log, logShow)
import Graphics.Canvas(rect, Rectangle, Context2D, getContext2D, getCanvasElementById, setFillStyle, fillPath, setCanvasWidth, setCanvasHeight)

type CanvasSettings = {width:: Number, height:: Number, color:: String}
canvasSettings :: CanvasSettings
canvasSettings = {width: 600.0, height: 600.0, color: "black"}

fillRectangle ::Context2D -> String -> Rectangle -> Effect Unit
fillRectangle ctx color r = do 
    setFillStyle ctx color
    fillPath ctx $ rect ctx r

clearCanvas :: Context2D -> CanvasSettings -> Effect Unit
clearCanvas ctx settings = let 
    r = { x: 0.0
        , y: 0.0
        , width: canvasSettings.width
        , height: canvasSettings.height
        }
    in do 
    fillRectangle ctx canvasSettings.color r


main :: Effect Unit
main = void $ unsafePartial do
    log "Game started!"
    Just canvas <- getCanvasElementById "myCanvas"
    -- Set canvas dimensions
    setCanvasWidth canvas canvasSettings.width 
    setCanvasHeight canvas canvasSettings.height
    ctx <- getContext2D canvas
    clearCanvas ctx canvasSettings
