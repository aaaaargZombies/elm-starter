module Shared exposing (Model, Msg(..), Pattern, Phase(..))

import Browser
import Browser.Navigation
import I18n.Translate exposing (Language(..))
import Route exposing (Route(..))
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
