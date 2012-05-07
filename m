From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Regression due to d29f3ef "tty_lock: Localise the lock"
Date: Mon, 07 May 2012 17:06:38 -0600
Message-ID: <4FA8557E.5080402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Alan,

Commit d29f3ef "tty_lock: Localise the lock" appears to cause a problem
for me.

With this commit (as in next-20120507), I can no longer log into my
system (NVIDIA Tegra device with ARM CPU) over the serial console, since
the login prompt no longer appears. If I wait a few minutes, I see the
following console spew:

> [ 241.602902] INFO: task bootlogd:281 blocked for more than 120 seconds.
> [ 241.609461] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [ 241.617308] bootlogd D c0395e70 0 281 1 0x00000000
> [ 241.623809] [<c0395e70>] (__schedule+0x474/0x548) from [<c039630c>] (schedule_preempt_disabled+0x24/0x34)
> [ 241.633442] [<c039630c>] (schedule_preempt_disabled+0x24/0x34) from [<c0394ff0>] (__mutex_lock_slowpath+0x1a8/0x308)
> [ 241.647580] [<c0394ff0>] (__mutex_lock_slowpath+0x1a8/0x308) from [<c039515c>] (mutex_lock+0xc/0x24)
> [ 241.658513] [<c039515c>] (mutex_lock+0xc/0x24) from [<c01d0ca0>] (tty_release+0xe8/0x37c)
> [ 241.670347] [<c01d0ca0>] (tty_release+0xe8/0x37c) from [<c00b2f50>] (__fput+0xe4/0x1e4)
> [ 241.678449] [<c00b2f50>] (__fput+0xe4/0x1e4) from [<c01d0c74>] (tty_release+0xbc/0x37c)
> [ 241.686444] [<c01d0c74>] (tty_release+0xbc/0x37c) from [<c00b2f50>] (__fput+0xe4/0x1e4)
> [ 241.694549] [<c00b2f50>] (__fput+0xe4/0x1e4) from [<c00b0028>] (filp_close+0x64/0x70)
> [ 241.702441] [<c00b0028>] (filp_close+0x64/0x70) from [<c00b00e4>] (sys_close+0xb0/0xf0)
> [ 241.710512] [<c00b00e4>] (sys_close+0xb0/0xf0) from [<c000e1c0>] (ret_fast_syscall+0x0/0x30)
> [ 241.719010] INFO: task startpar:779 blocked for more than 120 seconds.
> [ 241.725523] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [ 241.733421] startpar D c0395e70 0 779 769 0x00000000
> [ 241.739853] [<c0395e70>] (__schedule+0x474/0x548) from [<c039630c>] (schedule_preempt_disabled+0x24/0x34)
> [ 241.749482] [<c039630c>] (schedule_preempt_disabled+0x24/0x34) from [<c0394ff0>] (__mutex_lock_slowpath+0x1a8/0x308)
> [ 241.760067] [<c0394ff0>] (__mutex_lock_slowpath+0x1a8/0x308) from [<c039515c>] (mutex_lock+0xc/0x24)
> [ 241.769267] [<c039515c>] (mutex_lock+0xc/0x24) from [<c01d8018>] (ptmx_open.part.2+0x38/0x118)
> [ 241.777942] [<c01d8018>] (ptmx_open.part.2+0x38/0x118) from [<c00b5188>] (chrdev_open+0x118/0x13c)
> [ 241.786894] [<c00b5188>] (chrdev_open+0x118/0x13c) from [<c00b0314>] (__dentry_open.isra.15+0x194/0x2a0)
> [ 241.796472] [<c00b0314>] (__dentry_open.isra.15+0x194/0x2a0) from [<c00bdc20>] (do_last.isra.34+0x484/0x528)
> [ 241.806372] [<c00bdc20>] (do_last.isra.34+0x484/0x528) from [<c00bde8c>] (path_openat+0xb8/0x3dc)
> [ 241.815302] [<c00bde8c>] (path_openat+0xb8/0x3dc) from [<c00be290>] (do_filp_open+0x2c/0x78)
> [ 241.823800] [<c00be290>] (do_filp_open+0x2c/0x78) from [<c00b10c4>] (do_sys_open+0xd8/0x170)
> [ 241.832299] [<c00b10c4>] (do_sys_open+0xd8/0x170) from [<c000e1c0>] (ret_fast_syscall+0x0/0x30) 

If I revert that commit, then everything works again.
