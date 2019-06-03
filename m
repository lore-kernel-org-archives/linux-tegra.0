From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 10/10] clocksource/drivers/tegra: Rename timer-tegra20.c to timer-tegra.c
Date: Mon,  3 Jun 2019 21:59:48 +0300
Message-ID: <20190603185948.30438-11-digetx@gmail.com>
References: <20190603185948.30438-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603185948.30438-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Rename driver's source file to better reflect that it's not specific to
older SoC generations.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/Makefile                           | 2 +-
 drivers/clocksource/{timer-tegra20.c => timer-tegra.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clocksource/{timer-tegra20.c => timer-tegra.c} (100%)

diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 236858fa7fbf..4145b21eaed3 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -36,7 +36,7 @@ obj-$(CONFIG_U300_TIMER)	+= timer-u300.o
 obj-$(CONFIG_SUN4I_TIMER)	+= timer-sun4i.o
 obj-$(CONFIG_SUN5I_HSTIMER)	+= timer-sun5i.o
 obj-$(CONFIG_MESON6_TIMER)	+= timer-meson6.o
-obj-$(CONFIG_TEGRA_TIMER)	+= timer-tegra20.o
+obj-$(CONFIG_TEGRA_TIMER)	+= timer-tegra.o
 obj-$(CONFIG_VT8500_TIMER)	+= timer-vt8500.o
 obj-$(CONFIG_NSPIRE_TIMER)	+= timer-zevio.o
 obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
diff --git a/drivers/clocksource/timer-tegra20.c b/drivers/clocksource/timer-tegra.c
similarity index 100%
rename from drivers/clocksource/timer-tegra20.c
rename to drivers/clocksource/timer-tegra.c
-- 
2.21.0
