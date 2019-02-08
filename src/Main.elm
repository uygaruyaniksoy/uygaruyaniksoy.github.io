port module Main exposing (main)

import Browser exposing (element)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onDoubleClick, onInput, onSubmit)


type alias Flags =
    {}


type alias Model =
    { educationItems : List EducationItem
    , selectedEducationItem : Maybe EducationItem
    }


type Msg
    = SelectedEducationItem EducationItem
    | Noop


type alias EducationItem =
    { school : String
    , degree : String
    , time : String
    , place : String
    , achievements : List String
    }



-- MODEL


initialState : Model
initialState =
    { selectedEducationItem = Nothing
    , educationItems =
        [ EducationItem "Middle East Technical University" "Computer Engineering" "2013-2019" "Turkey" [ "did sth" ]
        , EducationItem "Regensburg University of Applied Science" "Computer Science" "2017-2017" "Germany" [ "did sth" ]
        ]
    }



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        SelectedEducationItem item ->
            ( { model | selectedEducationItem = Just item }, Cmd.none )


view : Model -> Html Msg
view model =
    Html.div
        [ class "col-sm-8"
        , class "col-sm-offset-2"
        ]
        [ siteHeader
        , bio
        , education model
        , experience
        , projects
        , skills
        , siteFooter
        ]


siteHeader =
    header
        [ class "header"
        , class "col-md-5"
        , class "col-sm-12"
        ]
        [ div []
            [ div []
                [ img
                    [ src "uygar.jpg"
                    ]
                    []
                , div []
                    [ h2 [] [ text "uygar uyaniksoy" ]
                    , h4 [] [ text "middle east technical university" ]
                    , h5 [] [ text "computer engineering" ]
                    ]
                ]
            ]
        ]


bio =
    div
        [ class "bio"
        , class "section-header"
        , class "col-md-7"
        , class "col-sm-12"
        ]
        [ h1 [] [ text "bio" ]
        , p []
            [ text "llorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit" ]
        , p []
            [ text "amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor\n        sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet orem ipsum dolor sit amet "
            ]
        , p []
            [ text "amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor\n        sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet orem ipsum dolor sit amet "
            ]
        ]


education model =
    div
        [ class "section-header"
        , class "col-md-6"
        , class "col-sm-12"
        ]
        [ h1 [] [ text "education" ]
        , div [] (List.map (educationItem model.selectedEducationItem) model.educationItems)
        ]


educationItem selectedItem item =
    let
        visibility =
            case selectedItem == Just item of
                True ->
                    [ style "height" "auto", style "display" "inherit" ]

                False ->
                    [ style "height" "0px", style "display" "none" ]
    in
    div
        [ class "notice", class "col-sm-12", onClick (SelectedEducationItem item) ]
        [ div []
            [ h4 [ style "flex" "1", style "color" "#833" ] [ text item.time ]
            , h4 [ style "flex" "4", style "color" "#444" ] [ text item.school ]
            , h4 [ style "flex" "2", style "color" "#444" ] [ text item.degree ]
            , h4 [ style "flex" "1", style "color" "#833" ] [ text item.place ]
            ]
        , div visibility (List.map (\a -> p [] [ text a ]) item.achievements)
        ]


experience =
    div
        [ class "section-header"
        , class "col-md-6"
        , class "col-sm-12"
        ]
        [ h1 [] [ text "experience" ]
        , br [] []
        ]


projects =
    div
        [ class "col-md-12" ]
        [ h1 [] [ text "projects" ]
        , br [] []
        ]


skills =
    div
        [ class "col-md-12" ]
        [ h1 [] [ text "skills" ]
        , br [] []
        ]


siteFooter =
    footer
        []
        [ Html.p [] [ Html.text "footer" ]
        ]



-- SUBS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initialState
    , Cmd.none
    )



-- MAIN


main : Program Flags Model Msg
main =
    element
        { view = view
        , update = update
        , init = init
        , subscriptions = subscriptions
        }
