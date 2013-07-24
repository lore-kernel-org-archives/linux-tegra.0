From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] regulator: palmas: fix pdata ptr not be updated after it has been allocated
Date: Wed, 24 Jul 2013 12:28:02 -0400
Message-ID: <1374683282-17517-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The pmic platform data wasn't updated to dev.platform_data after it had
been allocated. That can cause the driver crash when using it.
This patch fixes the issue.

We need to update the pdata pointer at the end of probe because if
probe should fail for some reason, for instance if an in-supply
isn't ready yet, then probe will defer. However, the pdata is allocated
with devm, and so is freed when probe is deferred.

Based on work by Joseph Lo.

Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/palmas-regulator.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index d0c8785..e11b762 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -1027,6 +1027,8 @@ static int palmas_regulators_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Store the pdata pointer after everything else passes */
+	pdev->dev.platform_data = pdata;
 
 	return 0;
 
-- 
1.7.9.5
