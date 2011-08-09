From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 05/13] ARM: gpio: nomadik: convert drivers to use asm/gpio.h
 rather than mach/gpio.h
Date: Tue, 09 Aug 2011 09:06:01 +0100
Message-ID: <E1QqhK5-0003aG-5F@rmk-PC.arm.linux.org.uk>
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
 drivers/gpio/gpio-nomadik.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 2c212c7..f7f0406 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -28,7 +28,7 @@
 
 #include <plat/pincfg.h>
 #include <mach/hardware.h>
-#include <mach/gpio.h>
+#include <asm/gpio.h>
 
 /*
  * The GPIO module in the Nomadik family of Systems-on-Chip is an
-- 
1.7.4.4

