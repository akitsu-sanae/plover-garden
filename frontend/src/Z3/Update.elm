module Z3.Update exposing (ParamMsg(..), update)

import Dict exposing (Dict)
import Util
import Z3.Model as Model


type ParamMsg
    = Format Model.Format
    | DisplayGlobalParams
    | DisplayGlobalParamDescs
    | DisplayStatistics
    | DisplayWarnings
    | Timeout (Maybe Int)
    | SoftTimeout (Maybe Int)
    | Memory (Maybe Int)


update : ParamMsg -> Model.Params -> Model.Params
update msg params =
    case msg of
        Format format ->
            { params | format = format }

        DisplayGlobalParams ->
            let
                globalParams =
                    not params.display.globalParams

                oldDisplay =
                    params.display
            in
            { params | display = { oldDisplay | globalParams = globalParams } }

        DisplayGlobalParamDescs ->
            let
                globalParamDescs =
                    not params.display.globalParamDescs

                oldDisplay =
                    params.display
            in
            { params | display = { oldDisplay | globalParamDescs = globalParamDescs } }

        DisplayStatistics ->
            let
                statistics =
                    not params.display.statistics

                oldDisplay =
                    params.display
            in
            { params | display = { oldDisplay | statistics = statistics } }

        DisplayWarnings ->
            let
                warnings =
                    not params.display.warnings

                oldDisplay =
                    params.display
            in
            { params | display = { oldDisplay | warnings = warnings } }

        Timeout n ->
            let
                oldLimit =
                    params.limit
            in
            { params | limit = { oldLimit | timeout = n } }

        SoftTimeout n ->
            let
                oldLimit =
                    params.limit
            in
            { params | limit = { oldLimit | softTimeout = n } }

        Memory n ->
            let
                oldLimit =
                    params.limit
            in
            { params | limit = { oldLimit | memory = n } }
