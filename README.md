TL;DR, here's the logs:

```
sh run
$ TestTray % sh run.sh 
Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build complete! (0.16s)
Starting tray application...
Creating status bar item...
Tray application setup complete
^C
```

vs

```
$ TestTray % swift build && ./.build/debug/TestTray

Building for debugging...
[1/1] Write swift-version--58304C5D6DBC2206.txt
Build complete! (0.16s)
Starting tray application...
Creating status bar item...
zsh: bus error  ./.build/debug/TestTray
```

The first one works but the second one results in something similar to

```
Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_ACCESS (SIGBUS)
Exception Codes:       UNKNOWN_0x101 at 0x000000000bad4007
Exception Codes:       0x0000000000000101, 0x000000000bad4007

Termination Reason:    Namespace SIGNAL, Code 10 Bus error: 10
Terminating Process:   exc handler [8282]

VM Region Info: 0xbad4007 is not in any region.  Bytes before following region: 4112187385
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      UNUSED SPACE AT START
--->  
      __TEXT                      100c84000-100cb0000    [  176K] r-x/r-x SM=COW  /Users/USER/*/shakepin.app/Contents/MacOS/shakepin

```

which happens in 2 separate projects that previously had always worked before. I have no idea why this happens