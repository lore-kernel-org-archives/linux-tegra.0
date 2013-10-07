From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 07/27] gpu: host1x: Do not discard .remove()
Date: Mon,  7 Oct 2013 10:34:24 +0200
Message-ID: <1381134884-5816-8-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The device can be unbound from the driver via sysfs, so regardless of
whether the driver is builtin or a module, its .remove() function needs
to stick around.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/dev.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 0f7b44c..105aa4e 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -172,7 +172,7 @@ fail_deinit_syncpt:
 	return err;
 }
 
-static int __exit host1x_remove(struct platform_device *pdev)
+static int host1x_remove(struct platform_device *pdev)
 {
 	struct host1x *host = platform_get_drvdata(pdev);
 
@@ -184,13 +184,12 @@ static int __exit host1x_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver tegra_host1x_driver = {
-	.probe = host1x_probe,
-	.remove = __exit_p(host1x_remove),
 	.driver = {
-		.owner = THIS_MODULE,
 		.name = "tegra-host1x",
 		.of_match_table = host1x_of_match,
 	},
+	.probe = host1x_probe,
+	.remove = host1x_remove,
 };
 
 static int __init tegra_host1x_init(void)
-- 
1.8.4
