module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import BackendTask
import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes as Attr
import Icon
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import View exposing (View)


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Just OnPageChange
    }


type Msg
    = OnPageChange
        { path : Path
        , query : Maybe String
        , fragment : Maybe String
        }
    | SharedMsg SharedMsg


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { showMobileMenu : Bool
    }


init :
    Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Effect Msg )
init flags maybePagePath =
    ( { showMobileMenu = False }
    , Effect.none
    )


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        OnPageChange _ ->
            ( { model | showMobileMenu = False }, Effect.none )

        SharedMsg globalMsg ->
            ( model, Effect.none )


subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : BackendTask.BackendTask Data
data =
    BackendTask.succeed ()


view :
    Data
    ->
        { path : Path
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : Html msg, title : String }
view sharedData page model toMsg pageView =
    { body =
        Html.div
            []
            [ Html.nav
                [ Attr.style "display" "flex"
                , Attr.style "justify-content" "space-evenly"
                ]
                [ Html.span [ Attr.class "icon" ]
                    [ Html.text " "
                    , Html.kbd [] [ Html.text "Ctrl" ]
                    , Html.text "+"
                    , Html.kbd [] [ Html.text "R" ]
                    , Html.text " Smoothies"
                    ]
                ]
            , Html.div
                [ Attr.style "padding" "40px"
                ]
                pageView.body
            ]
    , title = pageView.title
    }
