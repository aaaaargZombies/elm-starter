module Page.Index exposing (..)

import Html exposing (Html, a, div, img, p, text)
import Html.Attributes exposing (alt, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..))


view : Model -> Html msg
view model =
    let
        t =
            translate model.language
    in
    div []
        [ p [] [ text (t PageTitle) ]
        , img [ alt "glaciers and mountains", src "/simon-fitall-tvleqH3p1os-unsplash.jpg" ] []
        , p []
            [ text "Photo by "
            , a [ href "https://unsplash.com/@simonfitall?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText" ] [ text "Simon Fitall" ]
            , text " on "
            , a [ href "https://unsplash.com/photos/tvleqH3p1os?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText" ] [ text "Unsplash" ]
            ]
        ]
