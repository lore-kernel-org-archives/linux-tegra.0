From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 3/4] phy: tegra: use regulator_bulk_set_supply_names()
Date: Fri, 30 Aug 2019 09:17:39 +0200
Message-ID: <20190830071740.4267-4-brgl@bgdev.pl>
References: <20190830071740.4267-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830071740.4267-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new regulator helper instead of a for loop.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/phy/tegra/xusb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 2ea8497af82a..faf1137d1432 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -862,7 +862,6 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	struct tegra_xusb_padctl *padctl;
 	const struct of_device_id *match;
 	struct resource *res;
-	unsigned int i;
 	int err;
 
 	/* for backwards compatibility with old device trees */
@@ -907,8 +906,9 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	for (i = 0; i < padctl->soc->num_supplies; i++)
-		padctl->supplies[i].supply = padctl->soc->supply_names[i];
+	regulator_bulk_set_supply_names(padctl->supplies,
+					padctl->soc->supply_names,
+					padctl->soc->num_supplies);
 
 	err = devm_regulator_bulk_get(&pdev->dev, padctl->soc->num_supplies,
 				      padctl->supplies);
-- 
2.21.0
