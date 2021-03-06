module TresEnRaya exposing (..)

import Browser
import Array exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Tuple exposing (..)

main = Browser.sandbox { init = init, update = update, view = view }

-- Declaramos el usuario que jugara en cada ronda
type alias Usuario =
    { name : String }

-- Declaramos el record Turno que ira cambiando entre ambos usuarios
type alias Turno =
    { user : Usuario}

-- Definimos el turno inicial de la partida
init = (("Turno del usuario " ++ (Turno player1).user.name), (Turno player1, Array.fromList ["", "", "", "", "", "", "", "", ""]))

-- Funcion que compruebe el tablero para el jugador 1
tableroCheckerPlayer1 { tablero } =
    if ((Maybe.withDefault "" (Array.get 0 tablero)) == "X" &&
    (Maybe.withDefault "" (Array.get 1 tablero)) == "X" &&
    (Maybe.withDefault "" (Array.get 2 tablero)) == "X") then
        True
    else if ((Maybe.withDefault "" (Array.get 3 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 5 tablero)) == "X") then
        True
    else if ((Maybe.withDefault "" (Array.get 6 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 7 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 8 tablero)) == "X") then
        True
    else if ((Maybe.withDefault "" (Array.get 0 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 3 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 6 tablero)) == "X") then
        True
    else if ((Maybe.withDefault "" (Array.get 1 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 7 tablero)) == "X") then
        True
    else if ((Maybe.withDefault "" (Array.get 2 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 5 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 8 tablero)) == "X") then
        True
    else if ((Maybe.withDefault "" (Array.get 0 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 8 tablero)) == "X") then
        True
    else if ((Maybe.withDefault "" (Array.get 2 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "X" &&
            (Maybe.withDefault "" (Array.get 6 tablero)) == "X") then
        True
    else
        False

-- Funcion que compruebe el tablero para el jugador 2
tableroCheckerPlayer2 { tablero } =
    if ((Maybe.withDefault "" (Array.get 0 tablero)) == "O" &&
    (Maybe.withDefault "" (Array.get 1 tablero)) == "O" &&
    (Maybe.withDefault "" (Array.get 2 tablero)) == "O") then
        True
    else if ((Maybe.withDefault "" (Array.get 3 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 5 tablero)) == "O") then
        True
    else if ((Maybe.withDefault "" (Array.get 6 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 7 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 8 tablero)) == "O") then
        True
    else if ((Maybe.withDefault "" (Array.get 0 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 3 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 6 tablero)) == "O") then
        True
    else if ((Maybe.withDefault "" (Array.get 1 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 7 tablero)) == "O") then
        True
    else if ((Maybe.withDefault "" (Array.get 2 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 5 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 8 tablero)) == "O") then
        True
    else if ((Maybe.withDefault "" (Array.get 0 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 8 tablero)) == "O") then
        True
    else if ((Maybe.withDefault "" (Array.get 2 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 4 tablero)) == "O" &&
            (Maybe.withDefault "" (Array.get 6 tablero)) == "O") then
        True
    else
        False


type Msg
    = Change Int

update : Msg -> (String, (Turno, Array String)) -> (String, (Turno, Array String))
update msg model =
    case msg of
        Change divElement ->
            if (String.contains "Turno" (first(model))) && (first(second(model))).user == player1 && (Maybe.withDefault "" (Array.get divElement (second(second(model))))) == "" && tableroCheckerPlayer1 {tablero = (Array.set divElement "X" (second(second(model)))) } then
                (("" ++ ((first(second(model))).user.name) ++ " ha ganado la partida"), (first(second(model)), (Array.set divElement "X" (second(second(model))))))
            else if (String.contains "Turno" (first(model))) && (String.contains "Turno" (first(model))) && (first(second(model))).user == player2 && (Maybe.withDefault "" (Array.get divElement (second(second(model))))) == "" && tableroCheckerPlayer2 { tablero = (Array.set divElement "O" (second(second(model)))) } then
                (("" ++ ((first(second(model))).user.name) ++ " ha ganado la partida"), (first(second(model)), (Array.set divElement "O" (second(second(model))))))
            else if (String.contains "Turno" (first(model))) && (first(second(model))).user == player1 && (Maybe.withDefault "" (Array.get divElement (second(second(model))))) == "" then
                (("Turno del usuario " ++ (Turno player2).user.name),  (Turno player2, (Array.set divElement "X" (second(second(model))))))
            else if (String.contains "Turno" (first(model))) && (first(second(model))).user == player2 && (Maybe.withDefault "" (Array.get divElement (second(second(model))))) == "" then
                (("Turno del usuario " ++ (Turno player1).user.name),  (Turno player1, (Array.set divElement "O" (second(second(model))))))
            else
                (first(model), second(model))


-- Definimos los jugadores que habra durante la partida
player1 = Usuario "Jugador 1"
player2 = Usuario "Jugador 2"

view : (String, (Turno, Array String)) -> Html Msg
view model =
    -- Agrupamos todo en un div
    div [ class "PageContainer" ]
    [

    -- Parte del HTML donde se mostrara el usuario que juega
      div [ class "jumbotron text-center" ]
          [ h2 [ id "nombreUsuarios" ] [text (first(model))]
          ]
    ,

    -- Parte del HTML donde estara el tablero Tres en raya
      div [ class "container" ]
          [ div [ class "box", id "box11", onClick (Change 0)] [text ("" ++ (Maybe.withDefault "" (Array.get 0 (second((second(model)))))))]
          , div [ class "box", id "box12", onClick (Change 1)] [text ("" ++ (Maybe.withDefault "" (Array.get 1 (second((second(model)))))))]
          , div [ class "box", id "box13", onClick (Change 2)] [text ("" ++ (Maybe.withDefault "" (Array.get 2 (second((second(model)))))))]
          , div [ class "box", id "box21", onClick (Change 3)] [text ("" ++ (Maybe.withDefault "" (Array.get 3 (second((second(model)))))))]
          , div [ class "box", id "box22", onClick (Change 4)] [text ("" ++ (Maybe.withDefault "" (Array.get 4 (second((second(model)))))))]
          , div [ class "box", id "box23", onClick (Change 5)] [text ("" ++ (Maybe.withDefault "" (Array.get 5 (second((second(model)))))))]
          , div [ class "box", id "box31", onClick (Change 6)] [text ("" ++ (Maybe.withDefault "" (Array.get 6 (second((second(model)))))))]
          , div [ class "box", id "box32", onClick (Change 7)] [text ("" ++ (Maybe.withDefault "" (Array.get 7 (second((second(model)))))))]
          , div [ class "box", id "box33", onClick (Change 8)] [text ("" ++ (Maybe.withDefault "" (Array.get 8 (second((second(model)))))))]
          ]
    ]