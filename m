From: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: bus: Add missing of_node_put
Date: Sun, 24 Jan 2016 22:02:10 +0530
Message-ID: <20160124163210.GA24872@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
// </smpl>

Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4a99c64..c1795a2 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -82,8 +82,10 @@ static int host1x_device_parse_dt(struct host1x_device *device,
 		if (of_match_node(driver->subdevs, np) &&
 		    of_device_is_available(np)) {
 			err = host1x_subdev_add(device, np);
-			if (err < 0)
+			if (err < 0) {
+				of_node_put(np);
 				return err;
+			}
 		}
 	}
 
-- 
1.9.1
