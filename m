From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v6 2/4] thermal: tegra: fix memory allocation
Date: Fri, 14 Dec 2018 17:49:51 +0800
Message-ID: <1544780993-20744-3-git-send-email-wni@nvidia.com>
References: <1544780993-20744-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544780993-20744-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, srikars@nvidia.com, linux-kernel@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix memory allocation to store the pointers to
thermal_zone_device.

Signed-off-by: Wei Ni <wni@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/thermal/tegra/soctherm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index f07de8258e93..fd2703c0cfc5 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1339,7 +1339,7 @@ static int tegra_soctherm_probe(struct platform_device *pdev)
 	}
 
 	tegra->thermctl_tzs = devm_kcalloc(&pdev->dev,
-					   soc->num_ttgs, sizeof(*z),
+					   soc->num_ttgs, sizeof(z),
 					   GFP_KERNEL);
 	if (!tegra->thermctl_tzs)
 		return -ENOMEM;
-- 
2.7.4
