module Page.Articles exposing (view)

import Browser
import Html exposing (..)
import Model exposing (Model)
import Msg exposing (Msg)


view : Model -> Browser.Document Msg
view model =
    { title = "Articles"
    , body =
        [ text "zomg a list of articles" ]
    }
