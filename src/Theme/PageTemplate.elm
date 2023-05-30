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


view : Model -> Html Msg
view model =
    div []
        [ HeaderTemplate.view { content = "[cCc] Header" }
        , main_ []
            [ languageSelector model
            , img [ alt "glaciers and mountains", src "/simon-fitall-tvleqH3p1os-unsplash.jpg" ] []
            , p []
                [ text "Photo by "
                , a [ href "https://unsplash.com/@simonfitall?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText" ] [ text "Simon Fitall" ]
                , text " on "
                , a [ href "https://unsplash.com/photos/tvleqH3p1os?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText" ] [ text "Unsplash" ]
                ]
            ]
        , FooterTemplate.view
        ]


languageSelector : Model -> Html Msg
languageSelector model =
    let
        t =
            translate model.language
    in
    case model.page of
        Index ->
            div []
                [ p [] [ text (t PageTitle) ]
                ]
