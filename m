From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] firmware: tegra-bpmp: mark PM function as __maybe_unused
Date: Tue,  2 Oct 2018 23:21:27 +0200
Message-ID: <20181002212208.2971433-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mikko Perttunen <mperttunen@nvidia.com>, Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The newly added tegra_bpmp_resume function is unused when CONFIG_PM
is disabled:

drivers/firmware/tegra/bpmp.c:847:12: error: 'tegra_bpmp_resume' defined but not used [-Werror=unused-function]
 static int tegra_bpmp_resume(struct device *dev)

Mark it as __maybe_unused to avoid the warning and let the compiler
drop it silently.

Fixes: cd40f6ff124c ("firmware: tegra: bpmp: Implement suspend/resume support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/tegra/bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 41448ba78be9..a3d5b518c10e 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -844,7 +844,7 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_bpmp_resume(struct device *dev)
+static int __maybe_unused tegra_bpmp_resume(struct device *dev)
 {
 	struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
 	unsigned int i;
-- 
2.18.0
