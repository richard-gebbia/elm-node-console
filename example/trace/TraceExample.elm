module TraceExample exposing (main)

import Platform
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Process
import Task exposing (Task)
import Console


rawOutputEffect : Task Never r -> Cmd ()
rawOutputEffect task =
    Task.perform (\_ -> ()) task


main : Program Never () ()
main =
    Platform.program
        { init =
            ( ()
            , Console.trace "foo"
                |> rawOutputEffect
            )
        , update = (\_ _ -> () ! [ Cmd.none ])
        , subscriptions = (\_ -> Sub.none)
        }
