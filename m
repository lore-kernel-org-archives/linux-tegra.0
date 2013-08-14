From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 22/29] host1x/{dev.c,drm/hdmi.c}: simplify use of devm_ioremap_resource
Date: Wed, 14 Aug 2013 11:11:26 +0200
Message-ID: <1376471493-22215-23-git-send-email-Julia.Lawall@lip6.fr>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel-janitors@vger.kernel.org, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource when the value is passed to devm_ioremap_resource.

Move the call to platform_get_resource adjacent to the call to
devm_ioremap_resource to make the connection between them more clear.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, IORESOURCE_MEM, n);
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/host1x/dev.c      |    7 +------
 drivers/gpu/host1x/drm/hdmi.c |    3 ---
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 28e28a2..e615edd 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -98,12 +98,6 @@ static int host1x_probe(struct platform_device *pdev)
 	if (!id)
 		return -EINVAL;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(&pdev->dev, "failed to get registers\n");
-		return -ENXIO;
-	}
-
 	syncpt_irq = platform_get_irq(pdev, 0);
 	if (syncpt_irq < 0) {
 		dev_err(&pdev->dev, "failed to get IRQ\n");
@@ -120,6 +114,7 @@ static int host1x_probe(struct platform_device *pdev)
 	/* set common host1x device data */
 	platform_set_drvdata(pdev, host);
 
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host->regs = devm_ioremap_resource(&pdev->dev, regs);
 	if (IS_ERR(host->regs))
 		return PTR_ERR(host->regs);
diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
index 01097da..9ffece6 100644
--- a/drivers/gpu/host1x/drm/hdmi.c
+++ b/drivers/gpu/host1x/drm/hdmi.c
@@ -1248,9 +1248,6 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 		return err;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs)
-		return -ENXIO;
-
 	hdmi->regs = devm_ioremap_resource(&pdev->dev, regs);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
