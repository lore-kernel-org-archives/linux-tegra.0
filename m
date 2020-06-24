From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/4] media: staging: tegra-vde: Runtime PM is always available on Tegra
Date: Wed, 24 Jun 2020 18:08:45 +0300
Message-ID: <20200624150847.22672-3-digetx@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200624150847.22672-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Runtime PM is always available on Tegra nowadays since commit 40b2bb1b132a
("ARM: tegra: enforce PM requirement"), hence the case of unavailable RPM
doesn't need to be handled.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/media/tegra-vde/vde.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 803e5dda4bb5..85cbbc8f70d3 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1068,17 +1068,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 300);
 
-	if (!pm_runtime_enabled(dev)) {
-		err = tegra_vde_runtime_resume(dev);
-		if (err)
-			goto err_misc_unreg;
-	}
-
 	return 0;
 
-err_misc_unreg:
-	misc_deregister(&vde->miscdev);
-
 err_deinit_iommu:
 	tegra_vde_iommu_deinit(vde);
 
@@ -1093,13 +1084,6 @@ static int tegra_vde_remove(struct platform_device *pdev)
 {
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
-	int err;
-
-	if (!pm_runtime_enabled(dev)) {
-		err = tegra_vde_runtime_suspend(dev);
-		if (err)
-			return err;
-	}
 
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
-- 
2.26.0
