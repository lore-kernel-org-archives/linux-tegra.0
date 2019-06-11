From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V5 4/7] i2c: tegra: add spinlock definition comment
Date: Tue, 11 Jun 2019 03:51:11 -0700
Message-ID: <1560250274-18499-4-git-send-email-bbiswas@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Fix checkpatch.pl CHECK as follows:
CHECK: spinlock_t definition without comment
+       spinlock_t xfer_lock;

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2d381de..bececa6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -269,6 +269,7 @@ struct tegra_i2c_dev {
 	u32 bus_clk_rate;
 	u16 clk_divisor_non_hs_mode;
 	bool is_multimaster_mode;
+	/* xfer_lock: lock to serialize transfer submission and processing */
 	spinlock_t xfer_lock;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
-- 
2.7.4
