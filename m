From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] i2c: tegra: change phrasing, "fallbacking" to "falling back"
Date: Fri, 15 Feb 2019 15:31:26 +0000
Message-ID: <20190215153126.18575-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The phrasing in two dev_err messages is using fallbacking which
os less understandable than "falling back", so fix this up.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a4cd79c9f7a7..5a403c3ab66c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -452,7 +452,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	tegra_i2c_release_dma(i2c_dev);
 	if (err != -EPROBE_DEFER) {
 		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
-		dev_err(i2c_dev->dev, "fallbacking to PIO\n");
+		dev_err(i2c_dev->dev, "falling back to PIO\n");
 		return 0;
 	}
 
@@ -965,7 +965,7 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		if (ret < 0) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
-			dev_err(i2c_dev->dev, "fallbacking to PIO\n");
+			dev_err(i2c_dev->dev, "falling back to PIO\n");
 			tegra_i2c_release_dma(i2c_dev);
 			i2c_dev->is_curr_dma_xfer = false;
 		} else {
-- 
2.20.1
