From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] iommu/tegra: gart: cleanup devm_* functions usage
Date: Tue, 24 Sep 2013 11:40:24 +0800
Message-ID: <CAPgLHd_NAA7ufE=uLLz8kOBB9-Q3w3pckCgRyMVjPFdHq28AHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, Varun.Sethi-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

The devm_[kzalloc|ioremap] functions allocates data that are released
when a driver detaches. Thus, there is no reason to explicitly call
devm_[kfree|iounmap] in probe or remove functions.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/iommu/tegra-gart.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 108c0e9..59ff2fa 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -351,7 +351,6 @@ static int tegra_gart_probe(struct platform_device *pdev)
 	struct gart_device *gart;
 	struct resource *res, *res_remap;
 	void __iomem *gart_regs;
-	int err;
 	struct device *dev = &pdev->dev;
 
 	if (gart_handle)
@@ -376,8 +375,7 @@ static int tegra_gart_probe(struct platform_device *pdev)
 	gart_regs = devm_ioremap(dev, res->start, resource_size(res));
 	if (!gart_regs) {
 		dev_err(dev, "failed to remap GART registers\n");
-		err = -ENXIO;
-		goto fail;
+		return -ENXIO;
 	}
 
 	gart->dev = &pdev->dev;
@@ -391,8 +389,7 @@ static int tegra_gart_probe(struct platform_device *pdev)
 	gart->savedata = vmalloc(sizeof(u32) * gart->page_count);
 	if (!gart->savedata) {
 		dev_err(dev, "failed to allocate context save area\n");
-		err = -ENOMEM;
-		goto fail;
+		return -ENOMEM;
 	}
 
 	platform_set_drvdata(pdev, gart);
@@ -401,27 +398,15 @@ static int tegra_gart_probe(struct platform_device *pdev)
 	gart_handle = gart;
 	bus_set_iommu(&platform_bus_type, &gart_iommu_ops);
 	return 0;
-
-fail:
-	if (gart_regs)
-		devm_iounmap(dev, gart_regs);
-	if (gart && gart->savedata)
-		vfree(gart->savedata);
-	devm_kfree(dev, gart);
-	return err;
 }
 
 static int tegra_gart_remove(struct platform_device *pdev)
 {
 	struct gart_device *gart = platform_get_drvdata(pdev);
-	struct device *dev = gart->dev;
 
 	writel(0, gart->regs + GART_CONFIG);
 	if (gart->savedata)
 		vfree(gart->savedata);
-	if (gart->regs)
-		devm_iounmap(dev, gart->regs);
-	devm_kfree(dev, gart);
 	gart_handle = NULL;
 	return 0;
 }
