module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "blue" ]
        [ div [ class "header" ]
            [ h1 [] [ text "MemorTree" ]
            ]
        , img [ src "/logo.svg" ] []
        , div [] [ text "Your Elm App is working!" ]
        -- , makeGrid 4

        ]


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }

-- makeGridUnit : List ()
-- makeGridUnit num = 
--     [num]


makeGridUnitList : Int -> a -> List a
makeGridUnitList num x =
    if num <= 0 then
        []
    else 
        x :: makeGridUnitList (num-1) x

renderGrid : List (String) -> Html Msg
renderGrid list =
    div [ class "grid" ] 
        (List.map (\l -> div [] [ text l ]) list)
    
makeGrid : Int -> Html Msg
makeGrid num =
    num 
    |> makeGridUnitList
    |> renderGrid
