module Page.UhOh exposing (..)

import Html exposing (Html, a, div, img, p, text)
import Html.Attributes exposing (alt, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..))


view : Html msg
view =
    div []
        [ p [] [ text "UhOh nothing here!" ]
        ]
