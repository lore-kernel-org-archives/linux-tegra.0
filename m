From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v4 05/14] i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
Date: Thu, 23 Jul 2020 16:51:03 -0700
Message-ID: <1595548272-9809-6-git-send-email-skomatineni@nvidia.com>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

VI I2C is on host1x bus so APB DMA can't be used for Tegra210 VI
I2C and there are no tx and rx dma channels for VI I2C.

So, avoid attempt of requesting DMA channels.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 1bf3666..00d3e4d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -421,7 +421,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_addr_t dma_phys;
 	int err;
 
-	if (!i2c_dev->hw->has_apb_dma)
+	if (!i2c_dev->hw->has_apb_dma || i2c_dev->is_vi)
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
-- 
2.7.4
