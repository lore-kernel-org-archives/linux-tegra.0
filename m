From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 05/25] clockevents/drivers/tegra20: Remove obsolete inclusion of <asm/smp_twd.h>
Date: Tue, 18 Dec 2018 22:28:23 +0100
Message-ID: <20181218212844.30445-5-daniel.lezcano@linaro.org>
References: <d3f1255a-592d-13d9-5d3f-bd3ec7a36742@linaro.org>
 <20181218212844.30445-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218212844.30445-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

As of commit da4a686a2cfb077a ("ARM: smp_twd: convert to use CLKSRC_OF
init"), this header file is no longer used.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/tegra20_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index aa624885e0e2..4293943f4e2b 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -30,7 +30,6 @@
 #include <linux/delay.h>
 
 #include <asm/mach/time.h>
-#include <asm/smp_twd.h>
 
 #define RTC_SECONDS            0x08
 #define RTC_SHADOW_SECONDS     0x0c
-- 
2.17.1
