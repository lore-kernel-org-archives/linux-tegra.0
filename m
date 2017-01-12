From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] rtc: tegra: Sort includes alphabetically
Date: Thu, 12 Jan 2017 17:07:42 +0100
Message-ID: <20170112160743.23367-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The ordering of includes is currently completely arbitrary, making it
impossible to decide where to put new includes. Remove the dilemma by
sort the include list alphabetically.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/rtc/rtc-tegra.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 3853ba963bb5..38e662ff1a70 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -17,16 +17,17 @@
  * with this program; if not, write to the Free Software Foundation, Inc.,
  * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
  */
-#include <linux/kernel.h>
+
+#include <linux/delay.h>
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/delay.h>
-#include <linux/rtc.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
 
 /* set to 1 = busy every eight 32kHz clocks during copy of sec+msec to AHB */
 #define TEGRA_RTC_REG_BUSY			0x004
-- 
2.11.0
