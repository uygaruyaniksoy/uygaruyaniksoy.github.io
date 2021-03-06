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
    , experienceItems : List ExperienceItem
    , selectedExperienceItem : Maybe ExperienceItem
    , projects : List Project
    , selectedProject : Maybe Project
    , bioText : List StyledString
    }


type Style
    = Bold
    | Normal
    | Paragraph


type alias StyledString =
    { style : Style
    , string : String
    }


type Msg
    = SelectedEducationItem EducationItem
    | SelectedExperienceItem ExperienceItem
    | Noop


type alias Time =
    { from : String, to : String }


type alias EducationItem =
    { school : String
    , degree : String
    , time : Time
    , place : String
    , achievements : List String
    , img : String
    }


type alias ExperienceItem =
    { company : String
    , role : String
    , time : Time
    , place : String
    , achievements : List String
    , technologies : List String
    , img : String
    }


type alias Project =
    { name : String
    , what : String
    , description : String
    , img : String
    , technologies : List String
    , features : List String
    }



-- MODEL


initialState : Model
initialState =
    { selectedEducationItem = Nothing
    , educationItems =
        [ EducationItem
            "Middle East Technical University"
            "Computer Engineering"
            (Time
                "2013"
                "2019"
            )
            "Ankara, Turkey"
            [ "CENG213 - Data Structures"
            , "CENG242 - Programming Language Concepts"
            , "CENG315 - Algorithms"
            , "CENG334 - Operating Systems"
            , "CENG435 - Data Communications and Networking"
            , "CENG451 - Information Systems Development"
            , "CENG453 - Software Construction"
            , "CENG466 - Fundamentals of Image Processing"
            , "CENG477 - Computer Graphics"
            , "CENG495 - Cloud Computing"
            ]
            "https://seeklogo.net/wp-content/uploads/2013/04/odtu-vector-logo.png"
        , EducationItem "Regensburg University of Applied Science"
            "Computer Science"
            (Time
                "2017"
                "2017"
            )
            "Regensburg, Germany"
            [ "Advanced Java Programming"
            , "App Development for Andriod Smartphones"
            , "Service Innovation and Modelling"
            , "Introduction to Web Security"
            ]
            "https://www.sensorik-bayern.de/fileadmin/_processed_/8/6/csm_OTH-Regensburg_logo_74970bf8eb.jpg"
        ]
    , selectedExperienceItem = Nothing
    , experienceItems =
        [ ExperienceItem "Siemens"
            "Software Developer"
            (Time "Nov 2018" "Present")
            "Ankara, Turkey"
            [ "Implemented a hierarchical diagram for displaying various types of components using GoJS and Angular"
            ]
            [ "Angular", "GoJS", "Webpack", "TypeScript" ]
            "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/032011/siemens.png?itok=rdKsgifk"
        , ExperienceItem "University College Dublin"
            "R&D Intern"
            (Time "Jul 2018" "Sep 2018")
            "Dublin, Ireland"
            [ "Worked for a EU funded software project which aims to help children with ADHD to enhance\ntheir reading skills."
            , "Implemented a hand gesture recognizing system that works with several marker layouts for AR.js."
            ]
            [ "A-Frame", "ARJS", "Unity", "Blender", "Vuforia" ]
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/UCD_Dublin.png/200px-UCD_Dublin.png"
        , ExperienceItem "Halici Software"
            "Software Developer"
            (Time "Oct 2017" "Jun 2018")
            "Ankara, Turkey"
            [ "Developed a web application for Brainquire users where they can see statistics on themselves or others."
            , "Implemented features like secure authentication, purchasing interface to buy premium membership."
            , "Created a library for mobile devices to visualise players performace with graphics and charts."
            ]
            [ "React", "React Native", "Redux", "Ruby on Rails", "ExpressJS", "D3JS", "PostgreSQL" ]
            "https://media.licdn.com/dms/image/C4E0BAQENcpJth4ed1A/company-logo_200_200/0?e=2159024400&v=beta&t=VGDF4ozO3KjgnSdTMI5T8PqfORiDXrnH0TS4ya1YYq0"
        , ExperienceItem "Kale Software"
            "Software Developer"
            (Time "Jun 2016" "Mar 2017")
            "Ankara, Turkey"
            [ "Implemented a multifunctional interface that will show the user data from a Neo4J database in a way that is easier to understand from a human’s perspective."
            , "Worked on an engine that will convert RDBMS data into a Graph DB."
            , "Developed a single page web application that uses react and local storage."
            , "Made front-end improvements and bugfixes in the Graph project."
            ]
            [ "React", "Redux", "ExpressJS", "Neo4J", "D3JS" ]
            "https://pbs.twimg.com/profile_images/1082916350639722498/_YHKu7st_400x400.jpg"
        ]
    , bioText =
        [ { style = Paragraph, string = "" }
        , { style = Normal, string = "Hey! My name is Uygar and I am currently a " }
        , { style = Bold, string = "senior year Computer Engineering" }
        , { style = Normal, string = " student at Middle East Technical University. I have " }
        , { style = Bold, string = "over 3 years" }
        , { style = Normal, string = " of experience as a working student Software Developer for various companies. I am a " }
        , { style = Bold, string = "proficient Full Stack Developer" }
        , { style = Normal, string = " and I have been a part of development teams facing difficult engineering problems. I love challanges, building things and learning." }
        , { style = Paragraph, string = "" }
        , { style = Normal, string = "Over this 3 years I developed various web applications using " }
        , { style = Bold, string = "React, Angular, Redux, Express, D3 and GoJS." }
        , { style = Normal, string = " Also, I am an " }
        , { style = Bold, string = "indie game developer" }
        , { style = Normal, string = " and I have published " }
        , { style = Bold, string = "3 Android games" }
        , { style = Normal, string = " on Google Play with over " }
        , { style = Bold, string = " 5000 downloads in total over the years." }
        , { style = Paragraph, string = "" }
        , { style = Normal, string = "Currently I am working for Siemens as a Frontend Developer in Ankara since November 2018 but I always have side projects going on and more planned in mind for the future. " }
        ]
    , projects =
        [ Project "Eu4 Quiz"
            "Android Game"
            "some desc"
            "https://lh3.googleusercontent.com/dp3IQptNaPV8G4KQE0vYX3vH1mKvbONysFCKd2AyZYu7rMDNrIwd6229XQTXXyrhdvW1=s180-rw"
            [ "android", "java" ]
            [ "some cool feature", "other good feature" ]
        ]
    , selectedProject = Nothing
    }



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        SelectedEducationItem item ->
            ( { model
                | selectedEducationItem =
                    if model.selectedEducationItem == Just item then
                        Nothing

                    else
                        Just item
                , selectedExperienceItem = Nothing
              }
            , Cmd.none
            )

        SelectedExperienceItem item ->
            ( { model
                | selectedExperienceItem =
                    if model.selectedExperienceItem == Just item then
                        Nothing

                    else
                        Just item
                , selectedEducationItem = Nothing
              }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    Html.div
        [ class "col-lg-8"
        , class "col-lg-offset-2"
        ]
        [ siteHeader
        , bio model
        , div [ class "row", class "col-lg-12" ]
            [ education model
            , experience model
            ]

        --        , projects model
        --        , skills
        --        , siteFooter
        ]


siteHeader =
    header
        [ class "header"
        , class "col-lg-6"
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


bio model =
    div
        [ class "bio"
        , class "section-header"
        , class "col-lg-6"
        , class "col-md-7"
        , class "col-sm-12"
        ]
        [ h1 [] [ text "bio" ]
        , div [] (List.map bioItem model.bioText)
        ]


bioItem bioText =
    if bioText.style == Bold then
        strong [] [ text bioText.string ]

    else if bioText.style == Normal then
        span [] [ text bioText.string ]

    else
        p [] []


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
                    [ style "max-height" "1000px", style "opacity" "1" ]

                False ->
                    [ style "max-height" "0px", style "opacity" "0" ]
    in
    div
        [ class "notice"
        , if item.school == "Middle East Technical University" then
            class "wiggle"

          else
            class ""
        , class "col-sm-12"
        , onClick (SelectedEducationItem item)
        ]
        [ div []
            [ div [ class "notice notice-float" ]
                [ p [ style "border-bottom" "#ccc solid 1px" ] [ text item.time.to ]
                , p [] [ text item.time.from ]
                ]
            , img [ src item.img ] []
            , h4 [] [ text item.school ]
            , h5 [] [ text item.degree ]
            , h5 [] [ text item.place ]
            , h5 [ style "padding" "7.5px" ] []
            ]
        , div visibility [ hr [] [] ]
        , div visibility (List.map (\a -> li [ style "color" "#666" ] [ text a ]) item.achievements)
        ]


experience model =
    div
        [ class "section-header"
        , class "col-md-6"
        , class "col-sm-12"
        ]
        [ h1 [] [ text "experience" ]
        , div [] (List.map (experienceItem model.selectedExperienceItem) model.experienceItems)
        ]


experienceItem selectedItem item =
    let
        visibility =
            case selectedItem == Just item of
                True ->
                    [ style "max-height" "1000px", style "opacity" "1" ]

                False ->
                    [ style "max-height" "0px", style "opacity" "0" ]
    in
    div
        [ class "notice", class "col-sm-12", onClick (SelectedExperienceItem item) ]
        [ div []
            [ div [ class "notice notice-float" ]
                [ p [ style "border-bottom" "#ccc solid 1px" ] [ text item.time.to ]
                , p [] [ text item.time.from ]
                ]
            , img [ src item.img ] []
            , h4 [] [ text item.company ]
            , h5 [] [ text item.role ]
            , h5 [] [ text item.place ]
            , h5 [] [ span [ style "font-weight" "bold" ] [ text "Technologies: " ], span [] [ text (String.join ", " item.technologies) ] ]
            ]
        , div visibility [ hr [] [] ]
        , div visibility (List.map (\a -> li [ style "color" "#666" ] [ text a ]) item.achievements)
        ]


projects model =
    div
        [ class "section-header"
        , class "col-md-6"
        , class "col-sm-12"
        ]
        [ h1 [] [ text "projects" ]
        , div [] (List.map (projectItem model.selectedProject) model.projects)
        ]


projectItem selectedItem item =
    let
        visibility =
            []
    in
    div
        [ class "notice", class "col-sm-12" ]
        [ img [ src item.img ] []
        , h4 [] [ text item.name ]
        , h5 [] [ text item.what ]
        , h5 [] [ text item.description ]
        , h5 [] [ span [ style "font-weight" "bold" ] [ text "Technologies: " ], span [] [ text (String.join ", " item.technologies) ] ]
        , div visibility [ hr [] [] ]
        , div visibility (List.map (\a -> li [ style "color" "#666" ] [ text a ]) item.features)
        ]


skills =
    div
        [ class "col-md-12" ]
        [ h1 [] [ text "skills" ]
        , br [] []
        ]


siteFooter =
    footer
        [ class "col-md-12" ]
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
