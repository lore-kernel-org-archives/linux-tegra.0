From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] firmware: tegra: set drvdata earlier
Date: Thu, 17 Aug 2017 12:49:11 +0300
Message-ID: <1502963351-2855-1-git-send-email-talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Subdevices of bpmp, such as bpmp-i2c, require the bpmp device's
drvdata to be set during their probe. Currently this is not always the
case. Fix this by calling platform_set_drvdata() earlier during bpmp's
probe.

Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/firmware/tegra/bpmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index b251795..73ca55b 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -806,6 +806,8 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "firmware: %s\n", tag);
 
+	platform_set_drvdata(pdev, bpmp);
+
 	err = of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->dev);
 	if (err < 0)
 		goto free_mrq;
@@ -822,8 +824,6 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto free_mrq;
 
-	platform_set_drvdata(pdev, bpmp);
-
 	return 0;
 
 free_mrq:
-- 
2.7.4
