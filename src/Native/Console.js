var _richard_gebbia$elm_node_console$Native_Console = (function () {

    function assert(value, message) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.assert(value, message);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    function dir(value, options) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.dir(value, options);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
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

    function time(label) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.time(label);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    function timeEnd(label) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.timeEnd(label);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    function trace(message) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.trace(message);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    function warn(value) {
        return _elm_lang$core$Native_Scheduler.nativeBinding(function (callback) {
            console.warn(value);
            return callback(
                _elm_lang$core$Native_Scheduler.succeed(
                    _elm_lang$core$Native_Utils.Tuple0));
        });
    }

    return {
        assert: F2(assert),
        dir: F2(dir),
        error: error,
        info: info,
        log: log,
        time: time,
        timeEnd: timeEnd,
        trace: trace,
        warn: warn
    };
})();