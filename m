From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] usb: chipidea: tegra: Use aligned DMA on Tegra30
Date: Tue, 19 Dec 2017 05:58:07 +0300
Message-ID: <c574aabe51fa67e9a4bb9dc959c64ec6dcb232f1.1513651763.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

USB Ethernet gadget now works on Tegra30.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 7b65a1040d2c..7f4d2b6af37a 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -29,7 +29,7 @@ static const struct tegra_udc_soc_info tegra20_udc_soc_info = {
 };
 
 static const struct tegra_udc_soc_info tegra30_udc_soc_info = {
-	.flags = 0,
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
 };
 
 static const struct tegra_udc_soc_info tegra114_udc_soc_info = {
-- 
2.15.1
