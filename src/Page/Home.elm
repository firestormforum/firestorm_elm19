module Page.Home exposing (view)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input
import Model exposing (Model)
import Msg exposing (Msg)
import View.Thread exposing (Thread)


view : Model -> Browser.Document Msg
view model =
    { title = "Admin"
    , body =
        [ Element.layout
            [ Background.color (rgba 1 1 1 1)
            , Font.color (rgba 0 0 0 1)
            ]
          <|
            column []
                [ header
                , content
                ]
        ]
    }


header : Element Msg
header =
    row
        [ width fill
        , Border.shadow
            { offset = ( 0, 0 )
            , blur = 5
            , size = 1
            , color = rgba 0 0 0 0.2
            }
        , alignTop
        , alignLeft
        , padding 20
        , height (fill |> maximum 86)
        ]
        [ logo
        , menu
        ]


logo : Element Msg
logo =
    el
        []
        (image [ height (fill |> maximum 40) ]
            { src = "https://forum.firestormforum.org/images/firestorm-logo.png"
            , description = "Firestorm Forum"
            }
        )


menu : Element Msg
menu =
    el
        [ alignRight ]
        (text "...")


threads : List Thread
threads =
    [ thread
    , thread
    ]


content : Element Msg
content =
    column
        [ width fill
        , padding 20
        , spacing 20
        ]
    <|
        List.map View.Thread.view threads


thread : Thread
thread =
    { title = "Some thread" }
