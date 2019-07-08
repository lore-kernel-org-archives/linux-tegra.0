From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [REGRESSION] ubifs: Don't leak orphans on memory during commit
Date: Mon, 8 Jul 2019 13:05:10 +0000
Message-ID: <3e2b525c8c0d9e3ebe13fcfe7b28cc0d3b203d64.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Language: en-US
Content-ID: <C77934ED65982F4EAC77EAA10446A1BE@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "richard@sigma-star.at" <richard@sigma-star.at>
List-Id: linux-tegra@vger.kernel.org

Hi there

I'm currently investigating a strange UBIFS rootfs crash issue seen on
Colibri T20 aka on top of the tegra_nand driver. I bisected it to the
following commit c16e73587ad6 ("ubifs: Don't leak orphans on memory
during commit") and indeed just reverting that one even on top of
today's latest -next makes it work again. The following is what I get
during boot if that commit is included:

[   14.443253] 8<--- cut here ---
[   14.446515] Unable to handle kernel paging request at virtual
address 6b6b6b6b
[   14.453779] pgd = 021022d0
[   14.456535] [6b6b6b6b] *pgd=00000000
[   14.460131] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[   14.465488] Modules linked in:
[   14.468612] CPU: 1 PID: 311 Comm: lxdm-binary Not tainted 5.2.0-rc7-
next-20190704-dirty #24
[   14.477030] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   14.483377] PC is at ubifs_delete_orphan+0x7c/0xd4
[   14.488215] LR is at 0x6b6b6b6b
[   14.491397] pc : [<c03e26f0>]    lr : [<6b6b6b6b>]    psr: 600f0113
[   14.497715] sp : d1da1ee8  ip : d1de4ac0  fp : d27b29b8
[   14.502985] r10: 00000002  r9 : d23396cc  r8 : 00000000
[   14.508260] r7 : d23390ac  r6 : d2339000  r5 : 000063d8  r4 :
d1de4a80
[   14.514841] r3 : 6b6b6b6b  r2 : f344aa0d  r1 : 1213d000  r0 :
d1de4a80
[   14.521426] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  
ISA ARM  Segment none
[   14.528619] Control: 10c5387d  Table: 11f2404a  DAC: 00000051
[   14.534421] Process lxdm-binary (pid: 311, stack limit = 0x3e65b56c)
[   14.540829] Stack: (0xd1da1ee8 to 0xd1da2000)
[   14.545247] 1ee0:                   d27b29b8 d2339000 00000000
d23390ac 00000000 ffffff9c
[   14.553510] 1f00: 00000002 c03ca804 d27b29b8 d2339000 00000000
00000000 00000000 c03d1f90
[   14.561772] 1f20: d27b29b8 d27b2a70 c0b24f68 d1da1f68 00000000
c028ed8c d27a2648 00000000
[   14.570036] 1f40: d1f83000 c0283b34 d1da1f68 d1da1f58 600d0013
c1004c48 00000000 00000000
[   14.578300] 1f60: d2c86010 d25baaa8 1af1325a 0000000c d1f83019
d1da1ed4 00000000 f344aa0d
[   14.586563] 1f80: 0000ecd4 0000ecd4 00000000 0000b1e4 0000000a
c0101204 d1da0000 0000000a
[   14.594826] 1fa0: 00000000 c0101000 0000ecd4 00000000 0000f5cc
bed86e64 bed86e6c 0000ae15
[   14.603087] 1fc0: 0000ecd4 00000000 0000b1e4 0000000a 00000000
00000000 b6f2efac 00000000
[   14.611350] 1fe0: b6da17c0 bed86c14 0000b095 b6da17cc 600d0010
0000f5cc 00000000 00000000
[   14.619648] [<c03e26f0>] (ubifs_delete_orphan) from [<c03ca804>]
(ubifs_jnl_delete_inode+0xdc/0xe0)
[   14.628801] [<c03ca804>] (ubifs_jnl_delete_inode) from [<c03d1f90>]
(ubifs_evict_inode+0x78/0xf4)
[   14.637774] [<c03d1f90>] (ubifs_evict_inode) from [<c028ed8c>]
(evict+0x98/0x168)
[   14.645350] [<c028ed8c>] (evict) from [<c0283b34>]
(do_unlinkat+0x228/0x298)
[   14.652483] [<c0283b34>] (do_unlinkat) from [<c0101000>]
(ret_fast_syscall+0x0/0x54)
[   14.660294] Exception stack(0xd1da1fa8 to 0xd1da1ff0)
[   14.665408] 1fa0:                   0000ecd4 00000000 0000f5cc
bed86e64 bed86e6c 0000ae15
[   14.673669] 1fc0: 0000ecd4 00000000 0000b1e4 0000000a 00000000
00000000 b6f2efac 00000000
[   14.681919] 1fe0: b6da17c0 bed86c14 0000b095 b6da17cc
[   14.687038] Code: e1a01004 e1a00006 ebffff80 e594301c (e413201c)
[   14.693353] ---[ end trace f81be27f6c9911d4 ]---

Has anybody any clue what may be going on? If you need any more
information do let me know.

Thanks!

Cheers

Marcel
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
