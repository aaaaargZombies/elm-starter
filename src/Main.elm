module Main exposing (main)

import Browser
import Browser.Navigation
import I18n.Keys exposing (Key(..))
import I18n.Translate exposing (Language(..), translate)
import Page.Index
import Page.UhOh
import Route exposing (Route(..))
import Shared exposing (Model, Msg(..))
import Theme.PageTemplate as PageTemplate
import Url


type alias Flags =
    ()


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = viewDocument
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        maybeRoute =
            Route.fromUrl url
    in
    ( { key = key
      , page = Maybe.withDefault UhOh maybeRoute
      , language = English
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            let
                newRoute =
                    -- If not a valid route, go to index
                    -- could 404 instead depends on desired behaviour
                    Maybe.withDefault UhOh (Route.fromUrl url)
            in
            ( { model | page = newRoute }, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Browser.Navigation.pushUrl model.key (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Browser.Navigation.load href
                    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


viewDocument : Model -> Browser.Document Msg
viewDocument model =
    case model.page of
        Index ->
            { title = translate model.language SiteTitle, body = [ PageTemplate.view (Page.Index.view model) ] }

        UhOh ->
            { title = translate model.language SiteTitle, body = [ PageTemplate.view Page.UhOh.view ] }
