From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 5/7] soc/tegra: pmc: Register sub-devices of PMC
Date: Tue, 12 Apr 2016 20:26:45 +0530
Message-ID: <1460473007-11535-6-git-send-email-ldewangan@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Register sub devices of the PMC to support multiple functionalities
of PMC.
The sub devices are the subnode of PMC DT node with containing the
compatible string of sub devices as follows:

        pmc@0,7000e400 {
		pmc-pad-control {
			compatible = "nvidia,tegra210-io-pad";
			::
		};
	};

In this pmc-pad-control is the sub device of PMC and the device
compatibility is nvidia,tegra210-io-pad.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 968f7cb..c044f3b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -32,6 +32,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/of_platform.h>
 #include <linux/reboot.h>
 #include <linux/reset.h>
 #include <linux/seq_file.h>
@@ -1002,6 +1003,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	pmc->base = base;
 	mutex_unlock(&pmc->powergates_lock);
 
+	err = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (err < 0)
+		dev_err(&pdev->dev,
+			"Failed to register PMC Sub module driver: %d\n", err);
+
 	return 0;
 }
 
-- 
2.1.4
