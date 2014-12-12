From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Kernel BUG from tegra_dc_irq()
Date: Fri, 12 Dec 2014 17:30:43 +0900
Message-ID: <548AA7B3.7080400@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

I sometimes notice the following oops happening. Generally when I am 
running Weston/glmark2 for long periods of time (at least 4/5 hours). I 
am trying to see if I can reproduce it with simpler workloads. Are you 
aware of this?

Cheers,
Alex.

[18468.532205] kernel BUG at ../drivers/gpu/drm/drm_irq.c:1032!
[18468.537857] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
[18468.543679] Modules linked in: nouveau_platform(O) nouveau(O) 
cfbfillrect cfbimgblt cfbcopyarea ttm
[18468.552789] CPU: 0 PID: 210 Comm: weston Tainted: G           O 
3.18.0-00029-g0924e632ef58 #2780
[18468.561735] task: ed6492c0 ti: ec560000 task.ti: ec560000
[18468.567131] PC is at drm_vblank_put+0xbc/0xd0
[18468.571485] LR is at tegra_dc_irq+0x11c/0x130
[18468.575837] pc : [<c02c290c>]    lr : [<c02de3d8>]    psr: 60010193
[18468.575837] sp : ec561d38  ip : ed5cf768  fp : e8048c80
[18468.587295] r10: c092b5f4  r9 : 00000000  r8 : 60010193
[18468.592512] r7 : ed900d0c  r6 : ed900c00  r5 : 00000000  r4 : ee0e7810
[18468.599026] r3 : ed856e00  r2 : 00000000  r1 : 00000000  r0 : ed900c00
[18468.605543] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment user
[18468.612754] Control: 10c5387d  Table: ac57406a  DAC: 00000015
[18468.618490] Process weston (pid: 210, stack limit = 0xec560238)
[18468.624397] Stack: (0xec561d38 to 0xec562000)
[18468.628747] 1d20: 
    c02de2bc ed8fff80
