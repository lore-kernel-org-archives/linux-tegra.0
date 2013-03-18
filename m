From: Venu Byravarasu <vbyravarasu@nvidia.com>
Subject: [PATCH 4/7] usb: phy: tegra: Return correct error value provided by clk_get_sys
Date: Mon, 18 Mar 2013 17:59:38 +0530
Message-ID: <1363609781-4045-5-git-send-email-vbyravarasu@nvidia.com>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Venu Byravarasu <vbyravarasu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

In case if clk_get_sys fails, return correct error value provided by
the API.

Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com>
---
 drivers/usb/phy/tegra_usb_phy.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/tegra_usb_phy.c b/drivers/usb/phy/tegra_usb_phy.c
index 93abd68..b5b2037 100644
--- a/drivers/usb/phy/tegra_usb_phy.c
+++ b/drivers/usb/phy/tegra_usb_phy.c
@@ -620,8 +620,7 @@ static int	tegra_phy_init(struct usb_phy *x)
 		phy->clk = clk_get_sys(NULL, ulpi_config->clk);
 		if (IS_ERR(phy->clk)) {
 			pr_err("%s: can't get ulpi clock\n", __func__);
-			err = -ENXIO;
-			goto err1;
+			return PTR_ERR(phy->clk);
 		}
 		if (!gpio_is_valid(ulpi_config->reset_gpio))
 			ulpi_config->reset_gpio =
-- 
1.7.0.4
