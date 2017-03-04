module Console exposing (dir, dirWithOptions, DirOptions, defaultDirOptions, elmDir, elmDirWithOptions, error, errorAndFail, info, log, warn, warnAndFail)

import Native.Console
import Json.Encode as Encode
import Task exposing (Task)


type alias DirOptions =
    { showHidden : Bool
    , depth : Maybe Int
    , colors : Bool
    }


encodeDirOptions : DirOptions -> Encode.Value
encodeDirOptions { showHidden, depth, colors } =
    Encode.object
        [ ( "showHidden", Encode.bool showHidden )
        , ( "depth", Maybe.map Encode.int depth |> Maybe.withDefault Encode.null )
        , ( "colors", Encode.bool colors )
        ]


defaultDirOptions : DirOptions
defaultDirOptions =
    { showHidden = False
    , depth = Just 2
    , colors = False
    }


{-|
Pretty-prints a JSON value to the console.
-}
dir : Encode.Value -> Task Never ()
dir value =
    Native.Console.dir value (encodeDirOptions defaultDirOptions)


{-|
Like `dir` but you can supply some extra options to change how the value is printed.
-}
dirWithOptions : Encode.Value -> DirOptions -> Task Never ()
dirWithOptions value options =
    Native.Console.dir value (encodeDirOptions options)


{-|
Prints a value as encoded by the Elm runtime.
Useful if you are interested in the internals of Elm.
-}
elmDir : a -> Task Never ()
elmDir value =
    Native.Console.dir value (encodeDirOptions defaultDirOptions)


{-|
Like `elmDir` but you can some extra options to change how the value is printed.
-}
elmDirWithOptions : a -> DirOptions -> Task Never ()
elmDirWithOptions value options =
    Native.Console.dir value (encodeDirOptions options)


{-|
In Node, prints the supplied value to stderr. In the browser, it performs similarly
to `log`, but usually the browser shows an extra indication that this is an error message.
-}
error : a -> Task Never ()
error value =
    Native.Console.error value


{-|
Convenience function to both print an error and make a `Task` with the supplied value
as its error.
-}
errorAndFail : a -> Task a ()
errorAndFail value =
    error value
        |> Task.andThen (Task.fail value)


{-|
An alias for `log` when run in Node.
When run in the browser, it performs similarly to `log`, but usually
the browser shows an extra indication that this isn't a normal log.
-}
info : a -> Task Never ()
info value =
    Native.Console.info value


{-|
Writes a value to the global node console.
-}
log : a -> Task Never ()
log value =
    Native.Console.log value


{-|
An alias for `error` when run in Node.
When run in the browser, it performs similarly to `lof`, but usually
the browser shows an extra indication that this is a warning.
-}
warn : a -> Task Never ()
warn value =
    Native.Console.warn value


{-|
Convenience function to both print a warning and make a `Task with the supplied value
as its error.
-}
warnAndFail : a -> Task a ()
warnAndFail value =
    warn value
        |> Task.andThen (Task.fail value)
