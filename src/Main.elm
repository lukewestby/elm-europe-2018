module Main exposing (main)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Json.Decode
import Json.Encode


type alias Model =
    { code : String }


initialModel : Model
initialModel =
    { code = "Hello world" }


type Msg
    = CodeChanged String


update : Msg -> Model -> Model
update msg model =
    case msg of
        CodeChanged value ->
            { model | code = value }


view : Model -> Html Msg
view model =
    Html.node "code-editor"
        [ Html.Attributes.property "editorValue" <|
            Json.Encode.string model.code
        , Html.Events.on "editorChanged" <|
            Json.Decode.map CodeChanged <|
                Json.Decode.at [ "target", "editorValue" ] <|
                    Json.Decode.string
        ]
        []


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
