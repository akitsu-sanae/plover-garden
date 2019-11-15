module Util exposing (jsonOfMaybeInt, nth, toString, undefined, unwrap)

import Http
import Json.Decode as Json
import Json.Encode


undefined : () -> a
undefined _ =
    Debug.todo "<undefined>"


toString : Http.Error -> String
toString err =
    case err of
        Http.Timeout ->
            "Timeout"

        Http.NetworkError ->
            "Network error"

        Http.BadStatus resp ->
            "BadStatus " ++ String.fromInt resp

        Http.BadUrl url ->
            "BadUrl: " ++ url

        Http.BadBody body ->
            "BadBody: " ++ body


jsonOfMaybeInt : String -> Maybe Int -> List ( String, Json.Encode.Value )
jsonOfMaybeInt str x =
    case x of
        Nothing ->
            []

        Just n ->
            [ ( str, Json.Encode.int n ) ]


unwrap : Maybe a -> a
unwrap x =
    case x of
        Nothing ->
            undefined ()

        Just y ->
            y


nth : List a -> Int -> Maybe a
nth l n =
    case ( l, n ) of
        ( [], _ ) ->
            Nothing

        ( head :: _, 0 ) ->
            Just head

        ( _ :: tail, _ ) ->
            nth tail (n - 1)
