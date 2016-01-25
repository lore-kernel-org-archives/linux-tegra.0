From: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] memory: tegra: mc: Add missing of_node_put
Date: Mon, 25 Jan 2016 22:53:07 +0530
Message-ID: <20160125172307.GA26190@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so
to break out of the loop an of_node_put is required.

Found using Coccinelle. The semantic patch used for this is as follows:

// <smpl>
@@
expression e;
local idexpression n;
@@

 for_each_child_of_node(..., n) {
   ... when != of_node_put(n)
       when != e = n
(
   return n;
|
+  of_node_put(n);
?  return ...;
)
   ...
 }
// </smpl

Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changes in v2:
        -None

There is also an extra of_node_put() before a continue in the same loop
on line 212 of this file which should be deleted. Julia Lawall has
already sent a patch to delete this but if preferred I can send one patch to 
do both the changes.

 drivers/memory/tegra/mc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a1ae0cc..7dd42e7 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -186,8 +186,10 @@ static int load_timings(struct tegra_mc *mc, struct device_node *node)
 		timing = &mc->timings[i++];
 
 		err = load_one_timing(mc, timing, child);
-		if (err)
+		if (err) {
+			of_node_put(child);
 			return err;
+		}
 	}
 
 	return 0;
@@ -212,9 +214,9 @@ static int tegra_mc_setup_timings(struct tegra_mc *mc)
 		}
 
 		err = load_timings(mc, node);
+		of_node_put(node);
 		if (err)
 			return err;
-		of_node_put(node);
 		break;
 	}
 
-- 
1.9.1
