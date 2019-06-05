From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
Date: Wed,  5 Jun 2019 15:26:13 +0300
Message-ID: <20190605122613.21303-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
macro has no effect for the OF drivers since the alias is overridden by
the drivers core to follow the OF naming convention of the driver's alias,
which is based on the device-tree matching name.

$ cat /sys/devices/soc0/7000e000.rtc/modalias
of:NrtcT(null)Cnvidia,tegra20-rtc

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/rtc/rtc-tegra.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 8bbaea24926e..8fa1b3febf69 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -419,5 +419,4 @@ module_platform_driver(tegra_rtc_driver);
 
 MODULE_AUTHOR("Jon Mayo <jmayo@nvidia.com>");
 MODULE_DESCRIPTION("driver for Tegra internal RTC");
-MODULE_ALIAS("platform:tegra_rtc");
 MODULE_LICENSE("GPL");
-- 
2.21.0
