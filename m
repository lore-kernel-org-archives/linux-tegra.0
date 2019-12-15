From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/3] media: staging: tegra-vde: Use __maybe_unused attribute instead of ifdef
Date: Sun, 15 Dec 2019 21:07:52 +0300
Message-ID: <20191215180752.5408-4-digetx@gmail.com>
References: <20191215180752.5408-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215180752.5408-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Replace #ifdef with __maybe_unused attribute just to keep code cleaner a
tad.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 3466daddf663..e18fd48981da 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1150,8 +1150,7 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra_vde_pm_suspend(struct device *dev)
+static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
 	int err;
@@ -1165,7 +1164,7 @@ static int tegra_vde_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_vde_pm_resume(struct device *dev)
+static __maybe_unused int tegra_vde_pm_resume(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
 	int err;
@@ -1178,7 +1177,6 @@ static int tegra_vde_pm_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops tegra_vde_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_vde_runtime_suspend,
-- 
2.24.0
