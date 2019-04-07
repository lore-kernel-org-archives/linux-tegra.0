From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/3] rtc: tegra: switch to rtc_time64_to_tm/rtc_tm_to_time64
Date: Sun,  7 Apr 2019 23:16:45 +0200
Message-ID: <20190407211646.14962-2-alexandre.belloni@bootlin.com>
References: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rtc@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: linux-tegra@vger.kernel.org

Call the 64bit versions of rtc_tm time conversion now that the range is
enforced by the core.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 3f93a1f7abb5..e93092aa6f7d 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -123,7 +123,7 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	spin_unlock_irqrestore(&info->tegra_rtc_lock, sl_irq_flags);
 
-	rtc_time_to_tm(sec, tm);
+	rtc_time64_to_tm(sec, tm);
 
 	dev_vdbg(dev, "time read as %lu. %ptR\n", sec, tm);
 
@@ -137,7 +137,7 @@ static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	/* convert tm to seconds. */
-	rtc_tm_to_time(tm, &sec);
+	sec = rtc_tm_to_time64(tm);
 
 	dev_vdbg(dev, "time set to %lu. %ptR\n", sec, tm);
 
@@ -166,7 +166,7 @@ static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	} else {
 		/* alarm is enabled. */
 		alarm->enabled = 1;
-		rtc_time_to_tm(sec, &alarm->time);
+		rtc_time64_to_tm(sec, &alarm->time);
 	}
 
 	tmp = readl(info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
@@ -204,7 +204,7 @@ static int tegra_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	unsigned long sec;
 
 	if (alarm->enabled)
-		rtc_tm_to_time(&alarm->time, &sec);
+		sec = rtc_tm_to_time64(&alarm->time);
 	else
 		sec = 0;
 
-- 
2.20.1
