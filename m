From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] usb: chipidea: tegra: Fix missed ci_hdrc_remove_device()
Date: Sun, 24 Feb 2019 18:36:22 +0300
Message-ID: <20190224153622.8877-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The ChipIdea's platform device need to be unregistered on Tegra's driver
module removal.

Fixes: dfebb5f43a78827a ("usb: chipidea: Add support for Tegra20/30/114/124")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 772851bee99b..12025358bb3c 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -130,6 +130,7 @@ static int tegra_udc_remove(struct platform_device *pdev)
 {
 	struct tegra_udc *udc = platform_get_drvdata(pdev);
 
+	ci_hdrc_remove_device(udc->dev);
 	usb_phy_set_suspend(udc->phy, 1);
 	clk_disable_unprepare(udc->clk);
 
-- 
2.20.1
