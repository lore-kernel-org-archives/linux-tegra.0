From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clocksource: tegra: Maintain CPU endianness
Date: Wed, 18 Mar 2015 18:44:49 +0300
Message-ID: <1426693503-6056-1-git-send-email-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Support big-endian kernel by using endian-aware register access functions.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/tegra20_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/tegra20_timer.c b/drivers/clocksource/tegra20_timer.c
index d2616ef..d8a3a4e 100644
--- a/drivers/clocksource/tegra20_timer.c
+++ b/drivers/clocksource/tegra20_timer.c
@@ -57,9 +57,9 @@ static u64 persistent_ms, last_persistent_ms;
 static struct delay_timer tegra_delay_timer;
 
 #define timer_writel(value, reg) \
-	__raw_writel(value, timer_reg_base + (reg))
+	writel_relaxed(value, timer_reg_base + (reg))
 #define timer_readl(reg) \
-	__raw_readl(timer_reg_base + (reg))
+	readl_relaxed(timer_reg_base + (reg))
 
 static int tegra_timer_set_next_event(unsigned long cycles,
 					 struct clock_event_device *evt)
-- 
2.3.2
