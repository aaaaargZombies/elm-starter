module I18n.En exposing (enStrings)

import I18n.Keys exposing (Key(..))


enStrings : Key -> String
enStrings key =
    case key of
        PageTitle ->
            "[cCc] Init template"

        SiteTitle ->
            "[cCc] site title"

        ChangeLanguage ->
            "[cCc] change lang"
