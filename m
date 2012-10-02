From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] usb: phy: tegra remove include of <mach/iomap.h>
Date: Tue,  2 Oct 2012 16:50:02 -0600
Message-ID: <1349218202-3534-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Almost nothing from this file is used, and the file will hopefully be
deleted soon. Copy the tiny portions that are used directly into
tegra_usb_phy.c. I believe that Venu Byravarasu is working on cleaning up
our USB driver, and those cleanups will remove the need for these
constants.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Felipe, Greg, if this patch can get into 3.7 (it's late, I know) at a point
before wherever you branch off your USB tree for 3.8, then that would be
great. If not, may I please request this patch be merged into a separate
branch/tag that is merged into both the Tegra and USB trees for 3.8, since
I will probably have cleanup patches in the Tegra tree that depend on this
change, and Venu will likely be sending patches through the USB tree that
will need to be merged with this too.
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
