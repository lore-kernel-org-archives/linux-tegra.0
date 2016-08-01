From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH V6 3/9] irqdomain: Don't set type when mapping an IRQ
Date: Mon, 1 Aug 2016 12:09:24 +0900
Message-ID: <CAK7LNAR=cF42QW0pZ014LXDvcBtWh9SCuKPS5gvQHriFm=hDRQ@mail.gmail.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
 <1465312354-27778-4-git-send-email-jonathanh@nvidia.com> <CAK7LNASBpym341Yz57LPa5z81aLX0xmhEVvoY+q5zfiQkFSxwg@mail.gmail.com>
 <bdd8ed36-c2dc-6f73-d362-2cf47d128e6f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bdd8ed36-c2dc-6f73-d362-2cf47d128e6f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

2016-07-29 17:31 GMT+09:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>
> On 29/07/16 04:53, Masahiro Yamada wrote:
>> Hi.
>>
>> I noticed my board would not work any more
>> when pulling recent updates.
>>
>> I did "git-bisect" and I found the following commit is it.
>>
>> commit 1e2a7d78499ec8859d2b469051b7b80bad3b08aa
>> Author: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Date:   Tue Jun 7 16:12:28 2016 +0100
>>
>>     irqdomain: Don't set type when mapping an IRQ
>>
>> With reverting it, everything works fine for me.
>>
>> My board is arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
>>
>> Is anything wrong with IRQ settings in my Device Tree?
>
> Most likely.
>
>> If 1e2a7d784 is really a buggy commit,
>> could you do something please?
>
> Before this commit bad IRQ type settings in device-tree were not getting
> reported and so that's why most likely it is bad IRQ type settings. As
> Marc mentioned without any more details (which IRQ for which device is
> failing) we cannot confirm. So I would look at the failing IRQ which is
> now failing when being requested and see if the type in device-tree is
> correct.
>


I added
bootargs = "earlycon keep_bootcon"


and the following was what I got.
It looks to me that it silently died without any clear error message.




[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.7.0-07845-g56a940f-dirty
(yamada@beagle) (gcc version 5.3.1 20160113 (Linaro GCC 5.3-2016.02) )
#56 SMP PREEMPT Mon Aug 1 11:15:22 JST 2016
[    0.000000] Boot CPU: AArch64 Processor [410fd082]
[    0.000000] earlycon: uniphier0 at MMIO 0x0000000054006800 (options
'115200n8')
[    0.000000] bootconsole [uniphier0] enabled
[    0.000000] debug: skip boot console de-registration.
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x00000000fec00000
[    0.000000] percpu: Embedded 21 pages/cpu @ffff8000bff7d000 s48256
r8192 d29568 u86016
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 774144
[    0.000000] Kernel command line: earlycon keep_bootcon
[    0.000000] log_buf_len individual max cpu contribution: 4096 bytes
[    0.000000] log_buf_len total cpu_extra contributions: 12288 bytes
[    0.000000] log_buf_len min size: 16384 bytes
[    0.000000] log_buf_len: 32768 bytes
[    0.000000] early log buf free: 14832(90%)
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10,
4194304 bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] software IO TLB [mem 0xfac00000-0xfec00000] (64MB)
mapped at [ffff80007ac00000-ffff80007ebfffff]
[    0.000000] Memory: 2992924K/3145728K available (7676K kernel code,
657K rwdata, 3208K rodata, 960K init, 269K bss, 136420K reserved,
16384K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffff000000000000 - 0xffff000008000000
(   128 MB)
[    0.000000]     vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000
(129022 GB)
[    0.000000]       .text : 0xffff000008080000 - 0xffff000008800000
(  7680 KB)
[    0.000000]     .rodata : 0xffff000008800000 - 0xffff000008b30000
(  3264 KB)
[    0.000000]       .init : 0xffff000008b30000 - 0xffff000008c20000
(   960 KB)
[    0.000000]       .data : 0xffff000008c20000 - 0xffff000008cc4600
(   658 KB)
[    0.000000]        .bss : 0xffff000008cc4600 - 0xffff000008d07cb0
(   270 KB)
[    0.000000]     fixed   : 0xffff7dfffe7fd000 - 0xffff7dfffec00000
(  4108 KB)
[    0.000000]     PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000
(    16 MB)
[    0.000000]     vmemmap : 0xffff7e0000000000 - 0xffff800000000000
(  2048 GB maximum)
[    0.000000]               0xffff7e0000000000 - 0xffff7e0003000000
(    48 MB actual)
[    0.000000]     memory  : 0xffff800000000000 - 0xffff8000c0000000
(  3072 MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 64.
[    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=4
[    0.000000] NR_IRQS:64 nr_irqs:64 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x000000005fe80000
[    0.000000] Architected cp15 timer(s) running at 50.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0xb8812736b, max_idle_ns: 440795202655 ns
[    0.000002] sched_clock: 56 bits at 50MHz, resolution 20ns, wraps
every 4398046511100ns
[    0.008148] Console: colour dummy device 80x25
[    0.012595] console [tty0] enabled
[    0.016008] Calibrating delay loop (skipped), value calculated
using timer frequency.. 100.00 BogoMIPS (lpj=200000)
[    0.026468] pid_max: default: 32768 minimum: 301
[    0.031127] Security Framework initialized
[    0.035246] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.041953] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.049901] ASID allocator initialised with 65536 entries



-- 
Best Regards
Masahiro Yamada