[18468.636912] 1d40: ee00909c 00000000 00000000 00000069 ee009040 
c0066298 ec0873c0 00000020
[18468.645078] 1d60: ee009040 ee00909c ed8fff80 00000001 ee006000 
ee0e7840 ed275300 c0066390
[18468.653244] 1d80: ee009040 ee00909c c08f0784 c0068ce0 00000069 
00000000 00000000 c0065a00
[18468.661408] 1da0: c08d3d5c c0065c80 fe44200c 00000059 c08df15c 
ec561dd8 fe442000 c0008794
[18468.669572] 1dc0: c02c25e4 a0010013 ffffffff ec561e0c ed5cf700 
c0012540 ed900c00 00000000
[18468.677737] 1de0: e8048c80 00000000 ee0e7840 ee0e7810 ed275300 
00000000 ed5cf700 ee0e7840
[18468.685902] 1e00: ed275300 e8048c80 ee0e7840 ec561e20 c02de870 
c02c25e4 a0010013 ffffffff
[18468.694066] 1e20: ee0e787c ec561e88 ed900c00 c02cf07c ed275300 
ec561f7c ec0873c0 ed900d0c
[18468.702230] 1e40: 00000008 ec561e88 ed900c00 00000018 c097588c 
000000b0 ed5cf700 ec561e88
[18468.710394] 1e60: c067a94c c02c11e8 c04aab98 c04abfc4 00000000 
00000000 bec49760 c01864b0
[18468.718558] 1e80: c02ceefc 00000464 00000006 00000014 00000001 
00000000 00079de8 00000000
[18468.726723] 1ea0: ec560030 bec497e8 00000000 ed67e600 c04aa93c 
ee1b5a00 ed67e608 c011c680
[18468.734888] 1ec0: c08dac90 2decb000 a0010013 0000002a ed7bf080 
c00de85c 00000000 ed67e608
[18468.743052] 1ee0: ed6f5ac0 c08df0b8 ed6f5ae4 00200200 ee79e3d0 
c006e3e0 ed6f5ac0 ed6f5ac0
[18468.751217] 1f00: ed7bf084 ed7bf084 c092eb74 ed86a1d8 bec49760 
ed697d00 c01864b0 0000000c
[18468.759381] 1f20: ec560000 00000000 00000000 c00f4514 ed7bf084 
00000000 00000001 bec49734
[18468.767546] 1f40: 40000040 bec499a4 00004040 ec0873c0 bec499a4 
00004040 00000128 c000e964
[18468.775711] 1f60: ec560000 00000000 00000000 ed697d00 bec49760 
ed697d00 c01864b0 0000000c
[18468.783876] 1f80: ec560000 00000000 00000000 c00f470c b6c56681 
00000000 0000db80 00000036
[18468.792040] 1fa0: c000e964 c000e7e0 b6c56681 00000000 0000000c 
c01864b0 bec49760 bec49760
[18468.800204] 1fc0: b6c56681 00000000 0000db80 00000036 00000000 
00000000 b6fdefac 00000000
[18468.808368] 1fe0: b6b8f16c bec4970c b6b80b1b b6d77b2c 60010010 
0000000c 00000000 00000000
[18468.816540] [<c02c290c>] (drm_vblank_put) from [<c02de3d8>] 
(tegra_dc_irq+0x11c/0x130)
[18468.824448] [<c02de3d8>] (tegra_dc_irq) from [<00000020>] (0x20)
[18468.830449] Code: eaf6bd1f e12fff1e e1a00003 eafffcba (e7f001f2)
[18468.836537] ---[ end trace 86b115e153764395 ]---
[18468.841148] Kernel panic - not syncing: Fatal exception in interrupt
[18468.847550] CPU1: stopping
[18468.850261] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D    O 
3.18.0-00029-g0924e632ef58 #2780
[18468.859309] [<c0015ff4>] (unwind_backtrace) from [<c0011a00>] 
(show_stack+0x10/0x14)
[18468.867050] [<c0011a00>] (show_stack) from [<c0638130>] 
(dump_stack+0x98/0xd0)
[18468.874265] [<c0638130>] (dump_stack) from [<c0014808>] 
(handle_IPI+0x148/0x15c)
[18468.881652] [<c0014808>] (handle_IPI) from [<c00087c8>] 
(gic_handle_irq+0x58/0x5c)
[18468.889215] [<c00087c8>] (gic_handle_irq) from [<c0012540>] 
(__irq_svc+0x40/0x74)
[18468.896684] Exception stack(0xee08df60 to 0xee08dfa8)
[18468.901731] df60: 00000000 c08e4e10 00000013 00000009 00000001 
ee7a8ec8 026ecc15 000010cc
[18468.909896] df80: 15d2bbf9 000010cc c08d4b00 c0641ea8 fffffff8 
ee08dfa8 c0434cdc c0434ce8
[18468.918059] dfa0: 60000113 ffffffff
[18468.921551] [<c0012540>] (__irq_svc) from [<c0434ce8>] 
(cpuidle_enter_state+0x6c/0xe8)
[18468.929463] [<c0434ce8>] (cpuidle_enter_state) from [<c0058010>] 
(cpu_startup_entry+0x250/0x29c)
[18468.938239] [<c0058010>] (cpu_startup_entry) from [<80008864>] 
(0x80008864)
[18468.945190] CPU2: stopping
[18468.947900] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D    O 
3.18.0-00029-g0924e632ef58 #2780
[18468.956946] [<c0015ff4>] (unwind_backtrace) from [<c0011a00>] 
(show_stack+0x10/0x14)
[18468.964685] [<c0011a00>] (show_stack) from [<c0638130>] 
(dump_stack+0x98/0xd0)
[18468.971900] [<c0638130>] (dump_stack) from [<c0014808>] 
(handle_IPI+0x148/0x15c)
[18468.979287] [<c0014808>] (handle_IPI) from [<c00087c8>] 
(gic_handle_irq+0x58/0x5c)
[18468.986851] [<c00087c8>] (gic_handle_irq) from [<c0012540>] 
(__irq_svc+0x40/0x74)
[18468.994321] Exception stack(0xee0adf60 to 0xee0adfa8)
[18468.999368] df60: 00000000 c08e4e10 00000013 00000009 00000001 
ee7b2ec8 026e176b 000010cc
[18469.007533] df80: 15d2c27c 000010cc c08d4b00 c0641ea8 fffffff8 
ee0adfa8 c0434cdc c0434ce8
[18469.015695] dfa0: 60000113 ffffffff
[18469.019188] [<c0012540>] (__irq_svc) from [<c0434ce8>] 
(cpuidle_enter_state+0x6c/0xe8)
[18469.027098] [<c0434ce8>] (cpuidle_enter_state) from [<c0058010>] 
(cpu_startup_entry+0x250/0x29c)
[18469.035874] [<c0058010>] (cpu_startup_entry) from [<80008864>] 
(0x80008864)
[18469.042824] CPU3: stopping
[18469.045536] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D    O 
3.18.0-00029-g0924e632ef58 #2780
[18469.054580] [<c0015ff4>] (unwind_backtrace) from [<c0011a00>] 
(show_stack+0x10/0x14)
[18469.062319] [<c0011a00>] (show_stack) from [<c0638130>] 
(dump_stack+0x98/0xd0)
[18469.069534] [<c0638130>] (dump_stack) from [<c0014808>] 
(handle_IPI+0x148/0x15c)
[18469.076922] [<c0014808>] (handle_IPI) from [<c00087c8>] 
(gic_handle_irq+0x58/0x5c)
[18469.084484] [<c00087c8>] (gic_handle_irq) from [<c0012540>] 
(__irq_svc+0x40/0x74)
[18469.091954] Exception stack(0xee0aff60 to 0xee0affa8)
[18469.096999] ff60: 00000000 c08e4e10 00000013 00000009 00000001 
ee7bcec8 c555ae21 000010ca
[18469.105164] ff80: 15d2d2c2 000010cc c08d4b00 c0641ea8 fffffff8 
ee0affa8 c0434cdc c0434ce8
[18469.113326] ffa0: 60000113 ffffffff
[18469.116819] [<c0012540>] (__irq_svc) from [<c0434ce8>] 
(cpuidle_enter_state+0x6c/0xe8)
[18469.124728] [<c0434ce8>] (cpuidle_enter_state) from [<c0058010>] 
(cpu_startup_entry+0x250/0x29c)
[18469.133503] [<c0058010>] (cpu_startup_entry) from [<80008864>] 
(0x80008864)
[18469.140454] drm_kms_helper: panic occurred, switching back to text 
console
[18469.147327] ---[ end Kernel panic - not syncing: Fatal exception in 
interrupt
