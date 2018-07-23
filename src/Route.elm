module Route exposing (Route(..), fromUrl)

import Url exposing (Url)
import Url.Parser


type Route
    = Home
    | Articles


fromUrl : Url -> Route
fromUrl url =
    case url.fragment of
        Nothing ->
            Home

        Just a ->
            Home
