var _richard_gebbia$elm_node_console$Native_Console = (function () {

    function dir(value) {
        return function (options) {
            return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
                console.dir(value, options);
                return callback(
                    _elm_lang$core$Native_Scheduler.succeed(
                        _elm_lang$core$Native_Utils.Tuple0));
            });
        }
    }

    function info(value) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.info(value);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    function error(value) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.error(value);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    function log(value) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.log(value);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    function warn(value) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.error(value);
            return warn(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    return {
        dir: dir,
        error: error,
        info: info,
        log: log,
        warn: warn
    };
})();