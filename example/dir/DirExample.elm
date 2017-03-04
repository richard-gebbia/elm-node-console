module DirExample exposing (main)

import Json.Encode as Encode
import Platform
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Task exposing (Task)
import Console exposing (defaultDirOptions)


rawOutputEffect : Task Never r -> Cmd ()
rawOutputEffect task =
    Task.perform (\_ -> ()) task


type alias TestObject1 =
    { foo : String
    , bar : Int
    , baz : Maybe Bool
    }


encodeTestObject1 : TestObject1 -> Encode.Value
encodeTestObject1 { foo, bar, baz } =
    Encode.object
        [ ( "name", Encode.string "Test Object 1" )
        , ( "foo", Encode.string foo )
        , ( "bar", Encode.int bar )
        , ( "baz", Maybe.map Encode.bool baz |> Maybe.withDefault Encode.null )
        ]


type alias TestObject2 =
    { testObject1 : TestObject1
    , quux : Int
    }


encodeTestObject2 : TestObject2 -> Encode.Value
encodeTestObject2 { testObject1, quux } =
    Encode.object
        [ ( "name", Encode.string "Test Object 2" )
        , ( "testObject1", encodeTestObject1 testObject1 )
        , ( "quux", Encode.int quux )
        ]


testObject1 : TestObject1
testObject1 =
    { foo = "Hello"
    , bar = -3
    , baz = Just True
    }


testObject2 : TestObject2
testObject2 =
    { testObject1 = testObject1
    , quux = 3
    }


main : Program Never () ()
main =
    Platform.program
        { init =
            ( ()
            , Task.sequence
                [ Console.dir (encodeTestObject1 testObject1)
                , Console.dirWithOptions (encodeTestObject2 testObject2) { defaultDirOptions | colors = True }
                , Console.dirWithOptions (encodeTestObject2 testObject2) { defaultDirOptions | colors = True, depth = Just 0 }
                , Console.elmDir testObject1
                , Console.elmDirWithOptions testObject1 { defaultDirOptions | colors = True }
                ]
                |> rawOutputEffect
            )
        , update = (\_ _ -> () ! [ Cmd.none ])
        , subscriptions = (\_ -> Sub.none)
        }
