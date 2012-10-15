From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH REPOST] usb: phy: tegra remove include of <mach/iomap.h>
Date: Mon, 15 Oct 2012 12:16:36 -0600
Message-ID: <1350324996-30838-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Almost nothing from this file is used, and the file will hopefully be
deleted soon. Copy the tiny portions that are used directly into
tegra_usb_phy.c. I believe that Venu Byravarasu is working on cleaning up
our USB driver, and those cleanups will remove the need for these
constants.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Felipe, Greg,

This patch is needed in the Tegra branch, since it's a dependency for
cleanup required to support single zImage.

However, I suspect/hope there will be significant improvements to the Tegra
USB driver in 3.8, and this change may merge-conflict with those. It may be
simplest if this patch can /also/ be taken through the USB tree and so act
as a baseline for any Tegra USB work.

As such, may I please request this patch be merged into a separate branch/tag
in the USB tree, which is then merged into both the Tegra and USB trees.

Thanks.
---
 drivers/usb/phy/tegra_usb_phy.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/phy/tegra_usb_phy.c b/drivers/usb/phy/tegra_usb_phy.c
index 987116f..9d13c81 100644
--- a/drivers/usb/phy/tegra_usb_phy.c
+++ b/drivers/usb/phy/tegra_usb_phy.c
@@ -29,7 +29,9 @@
 #include <linux/usb/ulpi.h>
 #include <asm/mach-types.h>
 #include <linux/usb/tegra_usb_phy.h>
-#include <mach/iomap.h>
+
+#define TEGRA_USB_BASE		0xC5000000
+#define TEGRA_USB_SIZE		SZ_16K
 
 #define ULPI_VIEWPORT		0x170
 
-- 
1.7.0.4
