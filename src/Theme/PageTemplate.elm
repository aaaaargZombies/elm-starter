module Theme.PageTemplate exposing (..)

import Html exposing (Html, a, div, img, li, main_, p, text, ul)
import Html.Attributes exposing (alt, attribute, href, src)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..))
import Theme.FooterTemplate as FooterTemplate
import Theme.HeaderTemplate as HeaderTemplate


type alias PageInfo =
    { title : String, mainContent : String }


view :
    Html Msg
    -> Html Msg
view child =
    div []
        [ HeaderTemplate.view "[cCc] Header"
        , main_ []
            [ child
            ]
        , FooterTemplate.view
        ]
