module Theme.HeaderTemplate exposing (..)

import Html exposing (Html, h1, header, text)
import Shared exposing (Model)


view : String -> Html msg
view title =
    header []
        [ h1
            []
            [ text title
            ]
        ]
