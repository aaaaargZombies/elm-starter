module Shared exposing (Model, Msg(..), Pattern, Phase(..), encodedPattern, patterDecoder)

import Browser
import Browser.Navigation
import I18n.Translate exposing (Language(..))
import Json.Decode
import Json.Encode
import Route exposing (Route(..))
import Time
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , page : Route
    , language : Language
    , pattern : Pattern
    , phase : Phase
    , paused : Bool

    -- add a exercise routine in here probably it's own type as well
    }


type alias Pattern =
    { inhale : Int
    , exhale : Int
    }


type Phase
    = Inhale Int
    | Exhale Int


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest
    | Tick Time.Posix
    | PauseUnpause


patterDecoder : Json.Decode.Decoder Pattern
patterDecoder =
    Json.Decode.map2 Pattern
        (Json.Decode.field "exhale" Json.Decode.int)
        (Json.Decode.field "inhale" Json.Decode.int)


encodedPattern : Pattern -> Json.Encode.Value
encodedPattern pattern =
    Json.Encode.object
        [ ( "exhale", Json.Encode.int pattern.exhale )
        , ( "inhale", Json.Encode.int pattern.inhale )
        ]
