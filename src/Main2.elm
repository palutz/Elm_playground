module Main2 exposing (..)
-- A text input for reversing text. Very useful!
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/text_fields.html
--
-- Modified version: added a field for the list of events in the Model and showing as a unordered list
import Browser
import Html exposing (Html, Attribute, div, input, text, ul, li)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model =
  { message : String, events: List String }

init : Model
init =
  { message = "", events = [] }

-- UPDATE
type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | message = newContent, events = newContent::model.events }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", value model.message, onInput Change ] []
    , div [] [ text (String.reverse model.message) ]
    , div [] [ text ("Message length = " ++ String.fromInt(String.length model.message)) ]
    -- write the sequence of all events one by row
    , div [] [ ul [] (List.map (\x -> li [] [text (x ++ "\n")]) model.events) ]
    ]