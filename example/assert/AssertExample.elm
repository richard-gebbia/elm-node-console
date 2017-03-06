module DirExample exposing (main)

import Platform
import Platform.Cmd as Cmd
import Platform.Sub as Sub
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
            , Task.sequence
                [ Console.assert True "This will never appear"
                , Console.assert False "A false assertion!"
                ]
                |> rawOutputEffect
            )
        , update = (\_ _ -> () ! [ Cmd.none ])
        , subscriptions = (\_ -> Sub.none)
        }
