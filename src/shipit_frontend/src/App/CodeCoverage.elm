module App.CodeCoverage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData as RemoteData exposing (WebData, RemoteData(Loading, Success, NotAsked, Failure), isSuccess)
import TaskclusterLogin as User
import Hawk


-- Models


type alias Model =
    { backend_uplift_url : String
    }


type Msg
    = SomeAction
      -- Hawk Extension
    | HawkRequest Hawk.Msg


init : String -> ( Model, Cmd Msg )
init backend_uplift_url =
    -- Init empty model
    ( { backend_uplift_url = backend_uplift_url
      }
      -- TODO: load code coverage data
    , Cmd.none
    )



-- Update


routeHawkRequest : Cmd (WebData String) -> String -> Cmd Msg
routeHawkRequest response route =
    case route of
        "CodeCoverage" ->
            -- Cmd.map FetchedAllAnalysis response
            Cmd.none

        _ ->
            Cmd.none


update : Msg -> Model -> User.Model -> ( Model, Cmd Msg )
update msg model user =
    case msg of
        SomeAction ->
            ( model, Cmd.none )

        HawkRequest hawkMsg ->
            ( model, Cmd.none )



-- Views


view : Model -> Html Msg
view model =
    div [ class "alert alert-info" ] [ text "Display code coverage..." ]
