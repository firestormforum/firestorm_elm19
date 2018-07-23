module Main exposing (..)

import Browser
import Browser.Navigation exposing (Key)
import Html exposing (..)
import Json.Decode as Decode exposing (Value)
import Model exposing (Model)
import Msg exposing (Msg(..))
import Page.Articles
import Page.Home
import Route exposing (Route(..))
import Url exposing (Url)


init : Value -> Url -> Key -> ( Model, Cmd Msg )
init _ url key =
    let
        model =
            { key = key
            , currentRoute = Home
            }
    in
    ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetRoute route ->
            ( { model | currentRoute = route }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    case model.currentRoute of
        Home ->
            Page.Home.view model

        Articles ->
            Page.Articles.view model


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


onNavigation : Url -> Msg
onNavigation url =
    SetRoute (Route.fromUrl url)


main : Program Value Model Msg
main =
    Browser.application
        { init = init
        , onUrlChange = \_ -> NoOp
        , onUrlRequest = \_ -> NoOp
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
