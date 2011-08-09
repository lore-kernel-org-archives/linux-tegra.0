From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 07/13] ARM: gpio: pnx4008: convert drivers to use asm/gpio.h
 rather than mach/gpio.h
Date: Tue, 09 Aug 2011 09:06:41 +0100
Message-ID: <E1QqhKj-0003aP-Dc@rmk-PC.arm.linux.org.uk>
References: <20110809080411.GA1831@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20110809080411.GA1831@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Nicolas Pitre <nico@fluxnic.net>Grant Likely <grant.likely@secretlab.ca>Nicolas Pitre <nico@fluxnic.net>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
---
 drivers/usb/host/ohci-pnx4008.c |    2 +-
 drivers/video/pnx4008/sdum.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-pnx4008.c b/drivers/usb/host/ohci-pnx4008.c
index 653d6a6..d1b4193 100644
--- a/drivers/usb/host/ohci-pnx4008.c
+++ b/drivers/usb/host/ohci-pnx4008.c
@@ -26,7 +26,7 @@
 
 #include <mach/platform.h>
 #include <mach/irqs.h>
-#include <mach/gpio.h>
+#include <asm/gpio.h>
 
 #define USB_CTRL	IO_ADDRESS(PNX4008_PWRMAN_BASE + 0x64)
 
diff --git a/drivers/video/pnx4008/sdum.c b/drivers/video/pnx4008/sdum.c
index 5ec4f2d..50e0039 100644
--- a/drivers/video/pnx4008/sdum.c
+++ b/drivers/video/pnx4008/sdum.c
@@ -30,7 +30,7 @@
 #include <linux/clk.h>
 #include <linux/gfp.h>
 #include <asm/uaccess.h>
-#include <mach/gpio.h>
+#include <asm/gpio.h>
 
 #include "sdum.h"
 #include "fbcommon.h"
-- 
1.7.4.4

