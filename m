From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 08:26:03 +0100
Message-ID: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gnurou@gmail.com, ldewangan@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, wsa@the-dreams.de
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

of_match_device could return NULL, and so cause a NULL pointer
dereference later at line 809:
i2c_dev->hw = match->data;

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a0522fc..c803551 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -806,7 +806,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
+
 		match = of_match_device(tegra_i2c_of_match, &pdev->dev);
+		if (!match)
+			return -ENODEV;
 		i2c_dev->hw = match->data;
 		i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						"nvidia,tegra20-i2c-dvc");
-- 
2.4.10
