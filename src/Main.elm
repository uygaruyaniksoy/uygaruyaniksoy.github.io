module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    Html.div
        []
        [ siteHeader
        , siteContent
        , siteFooter
        ]


siteHeader =
    header
        []
        [ div [] [ h1 [] [ text "uygar uyaniksoy" ] ]
        , div []
            [ h2 [] [ text "education" ]
            , h2 [] [ text "experience" ]
            , h2 [] [ text "projects" ]
            , h2 [] [ text "skills" ]
            ]
        ]


siteContent =
    div
        []
        [ Html.p [] [ Html.text "content" ]
        ]


siteFooter =
    footer
        []
        [ Html.p [] [ Html.text "footer" ]
        ]
