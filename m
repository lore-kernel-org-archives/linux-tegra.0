From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: Tegra 30 System hangs because of commit "pinctrl: move subsystem
 mutex to pinctrl_dev struct"
Date: Mon, 29 Apr 2013 11:41:44 -0700
Message-ID: <CAK5ve-KBDyvjNRVMcXgfnhYcajdcGsuAKaepzCBt+epiXoYvSw@mail.gmail.com>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Forward to ARM and Tegra mail list.


---------- Forwarded message ----------
From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Mon, Apr 29, 2013 at 11:15 AM
Subject: Tegra 30 System hangs because of commit "pinctrl: move
subsystem mutex to pinctrl_dev struct"
To: patrice.chotard-qxv4g6HH51o@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>,
"linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


Hi Patrice and Linus,

I'm running linux-next on my Tegra 30 system everyday. But since
next-20130426 release, the linux-next kernel will hang on my Tegra 30
boards like Cardhu and Beaver.

After some bisect and comparing to next-20130424, I found the commit
"pinctrl: move subsystem mutex to pinctrl_dev struct" introduced this
issue. If I simply revert this patch in next-20130429, system boots up
as before.

Could you please help to check this?

----
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.9.0-rc8-09782-ga6df01a
(roc@roc-HP-desktop) (gcc version 4.7.3 (Ubuntu/Linaro 4.7.3-1ubuntu1)
) #20 SMP PREEMPT Mon Apr 29 10:09:07 PDT 2013
[    0.000000] CPU: ARMv7 Processor [412fc099] revision 9 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] Machine: NVIDIA Tegra30 (Flattened Device Tree), model:
NVIDIA Tegra30 Beaver evaluation board
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] cma: CMA: reserved 16 MiB at ae800000
[    0.000000] Memory policy: ECC disabled, Data cache writealloc
[    0.000000] On node 0 totalpages: 524032
[    0.000000] free_area_init_node: node 0, pgdat c070b7c0,
node_mem_map c075c000
[    0.000000]   Normal zone: 1520 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 194560 pages, LIFO batch:31
[    0.000000]   HighMem zone: 2574 pages used for memmap
[    0.000000]   HighMem zone: 329472 pages, LIFO batch:31
[    0.000000] fuse_speedo_calib: ATE prog ver 3.3
[    0.000000] Tegra30: CPU Speedo ID 5, Soc Speedo ID 2
[    0.000000] Tegra Revision: A03 SKU: 128 CPU Process: 4 Core Process: 0
[    0.000000] L310 cache controller enabled
[    0.000000] l2x0: 8 ways, CACHE_ID 0x410000c7, AUX_CTRL 0x7e480001,
Cache size: 1048576 B
[    0.000000] PERCPU: Embedded 8 pages/cpu @c176e000 s9280 r8192 d15296 u32768
[    0.000000] pcpu-alloc: s9280 r8192 d15296 u32768 alloc=8*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 522512
[    0.000000] Kernel command line: console=ttyS0,115200n8
root=/dev/mmcblk0p1 loglevel=8 rootwait rw earlyprintk
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 2047MB = 2047MB total
[    0.000000] Memory: 2054764k/2054764k available, 41364k reserved,
1317888K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0695268   (6709 kB)
[    0.000000]       .init : 0xc0696000 - 0xc06c8440   ( 202 kB)
[    0.000000]       .data : 0xc06ca000 - 0xc070d020   ( 269 kB)
[    0.000000]        .bss : 0xc070d020 - 0xc075bb88   ( 315 kB)
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] sched_clock: 32 bits at 1000kHz, resolution 1000ns,
wraps every 4294967ms
[    0.000000] Console: colour dummy device 80x30
[    0.005231] Calibrating delay loop... 1993.93 BogoMIPS (lpj=9969664)
[    0.062959] pid_max: default: 32768 minimum: 301
[    0.068223] Mount-cache hash table entries: 512
[    0.083957] Initializing cgroup subsys debug
[    0.088428] Initializing cgroup subsys freezer
[    0.093220] CPU: Testing write buffer coherency: ok
[    0.098680] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.104632] Setting up static identity map for 0xc04d9dc8 - 0xc04d9e4c
[    0.166265] CPU1: Booted secondary processor
[    0.224635] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.246245] CPU2: Booted secondary processor
[    0.304634] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.326206] CPU3: Booted secondary processor
[    0.384634] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.384730] Brought up 4 CPUs
[    0.418869] SMP: Total of 4 processors activated (7975.73 BogoMIPS).
[    0.425471] CPU: All CPU(s) started in SVC mode.
[    0.431323] devtmpfs: initialized
[    0.449863] pinctrl core: initialized pinctrl subsystem
[    0.455839] regulator-dummy: no parameters
[    0.461447] NET: Registered protocol family 16
[    0.469728] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.487314] No ATAGs?
[    0.489478] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
watchpoint registers.
[    0.498053] hw-breakpoint: maximum watchpoint size is 4 bytes.
----
System hangs here, no output at all.

Any suggestions are welcome, I can test that on my hardware.
Thanks,
-Bryan
