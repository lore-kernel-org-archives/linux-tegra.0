From: Peng Fan <van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging: nvec: remove duplicated const
Date: Tue, 16 Jun 2015 23:13:21 +0800
Message-ID: <1434467601-3290-1-git-send-email-van.freenix@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org, marvin24-Mmb7MZpHnFY@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Sparse checking warning:
"drivers/staging/nvec/nvec_ps2.c:172:14: warning: duplicate const".
Remove the duplicated const to fix the warning.

Signed-off-by: Peng Fan <van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/nvec/nvec_ps2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 6ebbc82..0922dd3 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -169,8 +169,8 @@ static int nvec_mouse_resume(struct device *dev)
 }
 #endif
 
-static const SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
-				nvec_mouse_resume);
+static SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
+			 nvec_mouse_resume);
 
 static struct platform_driver nvec_mouse_driver = {
 	.probe  = nvec_mouse_probe,
-- 
1.8.4
