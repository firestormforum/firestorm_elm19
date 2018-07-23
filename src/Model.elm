module Model exposing (Model)

import Browser.Navigation exposing (Key)
import Route exposing (Route(..))


type alias Model =
    { key : Key
    , currentRoute : Route
    }
