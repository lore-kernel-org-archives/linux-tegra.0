From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] phy: tegra: xusb: fix typo in tegra186_usb2_pad_probe()
Date: Thu, 21 Mar 2019 08:54:36 +0000
Message-ID: <20190321085436.94975-1-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Fix a typo in tegra186_usb2_pad_probe(), 'usb2->clk' should be
'priv->usb2_trk_clk'.

Fixes: b8998e928030 ("phy: tegra: xusb: Add Tegra186 support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 11ad6e4e4711..a627fe0b8e54 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -467,8 +467,8 @@ tegra186_usb2_pad_probe(struct tegra_xusb_padctl *padctl,
 	}
 
 	priv->usb2_trk_clk = devm_clk_get(&pad->dev, "trk");
-	if (IS_ERR(usb2->clk)) {
-		err = PTR_ERR(usb2->clk);
+	if (IS_ERR(priv->usb2_trk_clk)) {
+		err = PTR_ERR(priv->usb2_trk_clk);
 		dev_dbg(&pad->dev, "failed to get usb2 trk clock: %d\n", err);
 		goto unregister;
 	}
