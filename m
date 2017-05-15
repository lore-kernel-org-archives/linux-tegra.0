From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] gpu: host1x: Forbid RESTART opcode in the firewall
Date: Mon, 15 May 2017 15:02:15 +0300
Message-ID: <20170515120215.28273-1-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The RESTART opcode terminates the gather and restarts the CDMA fetch from
a specified word << 2 relative to the CDMA start address. That shouldn't
be allowed to be done by userspace.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/host1x/job.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 8f0d43b8f9a6..d648748b3e74 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -493,7 +493,6 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
 				goto out;
 			break;
 		case 4:
-		case 5:
 		case 14:
 			break;
 		default:
-- 
2.13.0
