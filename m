From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 08/10] clocksource/drivers/tegra: Support COMPILE_TEST universally
Date: Mon,  3 Jun 2019 21:59:46 +0300
Message-ID: <20190603185948.30438-9-digetx@gmail.com>
References: <20190603185948.30438-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603185948.30438-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Remove build dependency on ARM for compile-testing to allow non-arch
specific build-bots (like Intel's test robot) to compile the driver and
report about problems.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 3300739edce4..d17a347e813a 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -140,7 +140,7 @@ config TEGRA_TIMER
 	bool "Tegra timer driver" if COMPILE_TEST
 	select CLKSRC_MMIO
 	select TIMER_OF
-	depends on ARM || ARM64
+	depends on ARCH_TEGRA || COMPILE_TEST
 	help
 	  Enables support for the Tegra driver.
 
-- 
2.21.0
