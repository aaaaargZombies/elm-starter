module Theme.FooterTemplate exposing (..)

import Html exposing (Html, footer, h2, text)


view : Html msg
view =
    footer []
        [ h2
            []
            [ text "[cCc] Footer"
            ]
        ]
