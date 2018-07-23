module View.Thread exposing (Thread, view)

import Element exposing (..)


type alias Thread =
    { title : String
    }


view : Thread -> Element msg
view t =
    el
        []
        (text "Boogie")
