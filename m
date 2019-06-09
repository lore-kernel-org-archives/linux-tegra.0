From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/3] clocksource/drivers/tegra: Drop unneeded typecasting in one place
Date: Sun,  9 Jun 2019 22:27:30 +0300
Message-ID: <20190609192730.29459-4-digetx@gmail.com>
References: <20190609192730.29459-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609192730.29459-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no need to cast void because kernel allows to do that without
a warning message from a compiler.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clocksource/timer-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
index 089c2f51ed40..c208908fa288 100644
--- a/drivers/clocksource/timer-tegra.c
+++ b/drivers/clocksource/timer-tegra.c
@@ -81,7 +81,7 @@ static int tegra_timer_set_periodic(struct clock_event_device *evt)
 
 static irqreturn_t tegra_timer_isr(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
+	struct clock_event_device *evt = dev_id;
 	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
 
 	writel_relaxed(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);
-- 
2.21.0
