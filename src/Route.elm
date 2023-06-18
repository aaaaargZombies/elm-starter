module Route exposing (Route(..), fromUrl, toString)

import Url
import Url.Parser as Parser exposing (Parser, map, oneOf, top)


type Route
    = Index
    | UhOh


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    { url | path = url.path }
        |> Parser.parse routeParser


toString : Route -> String
toString route =
    case route of
        Index ->
            "/"

        UhOh ->
            "/404"


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Index top
        ]
