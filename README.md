# sample-maven-fingerprinting-error

This repository demonstrates a specific scenario where the [Develocity Maven extension][1] fails due to being unable to fingerprint one input directory. To determine if a goal execution can be safely avoided, the extension fingerprints the goal's declared inputs. If inputs are unchanged compared to a previous execution, then its outputs from that execution can be re-used (by restoring them from cache), saving build time. If symlinks that follow down to an unreadable file or directory are part of the goal's inputs (e.g. in `src/main/java` or `src/test/resources`), the extension will fail with an error.

<details>

  <summary>Stack trace</summary>

```
[INFO] Error stacktraces are turned on.
[INFO] Scanning for projects...
[WARNING] This build will only read from the build cache, since the clean lifecycle is not part of the build invocation.
[INFO]
[INFO] ------------------< com.gradle:maven-sample-3.6.x-dv >------------------
[INFO] Building maven-sample-3.6.x-dv 1.0
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ maven-sample-3.6.x-dv ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] Copying 0 resource
[INFO]
[INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ maven-sample-3.6.x-dv ---
[ERROR] Internal error in Develocity Maven extension: goal execution
com.gradle.maven.common.logging.DevelocityException: Internal error in Develocity Maven extension: goal execution
    at com.gradle.maven.common.logging.DevelocityException.a (SourceFile:31)
    at com.gradle.maven.cache.extension.c.m.a (SourceFile:104)
    at com.gradle.maven.cache.extension.c.m.a (SourceFile:88)
    at com.gradle.maven.cache.extension.g.b.lambda$createProxy$0 (SourceFile:76)
    at jdk.proxy5.$Proxy81.execute (Unknown Source)
    at com.gradle.maven.scan.extension.internal.d.b.executeMojo (SourceFile:116)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:957)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:289)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:193)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:77)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:568)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:77)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:568)
    at org.apache.maven.wrapper.BootstrapMainStarter.start (BootstrapMainStarter.java:53)
    at org.apache.maven.wrapper.WrapperExecutor.execute (WrapperExecutor.java:152)
    at org.apache.maven.wrapper.MavenWrapperMain.main (MavenWrapperMain.java:76)
Caused by: java.io.UncheckedIOException: java.nio.file.AccessDeniedException: /Users/gfeo/p/gradle/dv-solutions-samples/sample-projects/maven/3.6.x/dv/unreadable-dir
    at org.gradle.internal.snapshot.impl.DirectorySnapshotter$PathVisitor.doVisitFileFailed (SourceFile:473)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotterStatistics$CollectingFileVisitor.visitFileFailed (SourceFile:137)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotterStatistics$CollectingFileVisitor.visitFileFailed (SourceFile:110)
    at java.nio.file.Files.walkFileTree (Files.java:2813)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotter$PathVisitor.followSymlink (SourceFile:399)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotter$PathVisitor.doVisitFile (SourceFile:354)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotterStatistics$CollectingFileVisitor.visitFile (SourceFile:129)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotterStatistics$CollectingFileVisitor.visitFile (SourceFile:110)
    at java.nio.file.Files.walkFileTree (Files.java:2811)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotter.snapshot (SourceFile:126)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:135)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:110)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:84)
    at java.util.concurrent.ConcurrentHashMap.computeIfAbsent (ConcurrentHashMap.java:1740)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:84)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:73)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:213)
    at java.util.stream.ReferencePipeline$3$1.accept (ReferencePipeline.java:197)
    at java.util.Collections$2.tryAdvance (Collections.java:4853)
    at java.util.Collections$2.forEachRemaining (Collections.java:4861)
    at java.util.stream.AbstractPipeline.copyInto (AbstractPipeline.java:509)
    at java.util.stream.AbstractPipeline.wrapAndCopyInto (AbstractPipeline.java:499)
    at java.util.stream.ReduceOps$ReduceOp.evaluateSequential (ReduceOps.java:921)
    at java.util.stream.AbstractPipeline.evaluate (AbstractPipeline.java:234)
    at java.util.stream.ReferencePipeline.collect (ReferencePipeline.java:682)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:220)
    at com.gradle.maven.extension.internal.dep.com.google.common.collect.CollectCollectors.lambda$toImmutableSortedMap$9 (SourceFile:225)
    at java.util.stream.ReduceOps$3ReducingSink.accept (ReduceOps.java:169)
    at com.gradle.maven.extension.internal.dep.com.google.common.collect.CollectSpliterators$1WithCharacteristics.lambda$forEachRemaining$1 (SourceFile:72)
    at java.util.stream.Streams$RangeIntSpliterator.forEachRemaining (Streams.java:104)
    at com.gradle.maven.extension.internal.dep.com.google.common.collect.CollectSpliterators$1WithCharacteristics.forEachRemaining (SourceFile:72)
    at java.util.stream.AbstractPipeline.copyInto (AbstractPipeline.java:509)
    at java.util.stream.AbstractPipeline.wrapAndCopyInto (AbstractPipeline.java:499)
    at java.util.stream.ReduceOps$ReduceOp.evaluateSequential (ReduceOps.java:921)
    at java.util.stream.AbstractPipeline.evaluate (AbstractPipeline.java:234)
    at java.util.stream.ReferencePipeline.collect (ReferencePipeline.java:682)
    at com.gradle.maven.cache.extension.f.g.e (SourceFile:208)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:142)
    at com.gradle.maven.cache.extension.f.g.c (SourceFile:135)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:60)
    at com.gradle.maven.cache.extension.f.g$1.a (SourceFile:98)
    at com.gradle.maven.cache.extension.f.g$1.call (SourceFile:95)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute (SourceFile:210)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute (SourceFile:205)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:67)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:167)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.call (SourceFile:54)
    at com.gradle.maven.cache.extension.f.g.b (SourceFile:95)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:89)
    at com.gradle.maven.cache.extension.c.g.a (SourceFile:25)
    at com.gradle.maven.cache.extension.c.a.a (SourceFile:46)
    at com.gradle.maven.cache.extension.c.o.a (SourceFile:18)
    at com.gradle.maven.cache.extension.c.a.a (SourceFile:46)
    at com.gradle.maven.cache.extension.c.c.a (SourceFile:26)
    at com.gradle.maven.cache.extension.c.h$1.run (SourceFile:35)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$1.execute (SourceFile:30)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$1.execute (SourceFile:27)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:67)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:167)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.run (SourceFile:48)
    at com.gradle.maven.cache.extension.c.h.a (SourceFile:31)
    at com.gradle.maven.cache.extension.c.m.a (SourceFile:80)
    at com.gradle.maven.cache.extension.g.b.lambda$createProxy$0 (SourceFile:76)
    at jdk.proxy5.$Proxy81.execute (Unknown Source)
    at com.gradle.maven.scan.extension.internal.d.b.executeMojo (SourceFile:116)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:957)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:289)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:193)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:77)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:568)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:77)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:568)
    at org.apache.maven.wrapper.BootstrapMainStarter.start (BootstrapMainStarter.java:53)
    at org.apache.maven.wrapper.WrapperExecutor.execute (WrapperExecutor.java:152)
    at org.apache.maven.wrapper.MavenWrapperMain.main (MavenWrapperMain.java:76)
Caused by: java.nio.file.AccessDeniedException: /Users/gfeo/p/gradle/dv-solutions-samples/sample-projects/maven/3.6.x/dv/unreadable-dir
    at sun.nio.fs.UnixException.translateToIOException (UnixException.java:90)
    at sun.nio.fs.UnixException.rethrowAsIOException (UnixException.java:106)
    at sun.nio.fs.UnixException.rethrowAsIOException (UnixException.java:111)
    at sun.nio.fs.UnixFileSystemProvider.newDirectoryStream (UnixFileSystemProvider.java:420)
    at java.nio.file.Files.newDirectoryStream (Files.java:482)
    at java.nio.file.FileTreeWalker.visit (FileTreeWalker.java:301)
    at java.nio.file.FileTreeWalker.walk (FileTreeWalker.java:323)
    at java.nio.file.Files.walkFileTree (Files.java:2804)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotter$PathVisitor.followSymlink (SourceFile:399)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotter$PathVisitor.doVisitFile (SourceFile:354)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotterStatistics$CollectingFileVisitor.visitFile (SourceFile:129)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotterStatistics$CollectingFileVisitor.visitFile (SourceFile:110)
    at java.nio.file.Files.walkFileTree (Files.java:2811)
    at org.gradle.internal.snapshot.impl.DirectorySnapshotter.snapshot (SourceFile:126)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:135)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:110)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:84)
    at java.util.concurrent.ConcurrentHashMap.computeIfAbsent (ConcurrentHashMap.java:1740)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:84)
    at com.gradle.maven.cache.extension.e.c.a (SourceFile:73)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:213)
    at java.util.stream.ReferencePipeline$3$1.accept (ReferencePipeline.java:197)
    at java.util.Collections$2.tryAdvance (Collections.java:4853)
    at java.util.Collections$2.forEachRemaining (Collections.java:4861)
    at java.util.stream.AbstractPipeline.copyInto (AbstractPipeline.java:509)
    at java.util.stream.AbstractPipeline.wrapAndCopyInto (AbstractPipeline.java:499)
    at java.util.stream.ReduceOps$ReduceOp.evaluateSequential (ReduceOps.java:921)
    at java.util.stream.AbstractPipeline.evaluate (AbstractPipeline.java:234)
    at java.util.stream.ReferencePipeline.collect (ReferencePipeline.java:682)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:220)
    at com.gradle.maven.extension.internal.dep.com.google.common.collect.CollectCollectors.lambda$toImmutableSortedMap$9 (SourceFile:225)
    at java.util.stream.ReduceOps$3ReducingSink.accept (ReduceOps.java:169)
    at com.gradle.maven.extension.internal.dep.com.google.common.collect.CollectSpliterators$1WithCharacteristics.lambda$forEachRemaining$1 (SourceFile:72)
    at java.util.stream.Streams$RangeIntSpliterator.forEachRemaining (Streams.java:104)
    at com.gradle.maven.extension.internal.dep.com.google.common.collect.CollectSpliterators$1WithCharacteristics.forEachRemaining (SourceFile:72)
    at java.util.stream.AbstractPipeline.copyInto (AbstractPipeline.java:509)
    at java.util.stream.AbstractPipeline.wrapAndCopyInto (AbstractPipeline.java:499)
    at java.util.stream.ReduceOps$ReduceOp.evaluateSequential (ReduceOps.java:921)
    at java.util.stream.AbstractPipeline.evaluate (AbstractPipeline.java:234)
    at java.util.stream.ReferencePipeline.collect (ReferencePipeline.java:682)
    at com.gradle.maven.cache.extension.f.g.e (SourceFile:208)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:142)
    at com.gradle.maven.cache.extension.f.g.c (SourceFile:135)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:60)
    at com.gradle.maven.cache.extension.f.g$1.a (SourceFile:98)
    at com.gradle.maven.cache.extension.f.g$1.call (SourceFile:95)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute (SourceFile:210)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$CallableBuildOperationWorker.execute (SourceFile:205)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:67)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:167)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.call (SourceFile:54)
    at com.gradle.maven.cache.extension.f.g.b (SourceFile:95)
    at com.gradle.maven.cache.extension.f.g.a (SourceFile:89)
    at com.gradle.maven.cache.extension.c.g.a (SourceFile:25)
    at com.gradle.maven.cache.extension.c.a.a (SourceFile:46)
    at com.gradle.maven.cache.extension.c.o.a (SourceFile:18)
    at com.gradle.maven.cache.extension.c.a.a (SourceFile:46)
    at com.gradle.maven.cache.extension.c.c.a (SourceFile:26)
    at com.gradle.maven.cache.extension.c.h$1.run (SourceFile:35)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$1.execute (SourceFile:30)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$1.execute (SourceFile:27)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:67)
    at org.gradle.internal.operations.DefaultBuildOperationRunner$2.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:167)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.execute (SourceFile:60)
    at org.gradle.internal.operations.DefaultBuildOperationRunner.run (SourceFile:48)
    at com.gradle.maven.cache.extension.c.h.a (SourceFile:31)
    at com.gradle.maven.cache.extension.c.m.a (SourceFile:80)
    at com.gradle.maven.cache.extension.g.b.lambda$createProxy$0 (SourceFile:76)
    at jdk.proxy5.$Proxy81.execute (Unknown Source)
    at com.gradle.maven.scan.extension.internal.d.b.executeMojo (SourceFile:116)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
    at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
    at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
    at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
    at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
    at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
    at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
    at org.apache.maven.cli.MavenCli.execute (MavenCli.java:957)
    at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:289)
    at org.apache.maven.cli.MavenCli.main (MavenCli.java:193)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:77)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:568)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
    at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
    at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
    at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
    at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:77)
    at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
    at java.lang.reflect.Method.invoke (Method.java:568)
    at org.apache.maven.wrapper.BootstrapMainStarter.start (BootstrapMainStarter.java:53)
    at org.apache.maven.wrapper.WrapperExecutor.execute (WrapperExecutor.java:152)
    at org.apache.maven.wrapper.MavenWrapperMain.main (MavenWrapperMain.java:76)
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  0.727 s
[INFO] Finished at: 2025-07-23T12:26:27+01:00
[INFO] ------------------------------------------------------------------------
[INFO] 2 goals, 2 executed
[INFO]
[INFO] Publishing build scan...
[INFO] https://ge.solutions-team.gradle.com/s/xjc4pwwsiwky2
[INFO]
```

