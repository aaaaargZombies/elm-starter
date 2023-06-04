module Theme.PageTemplate exposing (..)

import Html exposing (Html, a, button, div, img, li, main_, p, text, ul)
import Html.Attributes exposing (alt, attribute, href, src)
import Html.Events exposing (onClick)
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..), Phase(..))
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
            let
                n =
                    case model.phase of
                        Inhale i ->
                            String.fromInt i

                        Top i ->
                            String.fromInt i

                        Exhale i ->
                            String.fromInt i

                        Bottom i ->
                            String.fromInt i

                btnTxt =
                    if model.paused then
                        UnpauseBtn

                    else
                        PauseBtn

                phaseTxt =
                    case model.phase of
                        Inhale _ ->
                            InhaleText

                        Exhale _ ->
                            ExhaleText

                        Top _ ->
                            TopText

                        Bottom _ ->
                            BottomText
            in
            div []
                [ p [] [ text (t phaseTxt) ]
                , p []
                    [ text n ]
                , button
                    [ onClick PauseUnpause ]
                    [ text (t btnTxt) ]
                ]
