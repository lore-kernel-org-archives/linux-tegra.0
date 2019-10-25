From: Jon Hunter <jonathanh@nvidia.com>
Subject: [REGRESSION v5.3] SUNRPC: Replace the queue timer with a delayed work
 function (7e0a0e38fcfe)
Date: Fri, 25 Oct 2019 08:28:57 +0100
Message-ID: <271ff39f-1f44-b201-6274-85f1085bfc16@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trondmy@hammerspace.com>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Trond,

Similar to the change 431235818bc3 ("SUNRPC: Declare RPC timers as
TIMER_DEFERRABLE") I have been tracking down another suspend/NFS related
issue where again I am seeing random delays exiting suspend. The delays
can be up to a couple minutes in the worst case and this is causing a
suspend test we have to fail. For example, with this change I see ...

[  130.599520] PM: suspend entry (deep)

[  130.607267] Filesystems sync: 0.000 seconds

[  130.615800] Freezing user space processes ... (elapsed 0.001 seconds) done.

[  130.628247] OOM killer disabled.

[  130.635382] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.

[  130.648052] printk: Suspending console(s) (use no_console_suspend to debug)

[  130.686015] Disabling non-boot CPUs ...

[  130.689568] IRQ 17: no longer affine to CPU2

[  130.693435] Entering suspend state LP1

[  130.693489] Enabling non-boot CPUs ...

[  130.697108] CPU1 is up

[  130.700602] CPU2 is up

[  130.704338] CPU3 is up

[  130.781259] mmc1: queuing unknown CIS tuple 0x80 (50 bytes)

[  130.789742] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)

[  130.792793] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)

[  130.820913] mmc1: queuing unknown CIS tuple 0x02 (1 bytes)

[  131.345569] OOM killer enabled.

[  131.352643] Restarting tasks ... done.

[  131.365480] PM: suspend exit

[  134.524261] asix 1-1:1.0 eth0: link up, 100Mbps, full-duplex, lpa 0xCDE1

[  243.745788] nfs: server 192.168.99.1 not responding, still trying

[  243.745811] nfs: server 192.168.99.1 not responding, still trying

[  243.767939] nfs: server 192.168.99.1 not responding, still trying

[  243.778233] nfs: server 192.168.99.1 OK

[  243.787058] nfs: server 192.168.99.1 OK

[  243.787542] nfs: server 192.168.99.1 OK


Running a git bisect I was able to track it down to the commit referenced
in the $subject. Reverting this on top of the current mainline fixes the
problem and I no longer see these long delays.

Cheers
Jon

-- 
nvpublic
