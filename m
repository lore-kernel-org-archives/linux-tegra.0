From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 8/8] clocksource/drivers/tegra: Support COMPILE_TEST universally
Date: Fri, 24 May 2019 18:32:53 +0300
Message-ID: <20190524153253.28564-9-digetx@gmail.com>
References: <20190524153253.28564-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524153253.28564-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Remove build dependency on ARM for compile-testing to allow non-arch
specific build-bots (like Intel's test robot) to compile the driver and
report about problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 3300739edce4..8c21e557181b 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -137,10 +137,10 @@ config SUN5I_HSTIMER
 	  Enables support the Sun5i timer.
 
 config TEGRA_TIMER
-	bool "Tegra timer driver" if COMPILE_TEST
+	bool "Tegra timer driver"
 	select CLKSRC_MMIO
 	select TIMER_OF
-	depends on ARM || ARM64
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  Enables support for the Tegra driver.
 
-- 
2.21.0
