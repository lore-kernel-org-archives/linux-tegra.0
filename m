From: Jon Hunter <jonathanh@nvidia.com>
Subject: [REGRESSION v5.2-rc] SUNRPC: Declare RPC timers as TIMER_DEFERRABLE
 (431235818bc3)
Date: Wed, 5 Jun 2019 09:40:30 +0100
Message-ID: <c54db63b-0d5d-2012-162a-cb08cf32245a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trondmy@hammerspace.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Trond,

I have been noticing intermittent failures with a system suspend test on
some of our machines that have a NFS mounted root file-system. Bisecting
this issue points to your commit 431235818bc3 ("SUNRPC: Declare RPC
timers as TIMER_DEFERRABLE") and reverting this on top of v5.2-rc3 does
appear to resolve the problem.

The cause of the suspend failure appears to be a long delay observed
sometimes when resuming from suspend, and this is causing our test to
timeout. For example, in a failing case I see something like the
following ...

[   69.667385] PM: suspend entry (deep)

[   69.675642] Filesystems sync: 0.000 seconds

[   69.684983] Freezing user space processes ... (elapsed 0.001 seconds) done.

[   69.697880] OOM killer disabled.

[   69.705670] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.

[   69.719043] printk: Suspending console(s) (use no_console_suspend to debug)

[   69.758911] Disabling non-boot CPUs ...

[   69.761875] IRQ 17: no longer affine to CPU3

[   69.762609] Entering suspend state LP1

[   69.762636] Enabling non-boot CPUs ...

[   69.763600] CPU1 is up

[   69.764517] CPU2 is up

[   69.765532] CPU3 is up

[   69.845832] mmc1: queuing unknown CIS tuple 0x80 (50 bytes)

[   69.854223] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)

[   69.857238] mmc1: queuing unknown CIS tuple 0x80 (7 bytes)

[   69.892700] mmc1: queuing unknown CIS tuple 0x02 (1 bytes)

[   70.407286] OOM killer enabled.

[   70.414674] Restarting tasks ... done.

[   70.423232] PM: suspend exit

[   73.533252] asix 1-1:1.0 eth0: link up, 100Mbps, full-duplex, lpa 0xCDE1

[  105.461852] nfs: server 192.168.99.1 not responding, still trying

[  105.462347] nfs: server 192.168.99.1 not responding, still trying

[  105.484809] nfs: server 192.168.99.1 OK

[  105.486454] nfs: server 192.168.99.1 OK


So it would appear that making these timers deferrable is having an impact
when resuming from suspend. Do you have any thoughts on this?

Thanks
Jon
