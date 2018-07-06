module CodeEditor exposing (..)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Json.Decode
import Json.Encode


codeEditor : List (Html.Attribute msg) -> Html msg
codeEditor attributes =
    Html.node "code-editor" attributes []


editorValue : String -> Html.Attribute msg
editorValue code =
    Html.Attributes.property "editorValue" <|
        Json.Encode.string code


onEditorChanged : (String -> msg) -> Html.Attribute msg
onEditorChanged toMsg =
    Html.Events.on "editorChanged" <|
        Json.Decode.map toMsg <|
            Json.Decode.at
                [ "target", "editorValue" ]
                Json.Decode.string
