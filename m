From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/4] i2c: tegra: Support DVC controller in device tree
Date: Sat, 17 Dec 2011 23:29:30 -0700
Message-ID: <1324189772-26914-2-git-send-email-swarren@nvidia.com>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324189772-26914-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

One of the Tegra I2C blocks is inside the DVC (Digital Voltage Controller)
block. This block is identical to the rest of the I2C blocks, except that
it only supports master mode, it has registers moved around, and it needs
some extra init to get it into I2C mode.  The register moves are handled
by i2c_readl and i2c_writel

This patch adds a new compatible value for controllers of this "DVC"
type; I figured that this approach was reasonable, as opposed to adding
an is-dvc property under the existing compatible value, since the HW
truly is different.

v2: Call of_device_is_compatible() to determine is_dvc, instead of storing
the flag in tegra_i2c_of_match[]'s .data field.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e8560ed..6381604 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -636,7 +636,10 @@ static int __devinit tegra_i2c_probe(struct platform_device *pdev)
 			i2c_dev->bus_clk_rate = be32_to_cpup(prop);
 	}
 
-	if (pdev->id == 3)
+	if (pdev->dev.of_node)
+		i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
+						"nvidia,tegra20-i2c-dvc");
+	else if (pdev->id == 3)
 		i2c_dev->is_dvc = 1;
 	init_completion(&i2c_dev->msg_complete);
 
@@ -742,6 +745,7 @@ static int tegra_i2c_resume(struct platform_device *pdev)
 /* Match table for of_platform binding */
 static const struct of_device_id tegra_i2c_of_match[] __devinitconst = {
 	{ .compatible = "nvidia,tegra20-i2c", },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
-- 
1.7.5.4
