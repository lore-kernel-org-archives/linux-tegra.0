From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] pinctrl: tegra-xusb: Correct lane mux options
Date: Fri, 16 Oct 2015 10:24:01 +0100
Message-ID: <1444987441-25176-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The description of the XUSB_PADCTL_USB3_PAD_MUX_0 register in the Tegra124
documentation implies that all functions (pcie, usb3 and sata) can be
muxed onto to all lanes (pcie lanes 0-4 and sata lane 0). However, it has
been confirmed that this is not the case and the mux'ing options much more
limited. Unfortunately, the public documentation has not been updated to
reflect this and so detail the actual mux'ing options here by function:

Function:		Lanes:
pcie1 x2:		pcie3, pcie4
pcie1 x4:		pcie1, pcie2, pcie3, pcie4
pcie2 x1 (option1):	pcie0
pcie2 x1 (option2):	pcie2
usb3 port 0:		pcie0
usb3 port 1 (option 1):	pcie1
usb3 port 1 (option 2):	sata0
sata:			sata0

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/pinctrl/pinctrl-tegra-xusb.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 2651d04bd1be..84a43e612952 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -760,24 +760,15 @@ static const char * const tegra124_pcie_groups[] = {
 	"pcie-2",
 	"pcie-3",
 	"pcie-4",
-	"sata-0",
 };
 
 static const char * const tegra124_usb3_groups[] = {
 	"pcie-0",
 	"pcie-1",
-	"pcie-2",
-	"pcie-3",
-	"pcie-4",
 	"sata-0",
 };
 
 static const char * const tegra124_sata_groups[] = {
-	"pcie-0",
-	"pcie-1",
-	"pcie-2",
-	"pcie-3",
-	"pcie-4",
 	"sata-0",
 };
 
-- 
2.1.4

