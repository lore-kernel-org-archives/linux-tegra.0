From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Oops on Tegra30 with CPU Process: 1
Date: Tue, 08 Apr 2014 16:32:36 +0200
Message-ID: <53440884.7010304@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi there

I have the following Toradex Colibri T30 modules with different ATE prog 
versions, Tegra30 SKUs as well as CPU process numbers:

Colibri T30 V1.1B (working)

[    0.000000] fuse_speedo_calib: ATE prog ver 3.6
[    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
[    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 2 Core Process: 0

Colibri T30 V1.1C (below crash)

[    0.000000] fuse_speedo_calib: ATE prog ver 3.7
[    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
[    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core Process: 0

[    0.000000] fuse_speedo_calib: ATE prog ver 3.7 

[    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2 

[    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core Process: 
0

Colibri T30 V1.1D (working)

[    0.000000] Tegra30: Unknown SKU 177
[    0.000000] fuse_speedo_calib: ATE prog ver 4.0
[    0.000000] Tegra30: CPU Speedo ID 0, Soc Speedo ID 0
[    0.000000] Tegra Revision: A03 SKU: 177 CPU Process: 2 Core Process: 0

While the ones with a process number of 2 seem to run stable, the ones 
with a process number of 1 crash with the following Oops during Linux 
3.14.0 boot:

[    3.489409] Unable to handle kernel paging request at virtual address 
2d7ff000
[    3.489737] Unable to handle kernel paging request at virtual address 
2d807000
[    3.489741] pgd = ed284000
[    3.489745] [2d807000] *pgd=00000000
[    3.489753] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    3.489758] Modules linked in:
[    3.489766] CPU: 3 PID: 106 Comm: systemd-udevd Not tainted 
3.14.0-dirty #1
[    3.489770] task: edb51180 ti: ed27e000 task.ti: ed27e000
[    3.489796] PC is at cpuacct_charge+0x30/0x58
[    3.489800] LR is at cpuacct_charge+0x1c/0x58
[    3.489804] pc : [<c00604f8>]    lr : [<c00604e4>]    psr: a00f0093
[    3.489804] sp : ed27fc50  ip : 2d807000  fp : ed27fd14
[    3.489806] r10: 00000001  r9 : 00000000  r8 : 015ef4be
[    3.489809] r7 : 00000003  r6 : c07def74  r5 : 00000000  r4 : 0004e9d0
[    3.489811] r3 : 00000000  r2 : edbe6900  r1 : 00000000  r0 : 02ba2690
[    3.489816] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment user
[    3.489818] Control: 10c5387d  Table: ad28404a  DAC: 00000015
[    3.489824] Process systemd-udevd (pid: 106, stack limit = 0xed27e240)
[    3.489828] Stack: (0xed27fc50 to 0xed280000)
[    3.489832] fc40:                                     00000000 
0004e9d0 00000000 edb511c8
[    3.489837] fc60: ed0e4440 c004f944 c0051790 059a4f98 00000000 
edb511c8 00000001 ed0e4440
[    3.489842] fc80: 00000138 c0051a38 edfdbc40 c057a768 00000001 
edfdbc88 00000001 edfdbc88
[    3.489847] fca0: 00036718 00000000 edfdbc40 edb5150c 00000001 
edfdbc40 ed27e000 edfdbc40
[    3.489851] fcc0: edb51180 059a4f98 00000000 059a4f98 00000000 
00000000 00000000 edb51180
[    3.489856] fce0: ed27fd14 c00482f0 00000001 edfdbc40 ed27fd94 
edb5150c 00000003 edfdbc40
[    3.489860] fd00: ed27e000 edb51180 c07d4c40 edb51180 ed27fdb4 
c05734a8 00000127 00000000
[    3.489865] fd20: cfe9d480 00000003 00000002 00000002 0000009f 
c07d4c40 c07d4c40 c07d4c40
[    3.489869] fd40: 00019000 00000000 00000000 00000000 00000001 
00000000 ed27fe20 ed552980
[    3.489874] fd60: ed27fda4 c07eb598 ed27e000 ed217dc8 200f0013 
c07eb598 ed27e000 ed217dc8
[    3.489878] fd80: 200f0013 00000000 ed67a320 c0863580 ee59cf40 
ed27e000 c07eb59c 200f0013
[    3.489883] fda0: ed27e000 ffffffff c07eb5a0 edb51180 ed27fdc4 
c0573bb8 00000001 c07eb598
[    3.489888] fdc0: c082a48c c0575e90 c07eb5a0 ed289dc8 edb51180 
ed27fdc8 ed27fef0 c07eb598
[    3.489893] fde0: 00000001 ed836a08 00000000 00000000 ed1be029 
ed27e000 ed27fef0 c05760b8
[    3.489897] fe00: ed54c1a8 c0128d24 ed54c1a8 ed27fef8 ed27fe48 
c00de20c 00000000 c00e85f0
[    3.489902] fe20: ed1be02a ed1be02a ed27fef8 c00de500 ffffff9c 
00000000 ed07cb40 c00ce8a8
[    3.489907] fe40: 00000000 ed54c1a8 ed026b50 ed54aaa8 000080d0 
c00d61bc 2a2877e9 00000007
[    3.489911] fe60: ed1be022 c07eab00 ed1be000 ed07cb40 ed27fef0 
ed27ff74 ed1be000 ed27e000
[    3.489916] fe80: 00000000 00000000 00000000 c00e1918 ed27fea8 
c0863580 ee5937c0 c00cf658
[    3.489920] fea0: ed026b50 ed67a328 00000000 00000000 ed026b50 
ed67a328 ed1be000 ed831240
[    3.489925] fec0: ed86cb80 ed27ff74 00000001 ed1be000 ffffff9c 
c000e8a4 ed27e000 00000000
[    3.489929] fee0: be9ebbcc c00e2150 00000041 c00e2098 ed026b50 
ed54aaa8 2a2877e9 00000007
[    3.489934] ff00: ed1be022 c07eab00 ed837d50 ed4e3148 ed54c1a8 
00000011 00000002 0000005c
[    3.489938] ff20: 00000000 00000000 00000006 ed999380 ed999388 
00000000 00000400 c00ed734
[    3.489943] ff40: 000a0000 000a0000 ed1be000 ffffff9c 00000005 
00000006 ed1be000 ffffff9c
[    3.489947] ff60: 00000005 c00d433c ed27ff74 00000000 00000000 
00020000 00000000 00000024
[    3.489952] ff80: 00000100 00000001 be9efe34 00040658 0002ad22 
00000008 00000005 c000e8a4
[    3.489956] ffa0: 00000000 c000e720 00040658 0002ad22 be9ebc14 
000a0000 000001b6 000001b6
[    3.489960] ffc0: 00040658 0002ad22 00000008 00000005 00000000 
0003b040 0003c038 be9ebbcc
[    3.489965] ffe0: 00000000 be9ebb6c b6e1d630 b6e6e51c 600f0010 
be9ebc14 e18460e1 c8e5acf3
[    3.489988] [<c00604f8>] (cpuacct_charge) from [<c004f944>] 
(update_curr+0xcc/0x120)
[    3.489993] Unable to handle kernel paging request at virtual address 
2d7ef000
[    3.489998] [<c004f944>] (update_curr) from [<c0051a38>] 
(dequeue_task_fair+0x2a8/0x7ac)
[    3.490000] pgd = ed104000
[    3.490009] [<c0051a38>] (dequeue_task_fair) from [<c00482f0>] 
(dequeue_task+0xb8/0xc0)
[    3.490012] [2d7ef000] *pgd=00000000
[    3.490031] [<c00482f0>] (dequeue_task) from [<c05734a8>] 
(__schedule+0x384/0x67c)
[    3.490040] [<c05734a8>] (__schedule) from [<c0573bb8>] 
(schedule_preempt_disabled+0x24/0x34)
[    3.490049] [<c0573bb8>] (schedule_preempt_disabled) from 
[<c0575e90>] (__mutex_lock_slowpath+0x180/0x39c)
[    3.490054] [<c0575e90>] (__mutex_lock_slowpath) from [<c05760b8>] 
(mutex_lock+0xc/0x24)
[    3.490060] [<c05760b8>] (mutex_lock) from [<c0128d24>] 
(kernfs_iop_permission+0x20/0x50)
[    3.490078] [<c0128d24>] (kernfs_iop_permission) from [<c00de20c>] 
(__inode_permission+0x60/0x90)
[    3.490086] [<c00de20c>] (__inode_permission) from [<c00de500>] 
(link_path_walk+0x5c/0x7cc)
[    3.490093] [<c00de500>] (link_path_walk) from [<c00e1918>] 
(path_openat+0x8c/0x5c4)
[    3.490101] [<c00e1918>] (path_openat) from [<c00e2150>] 
(do_filp_open+0x2c/0x80)
[    3.490116] [<c00e2150>] (do_filp_open) from [<c00d433c>] 
(do_sys_open+0x10c/0x1c8)
[    3.490131] [<c00d433c>] (do_sys_open) from [<c000e720>] 
(ret_fast_syscall+0x0/0x30)
[    3.490138] Code: e59f602c e5932024 e796c107 e5923040 (e18300dc)
[    3.490145] Internal error: Oops: 5 [#2] PREEMPT SMP ARM
[    3.490147] ---[ end trace 2406b5229141b355 ]---
[    3.490150] Modules linked in:
[    3.490154] note: systemd-udevd[106] exited with preempt_count 2
[    3.490159] CPU: 0 PID: 80 Comm: systemd-udevd Tainted: G      D 
  3.14.0-dirty #1
[    3.490162] task: ed042c80 ti: ed0a2000 task.ti: ed0a2000
[    3.490168] PC is at cpuacct_charge+0x30/0x58
[    3.490172] LR is at cpuacct_charge+0x1c/0x58
[    3.490175] pc : [<c00604f8>]    lr : [<c00604e4>]    psr: a00f0093
[    3.490175] sp : ed0a3c40  ip : 2d7ef000  fp : ed0a3d04
[    3.490178] r10: 00000001  r9 : 00000000  r8 : 03071f4e
[    3.490180] r7 : 00000000  r6 : c07def74  r5 : 00000000  r4 : 000f1748
[    3.490182] r3 : 00000000  r2 : edbe6900  r1 : 00000000  r0 : 03830470
[    3.490185] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment user
[    3.490188] Control: 10c5387d  Table: ad10404a  DAC: 00000015
[    3.490190] Process systemd-udevd (pid: 80, stack limit = 0xed0a2240)
[    3.490192] Stack: (0xed0a3c40 to 0xed0a4000)
[    3.490198] 3c40: 00000000 000f1748 00000000 ed042cc8 ed0e4680 
c004f944 c0051790 082845a8
[    3.490203] 3c60: 00000000 ed042cc8 00000001 ed0e4680 00000138 
c0051a38 000000c1 edbef398
[    3.490207] 3c80: 00000001 edbef3a4 00000000 00000000 00036718 
00000000 edfc3c40 ed04300c
[    3.490212] 3ca0: 00000001 edfc3c40 ed0a2000 edfc3c40 ed042c80 
082845a8 00000000 082845a8
[    3.490216] 3cc0: 00000000 00000000 00000000 ed042c80 ed0a3d04 
c00482f0 00000001 edfc3c40
[    3.490221] 3ce0: 00000000 ed04300c 00000000 edfc3c40 ed0a2000 
ed042c80 c07d4c40 ed042c80
[    3.490226] 3d00: ed0a3da4 c05734a8 ffffeff4 ffffeff4 00000000 
ed0a3d7c ed108c00 c0863580
[    3.490230] 3d20: ed0fd140 c07d4c40 c07d4c40 c07d4c40 0000007c 
00000000 ed0a3e88 be9f755c
[    3.490235] 3d40: 00000000 ed0699f8 600f0013 00000001 00000001 
00000000 ed0a3e20 ed52fac0
[    3.490239] 3d60: ed0a3da4 c005a78c 00000002 c00995b8 ed11cdd8 
00000001 ed11ceac 00000000
[    3.490244] 3d80: 00000003 ed0a2000 c07eb59c 200f0013 ed0a2000 
ffffffff c07eb5a0 ed042c80
[    3.490249] 3da0: ed0a3db4 c0573bb8 00000001 c07eb598 c082a48c 
c0575e90 c07eb5a0 ed27fdc8
[    3.490253] 3dc0: ed042c80 ed0a3db8 200f0013 c07eb598 ed836b28 
ed0a3e44 00000001 ed541748
[    3.490257] 3de0: 00000001 ed026b50 ed0a3ef0 c05760b8 ed541748 
c01293b8 ed0a3e48 ed0a3ef0
[    3.490262] 3e00: ed0a3e44 c00dd9a8 ed0a3e48 00000000 ed210022 
ed0a3ef8 ed0a3e48 00000000
[    3.490266] 3e20: 00000000 ed210021 ed0a2000 c00de624 ffffff9c 
00000000 ed056cc0 c00ce8a8
[    3.490271] 3e40: ed0a7840 ed53f768 ed026b50 ed53e508 000080d0 
c00d61bc abd93a06 00000008
[    3.490276] 3e60: ed210019 c07eab00 ed210000 ed056cc0 ed0a3ef0 
ed0a3f74 ed210000 ed0a2000
[    3.490280] 3e80: 00000000 00000000 00000000 c00e1918 ed0a3ea8 
0000002d 00000003 ed11ce48
[    3.490285] 3ea0: ed0a2000 c0575b74 00000000 00000000 00000000 
0000002d 00000000 c009afd8
[    3.490289] 3ec0: 00000010 ed0a3f74 00000001 ed210000 ffffff9c 
c000e8a4 ed0a2000 00000000
[    3.490294] 3ee0: be9f5114 c00e2150 00000041 b6f93000 ed026b50 
ed53e508 abd93a06 00000008
[    3.490298] 3f00: ed210019 c07eab00 ed837d50 ed4e3148 ed53f768 
00000011 00000002 0000005c
[    3.490303] 3f20: 00000000 00000000 0000000d ed86fa40 ed86fa48 
00000000 00000400 c00ed734
[    3.490307] 3f40: 000a0000 000a0000 ed210000 ffffff9c 00000005 
0000000d ed210000 ffffff9c
[    3.490312] 3f60: 00000005 c00d433c 00000000 ed0a7840 ed0a7840 
00020000 b6f90000 00000024
[    3.490316] 3f80: 00000100 00000001 00000001 0004da10 0002ad22 
00000008 00000005 c000e8a4
[    3.490320] 3fa0: 00000000 c000e720 0004da10 0002ad22 be9f515c 
000a0000 000001b6 000001b6
[    3.490325] 3fc0: 0004da10 0002ad22 00000008 00000005 00000000 
0004e220 0003b040 be9f5114
[    3.490330] 3fe0: 00000000 be9f50b4 b6e1d630 b6e6e51c 600f0010 
be9f515c ae7f6821 ae7f6c21
[    3.490339] [<c00604f8>] (cpuacct_charge) from [<c004f944>] 
(update_curr+0xcc/0x120)
[    3.490345] [<c004f944>] (update_curr) from [<c0051a38>] 
(dequeue_task_fair+0x2a8/0x7ac)
[    3.490353] [<c0051a38>] (dequeue_task_fair) from [<c00482f0>] 
(dequeue_task+0xb8/0xc0)
[    3.490362] [<c00482f0>] (dequeue_task) from [<c05734a8>] 
(__schedule+0x384/0x67c)
[    3.490369] [<c05734a8>] (__schedule) from [<c0573bb8>] 
(schedule_preempt_disabled+0x24/0x34)
[    3.490376] [<c0573bb8>] (schedule_preempt_disabled) from 
[<c0575e90>] (__mutex_lock_slowpath+0x180/0x39c)
[    3.490381] [<c0575e90>] (__mutex_lock_slowpath) from [<c05760b8>] 
(mutex_lock+0xc/0x24)
[    3.490388] [<c05760b8>] (mutex_lock) from [<c01293b8>] 
(kernfs_dop_revalidate+0x28/0xc0)
[    3.490397] [<c01293b8>] (kernfs_dop_revalidate) from [<c00dd9a8>] 
(lookup_fast+0x264/0x2a0)
[    3.490404] [<c00dd9a8>] (lookup_fast) from [<c00de624>] 
(link_path_walk+0x180/0x7cc)
[    3.490411] [<c00de624>] (link_path_walk) from [<c00e1918>] 
(path_openat+0x8c/0x5c4)
[    3.490418] [<c00e1918>] (path_openat) from [<c00e2150>] 
(do_filp_open+0x2c/0x80)
[    3.490427] [<c00e2150>] (do_filp_open) from [<c00d433c>] 
(do_sys_open+0x10c/0x1c8)
[    3.490435] [<c00d433c>] (do_sys_open) from [<c000e720>] 
(ret_fast_syscall+0x0/0x30)
[    3.490440] Code: e59f602c e5932024 e796c107 e5923040 (e18300dc)
[    3.490443] ---[ end trace 2406b5229141b356 ]---
[    3.490447] note: systemd-udevd[80] exited with preempt_count 2
[    4.437984] pgd = ed21c000
[    4.440678] [2d7ff000] *pgd=00000000
[    4.444249] Internal error: Oops: 5 [#3] PREEMPT SMP ARM
[    4.449544] Modules linked in:
[    4.452593] CPU: 2 PID: 98 Comm: systemd-udevd Tainted: G      D 
  3.14.0-dirty #1
[    4.460404] task: ed160740 ti: ed218000 task.ti: ed218000
[    4.465795] PC is at cpuacct_charge+0x30/0x58
[    4.470140] LR is at cpuacct_charge+0x1c/0x58
[    4.474483] pc : [<c00604f8>]    lr : [<c00604e4>]    psr: a00f0193
[    4.474483] sp : ed219d58  ip : 2d7ff000  fp : ed219e34
[    4.485933] r10: ed0e4500  r9 : 00000000  r8 : 0243e12b
[    4.491142] r7 : 00000002  r6 : c07def74  r5 : 00000000  r4 : 0001e460
[    4.497651] r3 : 00000000  r2 : edbe6900  r1 : 00000000  r0 : 035a94e0
[    4.504160] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment user
[    4.511363] Control: 10c5387d  Table: ad21c04a  DAC: 00000015
[    4.517091] Process systemd-udevd (pid: 98, stack limit = 0xed218240)
[    4.523513] Stack: (0xed219d58 to 0xed21a000)
[    4.527857] 9d40: 
    00000000 0001e460
[    4.536015] 9d60: 00000000 ed160788 ed0e4500 c004f944 00000005 
02746323 00000000 00000001
[    4.544172] 9d80: 00000000 ed160d48 000004a8 c0052ad8 00006c00 
00000000 00000050 00000000
[    4.552330] 9da0: ed0dc000 ed219e34 00000000 c07eb598 ed218000 
ed27fda8 600f0013 edfd3c40
[    4.560488] 9dc0: 00000000 00000000 ed5beb48 ed5beb98 00036718 
00000000 ed0912c8 ed160d00
[    4.568647] 9de0: edfd3c40 ed160d00 edfd3c40 edfd3c40 ed0dc000 
cffbe580 00000000 ed160d00
[    4.576803] 9e00: edfd3c40 00000005 ed0dc000 ed0dc000 ed219e34 
c0048340 00000100 ed160d00
[    4.584961] 9e20: edfd3c40 c07d4c40 c07def74 00000fff ed219e44 
c0048e00 00000000 edfd3c40
[    4.593119] 9e40: ed219e54 c0048e8c ed218000 c07d3f00 ed219e74 
c004add4 c0826488 00000002
[    4.601276] 9e60: c07d3f00 00000000 fe440100 00000fff be9f0904 
c00145a8 fe44010c c07df0d4
[    4.609433] 9e80: ed219ea0 c00086cc c00ce884 c00ce680 800f0013 
ffffffff ed219ed4 c0012480
[    4.617590] 9ea0: ed831240 ed0dc000 0000006b 0000006b 00000a73 
00000000 00001000 ed831240
[    4.625748] 9ec0: 00000fff ed0dc000 ed0dc000 be9f0904 c06c7860 
ed219ee8 c00ce884 c00ce680
[    4.633906] 9ee0: 800f0013 ffffffff 00000041 00000000 c00de044 
400f0013 ed831240 ed0dc000
[    4.642064] 9f00: c000e8a4 00000000 00000000 c00ce884 ee591b80 
c00cf658 ed831240 400f0013
[    4.650222] 9f20: 000000d0 c00de044 c000e8a4 c00cf474 c07defdc 
000a0000 0002ad22 be9f094c
[    4.658380] 9f40: 00000005 c00de044 000a0000 0002ad22 ffffff9c 
00000005 c000e8a4 ed218000
[    4.666537] 9f60: 00000000 c00d430c be9f9600 be9f9600 0004d2a8 
00020000 c0000000 00000024
[    4.674693] 9f80: 00000100 00000001 00000000 0003c038 0002ad22 
00000008 00000005 c000e8a4
[    4.682851] 9fa0: 00000000 c000e720 0003c038 0002ad22 be9f094c 
000a0000 000001b6 000001b6
[    4.691007] 9fc0: 0003c038 0002ad22 00000008 00000005 00000000 
0003b040 0004e488 be9f0904
[    4.699165] 9fe0: 00000000 be9f08a4 b6e1d630 b6e6e51c 600f0010 
be9f094c a9e02073 148d9a10
[    4.707331] [<c00604f8>] (cpuacct_charge) from [<c004f944>] 
(update_curr+0xcc/0x120)
[    4.715057] [<c004f944>] (update_curr) from [<c0052ad8>] 
(enqueue_task_fair+0x5c/0xce8)
[    4.723046] [<c0052ad8>] (enqueue_task_fair) from [<c0048340>] 
(enqueue_task+0x48/0x4c)
[    4.731035] [<c0048340>] (enqueue_task) from [<c0048e00>] 
(ttwu_do_activate.constprop.73+0x2c/0x60)
[    4.740061] [<c0048e00>] (ttwu_do_activate.constprop.73) from 
[<c0048e8c>] (sched_ttwu_pending+0x58/0x70)
[    4.749609] [<c0048e8c>] (sched_ttwu_pending) from [<c004add4>] 
(scheduler_ipi+0x40/0x10c)
[    4.757858] [<c004add4>] (scheduler_ipi) from [<c00145a8>] 
(handle_IPI+0xc8/0x160)
[    4.765411] [<c00145a8>] (handle_IPI) from [<c00086cc>] 
(gic_handle_irq+0x54/0x5c)
[    4.772971] [<c00086cc>] (gic_handle_irq) from [<c0012480>] 
(__irq_svc+0x40/0x70)
[    4.780433] Exception stack(0xed219ea0 to 0xed219ee8)
[    4.785471] 9ea0: ed831240 ed0dc000 0000006b 0000006b 00000a73 
00000000 00001000 ed831240
[    4.793629] 9ec0: 00000fff ed0dc000 ed0dc000 be9f0904 c06c7860 
ed219ee8 c00ce884 c00ce680
[    4.801783] 9ee0: 800f0013 ffffffff
[    4.805266] [<c0012480>] (__irq_svc) from [<c00ce680>] 
(check_poison_obj+0x3c/0x1d4)
[    4.812992] [<c00ce680>] (check_poison_obj) from [<c00ce884>] 
(cache_alloc_debugcheck_after.isra.57+0x6c/0x1b8)
[    4.823058] [<c00ce884>] (cache_alloc_debugcheck_after.isra.57) from 
[<c00cf474>] (kmem_cache_alloc+0xa4/0x138)
[    4.833127] [<c00cf474>] (kmem_cache_alloc) from [<c00de044>] 
(getname_flags+0x20/0x110)
[    4.841202] [<c00de044>] (getname_flags) from [<c00d430c>] 
(do_sys_open+0xdc/0x1c8)
[    4.848842] [<c00d430c>] (do_sys_open) from [<c000e720>] 
(ret_fast_syscall+0x0/0x30)
[    4.856566] Code: e59f602c e5932024 e796c107 e5923040 (e18300dc)
[    4.862646] ---[ end trace 2406b5229141b357 ]---
[    4.867249] Kernel panic - not syncing: Fatal exception in interrupt
[    4.873973] CPU1: stopping
[    4.876673] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D 
3.14.0-dirty #1
[    4.884062] [<c0015cc4>] (unwind_backtrace) from [<c0011948>] 
(show_stack+0x10/0x14)
[    4.891793] [<c0011948>] (show_stack) from [<c05711f4>] 
(dump_stack+0x80/0xcc)
[    4.899000] [<c05711f4>] (dump_stack) from [<c0014614>] 
(handle_IPI+0x134/0x160)
[    4.906378] [<c0014614>] (handle_IPI) from [<c00086cc>] 
(gic_handle_irq+0x54/0x5c)
[    4.913930] [<c00086cc>] (gic_handle_irq) from [<c0012480>] 
(__irq_svc+0x40/0x70)
[    4.921392] Exception stack(0xed89ff60 to 0xed89ffa8)
[    4.926430] ff60: ed89ffa8 3b9aca00 222fa4b8 00000001 d398d6a8 
00000000 edfcb088 00000001
[    4.934587] ff80: 00000000 c057a28c 00000001 00000000 fffffff5 
ed89ffa8 c0071a28 c039229c
[    4.942741] ffa0: 60000113 ffffffff
[    4.946232] [<c0012480>] (__irq_svc) from [<c039229c>] 
(cpuidle_enter_state+0x50/0xe8)
[    4.954133] [<c039229c>] (cpuidle_enter_state) from [<c03923f0>] 
(cpuidle_idle_call+0xbc/0x174)
[    4.962813] [<c03923f0>] (cpuidle_idle_call) from [<c000f314>] 
(arch_cpu_idle+0x8/0x38)
[    4.970806] [<c000f314>] (arch_cpu_idle) from [<c0066ef4>] 
(cpu_startup_entry+0x60/0x134)
[    4.978968] [<c0066ef4>] (cpu_startup_entry) from [<80008764>] 
(0x80008764)
[    5.985728] SMP: failed to stop secondary CPUs
[    5.990158] drm_kms_helper: panic occurred, switching back to text 
console

Anybody observed similar issues?

What exactly do those SoC speedo, CPU process and core process numbers 
indicate?

If any further information is required just let me know.

Cheers

Marcel
