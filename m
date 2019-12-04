From: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 4.19 000/321] 4.19.88-stable review
Date: Thu, 5 Dec 2019 00:41:41 +0530
Message-ID: <CA+G9fYtba3Hhd7QikcWSEjYK0mwGBNuaXctnO5f1COsRP7qkSw@mail.gmail.com>
References: <20191203223427.103571230@linuxfoundation.org> <79c636e7-145b-3062-04a3-f03c78d51318@nvidia.com>
 <20191204112936.GA3565947@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191204112936.GA3565947@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, open list <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, Shuah Khan <shuah@kernel.org>, patches@kernelci.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, lkft-triage@lists.linaro.org, linux- stable <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> Thanks for letting me know, I'll go drop this one and push out a -rc2
> with that removed.

Results from Linaro=E2=80=99s test farm.
No regressions on arm64, arm, x86_64, and i386.

Summary
------------------------------------------------------------------------

kernel: 4.19.88-rc2
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git
git branch: linux-4.19.y
git commit: ba731ec12c667db0f1f85e4bfe11387587feb243
git describe: v4.19.87-322-gba731ec12c66
Test details: https://qa-reports.linaro.org/lkft/linux-stable-rc-4.19-oe/bu=
ild/v4.19.87-322-gba731ec12c66


No regressions (compared to build v4.19.87)

No fixes (compared to build v4.19.87)

Ran 21276 total tests in the following environments and test suites.

Environments
--------------
- dragonboard-410c - arm64
- hi6220-hikey - arm64
- i386
- juno-r2 - arm64
- qemu_arm64
- qemu_i386
- qemu_x86_64
- x15 - arm
- x86_64

Test Suites
-----------
* build
* kvm-unit-tests
* libhugetlbfs
* linux-log-parser
* ltp-containers-tests
* ltp-commands-tests
* ltp-dio-tests
* ltp-io-tests
* ltp-ipc-tests
* ltp-math-tests
* ltp-sched-tests
* ltp-cap_bounds-tests
* ltp-cpuhotplug-tests
* ltp-fcntl-locktests-tests
* ltp-filecaps-tests
* ltp-fs_bind-tests
* ltp-fs_perms_simple-tests
* ltp-fsx-tests
* ltp-nptl-tests
* ltp-pty-tests
* ltp-securebits-tests
* perf
* v4l2-compliance

--=20
Linaro LKFT
https://lkft.linaro.org
