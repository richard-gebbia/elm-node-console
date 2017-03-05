module ErrorExample exposing (main)

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
                [ Console.error "Oh noes!"
                , Console.errorAndFail "Oh noes!" |> Task.onError (\x -> Console.log "Recovering from error")
                , Console.warn "Just a warning"
                , Console.warnAndFail "Another warning" |> Task.onError (\x -> Console.log "Recovering from warning")
                ]
                |> rawOutputEffect
            )
        , update = (\_ _ -> () ! [ Cmd.none ])
        , subscriptions = (\_ -> Sub.none)
        }
