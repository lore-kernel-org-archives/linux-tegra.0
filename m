From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] usb: chipidea: tegra: Use aligned DMA on Tegra114/124
Date: Mon, 25 Jun 2018 09:58:43 +0200
Message-ID: <20180625075843.31878-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Peter Chen <Peter.Chen@nxp.com>, Marcel Ziswiler <marcel@ziswiler.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-tegra@vger.kernel.org

USB Ethernet gadget now works on Tegra114 and Tegra124.

Similar to commit 061e20e9899e ("usb: chipidea: tegra: Use aligned DMA
on Tegra30").

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/usb/chipidea/ci_hdrc_tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 7f4d2b6af37a..772851bee99b 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -33,11 +33,11 @@ static const struct tegra_udc_soc_info tegra30_udc_soc_info = {
 };
 
 static const struct tegra_udc_soc_info tegra114_udc_soc_info = {
-	.flags = 0,
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
 };
 
 static const struct tegra_udc_soc_info tegra124_udc_soc_info = {
-	.flags = 0,
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
 };
 
 static const struct of_device_id tegra_udc_of_match[] = {
-- 
2.14.4
