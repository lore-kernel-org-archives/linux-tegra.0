From: Saurabh Sengar <saurabh.truth@gmail.com>
Subject: [PATCH] gpu: host1x: mipi: Added missing mutex_unlock
Date: Mon,  7 Dec 2015 01:22:58 +0530
Message-ID: <1449431578-6998-1-git-send-email-saurabh.truth@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, tbergstrom@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Saurabh Sengar <saurabh.truth@gmail.com>
List-Id: linux-tegra@vger.kernel.org

In case of error too function should return after releasing the mutex

Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
---
 drivers/gpu/host1x/mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 52a6fd2..6e559a9 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -250,6 +250,7 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device)
 			dev_err(dev->mipi->dev,
 				"failed to power up MIPI bricks: %d\n",
 				err);
+			mutex_unlock(&dev->mipi->lock);
 			return ERR_PTR(err);
 		}
 	}
-- 
1.9.1
