From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] media: staging: tegra-vde: Use devm_platform_ioremap_resource_byname()
Date: Mon,  2 Mar 2020 20:29:04 +0300
Message-ID: <20200302172904.460-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There is a new devm_platform_ioremap_resource_byname() helper in the
kernel now, which helps to make code cleaner a tad by replacing few
"boilerplate" lines of code with a single line. Let's utilize that
new helper in the VDE driver.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changelog:

v2: Updated commit's message to make it more informative, as was requested
    by Dan Carpenter in the review comment to v1.

 drivers/staging/media/tegra-vde/vde.c | 55 +++++----------------------
 1 file changed, 9 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index e18fd48981da..d3e63512a765 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -949,7 +949,6 @@ static int tegra_vde_runtime_resume(struct device *dev)
 static int tegra_vde_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *regs;
 	struct tegra_vde *vde;
 	int irq, err;
 
@@ -959,75 +958,39 @@ static int tegra_vde_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vde);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sxe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->sxe = devm_ioremap_resource(dev, regs);
+	vde->sxe = devm_platform_ioremap_resource_byname(pdev, "sxe");
 	if (IS_ERR(vde->sxe))
 		return PTR_ERR(vde->sxe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "bsev");
-	if (!regs)
-		return -ENODEV;
-
-	vde->bsev = devm_ioremap_resource(dev, regs);
+	vde->bsev = devm_platform_ioremap_resource_byname(pdev, "bsev");
 	if (IS_ERR(vde->bsev))
 		return PTR_ERR(vde->bsev);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mbe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->mbe = devm_ioremap_resource(dev, regs);
+	vde->mbe = devm_platform_ioremap_resource_byname(pdev, "mbe");
 	if (IS_ERR(vde->mbe))
 		return PTR_ERR(vde->mbe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ppe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->ppe = devm_ioremap_resource(dev, regs);
+	vde->ppe = devm_platform_ioremap_resource_byname(pdev, "ppe");
 	if (IS_ERR(vde->ppe))
 		return PTR_ERR(vde->ppe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mce");
-	if (!regs)
-		return -ENODEV;
-
-	vde->mce = devm_ioremap_resource(dev, regs);
+	vde->mce = devm_platform_ioremap_resource_byname(pdev, "mce");
 	if (IS_ERR(vde->mce))
 		return PTR_ERR(vde->mce);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tfe");
-	if (!regs)
-		return -ENODEV;
-
-	vde->tfe = devm_ioremap_resource(dev, regs);
+	vde->tfe = devm_platform_ioremap_resource_byname(pdev, "tfe");
 	if (IS_ERR(vde->tfe))
 		return PTR_ERR(vde->tfe);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ppb");
-	if (!regs)
-		return -ENODEV;
-
-	vde->ppb = devm_ioremap_resource(dev, regs);
+	vde->ppb = devm_platform_ioremap_resource_byname(pdev, "ppb");
 	if (IS_ERR(vde->ppb))
 		return PTR_ERR(vde->ppb);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vdma");
-	if (!regs)
-		return -ENODEV;
-
-	vde->vdma = devm_ioremap_resource(dev, regs);
+	vde->vdma = devm_platform_ioremap_resource_byname(pdev, "vdma");
 	if (IS_ERR(vde->vdma))
 		return PTR_ERR(vde->vdma);
 
-	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "frameid");
-	if (!regs)
-		return -ENODEV;
-
-	vde->frameid = devm_ioremap_resource(dev, regs);
+	vde->frameid = devm_platform_ioremap_resource_byname(pdev, "frameid");
 	if (IS_ERR(vde->frameid))
 		return PTR_ERR(vde->frameid);
 
-- 
2.25.1
