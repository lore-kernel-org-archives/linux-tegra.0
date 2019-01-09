From: Prateek Patel <prpatel@nvidia.com>
Subject: [PATCH] selinux: avc: mark avc node as not a leak
Date: Wed, 9 Jan 2019 14:09:22 +0530
Message-ID: <1547023162-6381-1-git-send-email-prpatel@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: paul@paul-moore.com, sds@tycho.nsa.gov, eparis@parisplace.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, selinux@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, swarren@nvidia.com, prpatel@nvidia.com, linux-mm@kvack.org, snikam@nvidia.com, vdumpa@nvidia.com, Sri Krishna chowdary <schowdary@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Sri Krishna chowdary <schowdary@nvidia.com>

kmemleak detects allocated objects as leaks if not accessed for
default scan time. The memory allocated using avc_alloc_node
is freed using rcu mechanism when nodes are reclaimed or on
avc_flush. So, there is no real leak here and kmemleak_scan
detects it as a leak which is false positive. Hence, mark it as
kmemleak_not_leak.

Following is the log for avc_alloc_node detected as leak:
unreferenced object 0xffffffc0dd1a0e60 (size 64):
  comm "InputDispatcher", pid 648, jiffies 4294944629 (age 698.180s)
  hex dump (first 32 bytes):
    ed 00 00 00 ed 00 00 00 17 00 00 00 3f fe 41 00  ............?.A.
    00 00 00 00 ff ff ff ff 01 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffc000192390>] __save_stack_trace+0x24/0x34
    [<ffffffc000192dcc>] create_object+0x13c/0x290
    [<ffffffc000b926f0>] kmemleak_alloc+0x80/0xbc
    [<ffffffc00018e018>] kmem_cache_alloc+0x128/0x1f8
    [<ffffffc000313d40>] avc_alloc_node+0x2c/0x1e8
    [<ffffffc000313f34>] avc_insert+0x38/0x13c
    [<ffffffc000314084>] avc_compute_av+0x4c/0x60
    [<ffffffc00031461c>] avc_has_perm_flags+0x90/0x188
    [<ffffffc000319430>] sock_has_perm+0x84/0x98
    [<ffffffc0003194e4>] selinux_socket_sendmsg+0x1c/0x28
    [<ffffffc000312f58>] security_socket_sendmsg+0x14/0x20
    [<ffffffc0009c60c4>] sock_sendmsg+0x70/0xc8
    [<ffffffc0009c8884>] SyS_sendto+0x140/0x1ec
    [<ffffffc0000853c0>] el0_svc_naked+0x34/0x38
    [<ffffffffffffffff>] 0xffffffffffffffff

Signed-off-by: Sri Krishna chowdary <schowdary@nvidia.com>
Signed-off-by: Prateek <prpatel@nvidia.com>
---
 security/selinux/avc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index 635e5c1..ecfd0cd 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -30,6 +30,7 @@
 #include <linux/audit.h>
 #include <linux/ipv6.h>
 #include <net/ipv6.h>
+#include <linux/kmemleak.h>
 #include "avc.h"
 #include "avc_ss.h"
 #include "classmap.h"
@@ -573,6 +574,7 @@ static struct avc_node *avc_alloc_node(struct selinux_avc *avc)
 	if (!node)
 		goto out;
 
+	kmemleak_not_leak(node);
 	INIT_HLIST_NODE(&node->list);
 	avc_cache_stats_incr(allocations);
 
-- 
2.7.4