</details>

## Reproduced scenario

- An unreadable directory (`unreadable-dir`) (current user has no permissions)
- A readable symlink (`link-level-1`) to `unreadable-dir` (currrent user has all permissions)
- A readable symlink (`link-level-2`) to `link-level-1` set to be used as surefire `excludesFile` (current user has all permissions)
- Develocity Maven extension 2.0
- Maven 3.6.3 (wrapper or not is irelevant even though it changes the bottom of the stacktrace)

## Reproducing the error

### Pre-requisites

- `grealpath` (`brew install coreutils`, https://www.gnu.org/software/coreutils/) or edit the script to use `realpath`. It must not be the macOS built-in `realpath`, as that doesn't support `--no-symlinks`.

### Steps

Check out [cb1e4e7][2] and run `./reproduce.sh`.

## Suppressing the error

See commit [317a84f][3], which demonstrates how to suppress this error if build cache can also be disabled.

[1]: https://docs.gradle.com/develocity/maven-extension/current/
[2]: https://github.com/gabrielfeo/sample-maven-fingerprinting-error/commit/cb1e4e7b64cd8b3401a7a11780f257fb83365cb6
[3]: https://github.com/gabrielfeo/sample-maven-fingerprinting-error/commit/317a84f887297bf88de274250ce39c8b9cec53b4
