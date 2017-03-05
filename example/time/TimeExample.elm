module TimeExample exposing (main)

import Platform
import Platform.Cmd as Cmd
import Platform.Sub as Sub
import Process
import Task exposing (Task)
import Time
import Console


rawOutputEffect : Task Never r -> Cmd ()
rawOutputEffect task =
    Task.perform (\_ -> ()) task


main : Program Never () ()
main =
    Platform.program
        { init =
            ( ()
            , Console.time "foo"
                |> Task.andThen (\_ -> Process.sleep (2 * Time.second))
                |> Task.andThen (\_ -> Console.timeEnd "foo")
                |> rawOutputEffect
            )
        , update = (\_ _ -> () ! [ Cmd.none ])
        , subscriptions = (\_ -> Sub.none)
        }
