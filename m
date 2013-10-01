From: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] regulator: tps65090: remove usage of IS_ERR_OR_NULL
Date: Tue,  1 Oct 2013 09:41:04 +0530
Message-ID: <1380600664-20649-1-git-send-email-badarkhe.manish@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch changes the driver to avoid the usage of IS_ERR_OR_NULL()
macro.

The case present in this patch simply translates to normal check for pointer,
wheather it is NULL or has an error code.

Signed-off-by: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
:100644 100644 bd611cdf.. ad3d4d4... M	drivers/regulator/tps65090-regulator.c
 drivers/regulator/tps65090-regulator.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps65090-regulator.c b/drivers/regulator/tps65090-regulator.c
index bd611cdf..ad3d4d4 100644
--- a/drivers/regulator/tps65090-regulator.c
+++ b/drivers/regulator/tps65090-regulator.c
@@ -245,7 +245,7 @@ static int tps65090_regulator_probe(struct platform_device *pdev)
 	if (!tps65090_pdata && tps65090_mfd->dev->of_node)
 		tps65090_pdata = tps65090_parse_dt_reg_data(pdev,
 					&tps65090_reg_matches);
-	if (IS_ERR_OR_NULL(tps65090_pdata)) {
+	if (!tps65090_pdata || IS_ERR(tps65090_pdata)) {
 		dev_err(&pdev->dev, "Platform data missing\n");
 		return tps65090_pdata ? PTR_ERR(tps65090_pdata) : -EINVAL;
 	}
-- 
1.7.10.4
