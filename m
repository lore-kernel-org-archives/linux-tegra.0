From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ftrace doesn't work - 1211 upstream kernel
Date: Wed, 12 Dec 2012 19:27:09 +0800
Message-ID: <50C86A0D.9060009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

Has anyone tried to use ftrace to debug upstream kernel? I tried today
but the result is, the serial console hung after ftrace enabled(kernel
is alive because the Magic SysRq works).

My steps are:
- Enable CONFIG_FUNCTION_TRACER in kernel config
- Enter command: echo 0 > /sys/kernel/debug/tracing/tracing_on;echo
function > /sys/kernel/debug/tracing/current_tracer;echo 1 >
/proc/sys/kernel/ftrace_dump_on_oops
- Then sometimes the serial console hangs right after you entered the
command above, or hangs when you try to "cat /sys/kernel/debug/trace"

I dumped some backtraces(check below, by invoking a system crash
manually) and hope it helps:

root@tegra-ubuntu:~# cat /sys/kernel/debug/tracing/trace
[  121.979682] SysRq : Dump ftrace buffer
[  121.983633] Dumping ftrace buffer:
[  121.987110]    (ftrace buffer empty)
[  133.531569] SysRq : HELP : loglevel(0-9) reBoot Crash
terminate-all-tasks(E) memory-full-oom-kill(F) kill-all-tasks(I)
thaw-filesystems(J) saK show-backtrace-all-active-cpus(L)
show-memory-usage(M) nice
-all-RT-tasks(N) powerOff show-registers(P) show-all-timers(Q) unRaw
Sync show-task-states(T) Unmount force-fb(V) show-blocked-tasks(W)
dump-ftrace-buffer(Z)
[  141.131316] SysRq : Show Blocked State
[  168.123126] SysRq : Show backtrace of all active CPUs
[  172.514795] SysRq : Trigger a crash
[  172.518384] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[  172.526622] pgd = c0004000
[  172.529380] [00000000] *pgd=00000000
[  172.533041] Internal error: Oops: 817 [#1] PREEMPT SMP ARM
[  172.538627] Modules linked in: brcmfmac brcmutil
[  172.543382] CPU: 0    Not tainted
(3.7.0-rc8-next-20121211-00002-g4cdade7-dirty #10)
[  172.551364] PC is at sysrq_handle_crash+0x38/0x48
[  172.556157] LR is at sysrq_handle_crash+0x30/0x48
[  172.560950] pc : [<c02a346c>]    lr : [<c02a3464>]    psr: 60000193
[  172.560950] sp : c07d5df0  ip : c05a6edc  fp : c082ed84
[  172.572630] r10: 00000001  r9 : 00000000  r8 : 00000004
[  172.577950] r7 : 60000193  r6 : c08054ec  r5 : 00000063  r4 : c07f083c
[  172.584594] r3 : 00000000  r2 : 00000001  r1 : 60000193  r0 : c0831f18
[  172.591238] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[  172.598767] Control: 10c5387d  Table: ada0804a  DAC: 00000015
[  172.604617] Process swapper/0 (pid: 0, stack limit = 0xc07d4238)
[  172.610734] Stack: (0xc07d5df0 to 0xc07d6000)
[  172.615172] 5de0:                                     c02a3434
c02a3bd4 c0899ba0 00000100
[  172.623499] 5e00: 00000000 c07d60c0 eda67e00 00000000 00000061
c02b7810 00989680 00000000
[  172.631826] 5e20: ffffffeb 3b9aca00 00000000 c0899ba0 60000193
00000061 c0899c7c 00000000
[  172.640153] 5e40: ed840400 c02b79d4 00000000 ed84040c 00000044
c02b5e28 ed8de4c0 ee008710
[  172.648481] 5e60: 00000044 fe000100 c07d4000 00000000 00000000
c008dae0 00000000 c0078160
[  172.656807] 5e80: ee008724 ee0086c0 c07d6144 ee0086c0 ee008710
ed8de4c0 fe000100 00000000
[  172.665133] 5ea0: c07f00e0 00000001 00000000 c008dd5c ee0086c0
ee008710 00000000 c0090c04
[  172.673459] 5ec0: 00000044 00000044 00000000 c008d420 c07d15e4
c000f0ec fe00010c c07dc458
[  172.681786] 5ee0: c07d5f00 c0008724 c00706cc c03a22bc 60000013
ffffffff c07d5f34 c000e460
[  172.690113] 5f00: c07d5f48 3b9aca00 28d50160 00000028 287abc00
00000028 c10b1558 c07d5f48
[  172.698439] 5f20: 00000000 c07f00e0 00000001 00000000 000000ab
c07d5f48 c00706cc c03a22bc
[  172.706765] 5f40: 60000013 ffffffff 28d50160 00000028 00000000
c10b1558 c10b1558 c07d4000
[  172.715092] 5f60: 00000000 c05aa5e0 00000001 c082f0f4 c089bc38
c03a1e44 01400000 c07f00e0
[  172.723420] 5f80: c0831f18 c07d4000 c0831a88 c07dc434 c05aa5e0
c07e0df0 412fc099 00000000
[  172.731746] 5fa0: 00000000 c000f530 c07dd5e8 ffffffff c08319c0
c07c4ff0 c10ae000 c079f7ac
[  172.740072] 5fc0: ffffffff ffffffff c079f234 00000000 00000000
c07c4ff0 00000000 10c5387d
[  172.748399] 5fe0: c07dc430 c07c4fec c07e0de4 8000406a 00000000
80008078 00000000 00000000
[  172.756736] [<c02a346c>] (sysrq_handle_crash+0x38/0x48) from
[<c02a3bd4>] (__handle_sysrq+0x10c/0x17c)
[  172.766218] [<c02a3bd4>] (__handle_sysrq+0x10c/0x17c) from
[<c02b7810>] (serial8250_rx_chars+0xd4/0x224)
[  172.780521] [<c02b7810>] (serial8250_rx_chars+0xd4/0x224) from
[<c02b79d4>] (serial8250_handle_irq+0x74/0xa4)
[  172.795330] [<c02b79d4>] (serial8250_handle_irq+0x74/0xa4) from
[<c02b5e28>] (serial8250_interrupt+0x48/0xb8)
[  172.810195] [<c02b5e28>] (serial8250_interrupt+0x48/0xb8) from
[<c008dae0>] (handle_irq_event_percpu+0x74/0x2ac)
[  172.825355] [<c008dae0>] (handle_irq_event_percpu+0x74/0x2ac) from
[<c008dd5c>] (handle_irq_event+0x44/0x64)
[  172.840216] [<c008dd5c>] (handle_irq_event+0x44/0x64) from
[<c0090c04>] (handle_fasteoi_irq+0xa8/0x17c)
[  172.854697] [<c0090c04>] (handle_fasteoi_irq+0xa8/0x17c) from
[<c008d420>] (generic_handle_irq+0x28/0x38)
[  172.869245] [<c008d420>] (generic_handle_irq+0x28/0x38) from
[<c000f0ec>] (handle_IRQ+0x40/0x98)
[  172.882876] [<c000f0ec>] (handle_IRQ+0x40/0x98) from [<c0008724>]
(gic_handle_irq+0x30/0x64)
[  172.896038] [<c0008724>] (gic_handle_irq+0x30/0x64) from [<c000e460>]
(__irq_svc+0x40/0x70)
[  172.909149] Exception stack(0xc07d5f00 to 0xc07d5f48)
[  172.918976] 5f00: c07d5f48 3b9aca00 28d50160 00000028 287abc00
00000028 c10b1558 c07d5f48
[  172.932036] 5f20: 00000000 c07f00e0 00000001 00000000 000000ab
c07d5f48 c00706cc c03a22bc
[  172.945068] 5f40: 60000013 ffffffff
[  172.953335] [<c000e460>] (__irq_svc+0x40/0x70) from [<c03a22bc>]
(cpuidle_wrap_enter+0x54/0xa8)
[  172.966987] [<c03a22bc>] (cpuidle_wrap_enter+0x54/0xa8) from
[<c03a1e44>] (cpuidle_idle_call+0xe0/0x378)
[  172.981480] [<c03a1e44>] (cpuidle_idle_call+0xe0/0x378) from
[<c000f530>] (cpu_idle+0xc4/0x118)
[  172.995199] [<c000f530>] (cpu_idle+0xc4/0x118) from [<c079f7ac>]
(start_kernel+0x2a8/0x2f8)
[  173.008555] Code: 0a000000 e12fff33 e3a02001 e3a03000 (e5c32000)
[  173.019629] ---[ end trace 3b1f58dc14f4f716 ]---
[  173.029269] Kernel panic - not syncing: Fatal exception in interrupt
[  173.041047] CPU3: stopping
[  173.048777] [<c00156a4>] (unwind_backtrace+0x0/0x100) from
[<c0014850>] (handle_IPI+0x124/0x14c)
[  173.062741] [<c0014850>] (handle_IPI+0x124/0x14c) from [<c0008750>]
(gic_handle_irq+0x5c/0x64)
[  173.076573] [<c0008750>] (gic_handle_irq+0x5c/0x64) from [<c000e460>]
(__irq_svc+0x40/0x70)
[  173.090176] Exception stack(0xee093f38 to 0xee093f80)
[  173.100436] 3f20:
   ee093f80 3b9aca00
[  173.113873] 3f40: 4832e9a0 00000028 236d8e78 00000027 c10cc558
ee093f80 00000001 c07f00e0
[  173.127337] 3f60: 00000001 00000000 000000ab ee093f80 c00706cc
c03a22bc 60000113 ffffffff
[  173.140826] [<c000e460>] (__irq_svc+0x40/0x70) from [<c03a22bc>]
(cpuidle_wrap_enter+0x54/0xa8)
[  173.154858] [<c03a22bc>] (cpuidle_wrap_enter+0x54/0xa8) from
[<c03a1e44>] (cpuidle_idle_call+0xe0/0x378)
[  173.169719] [<c03a1e44>] (cpuidle_idle_call+0xe0/0x378) from
[<c000f530>] (cpu_idle+0xc4/0x118)
[  173.183789] [<c000f530>] (cpu_idle+0xc4/0x118) from [<8059f3e8>]
(0x8059f3e8)
[  174.173667] SMP: failed to stop secondary CPUs
[  174.183428] drm_kms_helper: panic occurred, switching back to text
console


Mark
