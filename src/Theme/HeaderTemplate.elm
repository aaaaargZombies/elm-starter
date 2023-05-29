module Theme.HeaderTemplate exposing (..)

import Html exposing (Html, h1, header, text)


type alias HeaderInfo =
    { content : String }


view : HeaderInfo -> Html msg
view headerInfo =
    header []
        [ h1
            []
            [ text headerInfo.content
            ]
        ]
