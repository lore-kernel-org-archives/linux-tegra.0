From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/4] media: staging: tegra-vde: Runtime PM is always available on Tegra
Date: Fri, 15 May 2020 00:08:45 +0300
Message-ID: <20200514210847.9269-3-digetx@gmail.com>
References: <20200514210847.9269-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20200514210847.9269-1-digetx@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Runtime PM is always available on Tegra nowadays since commit 40b2bb1b132a
("ARM: tegra: enforce PM requirement"), hence the case of unavailable RPM
doesn't need to be handled.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
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
