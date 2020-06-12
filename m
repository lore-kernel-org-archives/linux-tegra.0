From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] usb: xhci: tegra: Remove PLL power supplies
Date: Fri, 12 Jun 2020 16:02:05 +0200
Message-ID: <20200612140205.2342900-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra XUSB controller driver doesn't need to control the PLL power
supplies directly, but rather uses the pads provided by the XUSB pad
controller, which in turn is responsible for supplying power to the
PLLs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/xhci-tegra.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 2eaf5c0af80c..9ce28ab47f4b 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1853,11 +1853,7 @@ static const char * const tegra124_supply_names[] = {
 	"avddio-pex",
 	"dvddio-pex",
 	"avdd-usb",
-	"avdd-pll-utmip",
-	"avdd-pll-erefe",
-	"avdd-usb-ss-pll",
 	"hvdd-usb-ss",
-	"hvdd-usb-ss-pll-e",
 };
 
 static const struct tegra_xusb_phy_type tegra124_phy_types[] = {
@@ -1931,10 +1927,6 @@ static const char * const tegra210_supply_names[] = {
 	"dvddio-pex",
 	"hvddio-pex",
 	"avdd-usb",
-	"avdd-pll-utmip",
-	"avdd-pll-uerefe",
-	"dvdd-pex-pll",
-	"hvdd-pex-pll-e",
 };
 
 static const struct tegra_xusb_phy_type tegra210_phy_types[] = {
-- 
2.24.1
