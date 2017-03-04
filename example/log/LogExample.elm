module LogExample exposing (main)

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
                [ Console.log "Hello world"
                , Console.log (\_ -> ())
                , Console.log { foo = Just 3, bar = Nothing }
                , Console.info "Printed with Console.info"
                ]
                |> rawOutputEffect
            )
        , update = (\_ _ -> () ! [ Cmd.none ])
        , subscriptions = (\_ -> Sub.none)
        }
