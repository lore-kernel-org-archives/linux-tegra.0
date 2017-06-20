From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 45/51] rtc: tegra stop using rtc deprecated functions
Date: Tue, 20 Jun 2017 11:35:53 +0200
Message-ID: <1497951359-13334-46-git-send-email-benjamin.gaignard@linaro.org>
References: <1497951359-13334-1-git-send-email-benjamin.gaignard@linaro.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <rtc-linux+bncBDKNBMNKRMJRBGO2UPFAKGQE7LESEMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1497951359-13334-1-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

rtc_time_to_tm() and rtc_tm_to_time() are deprecated because they
rely on 32bits variables and that will make rtc break in y2038/2016.
Stop using those two functions to safer 64bits ones.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
CC: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
CC: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
CC: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
CC: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/rtc/rtc-tegra.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index d30d57b..a429884 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -110,7 +110,7 @@ static int tegra_rtc_wait_while_busy(struct device *dev)
 static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec, msec;
+	unsigned long long sec, msec;
 	unsigned long sl_irq_flags;
 
 	/* RTC hardware copies seconds to shadow seconds when a read
@@ -122,9 +122,9 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	spin_unlock_irqrestore(&info->tegra_rtc_lock, sl_irq_flags);
 
-	rtc_time_to_tm(sec, tm);
+	rtc_time64_to_tm(sec, tm);
 
-	dev_vdbg(dev, "time read as %lu. %d/%d/%d %d:%02u:%02u\n",
+	dev_vdbg(dev, "time read as %llu. %d/%d/%d %d:%02u:%02u\n",
 		sec,
 		tm->tm_mon + 1,
 		tm->tm_mday,
@@ -140,7 +140,7 @@ static int tegra_rtc_read_time(struct device *dev, struct rtc_time *tm)
 static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec;
+	unsigned long long sec;
 	int ret;
 
 	/* convert tm to seconds. */
@@ -148,9 +148,9 @@ static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	if (ret)
 		return ret;
 
-	rtc_tm_to_time(tm, &sec);
+	sec = rtc_tm_to_time64(tm);
 
-	dev_vdbg(dev, "time set to %lu. %d/%d/%d %d:%02u:%02u\n",
+	dev_vdbg(dev, "time set to %llu. %d/%d/%d %d:%02u:%02u\n",
 		sec,
 		tm->tm_mon+1,
 		tm->tm_mday,
@@ -174,7 +174,7 @@ static int tegra_rtc_set_time(struct device *dev, struct rtc_time *tm)
 static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec;
+	unsigned long long sec;
 	unsigned tmp;
 
 	sec = readl(info->rtc_base + TEGRA_RTC_REG_SECONDS_ALARM0);
@@ -185,7 +185,7 @@ static int tegra_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	} else {
 		/* alarm is enabled. */
 		alarm->enabled = 1;
-		rtc_time_to_tm(sec, &alarm->time);
+		rtc_time64_to_tm(sec, &alarm->time);
 	}
 
 	tmp = readl(info->rtc_base + TEGRA_RTC_REG_INTR_STATUS);
@@ -220,10 +220,10 @@ static int tegra_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 static int tegra_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct tegra_rtc_info *info = dev_get_drvdata(dev);
-	unsigned long sec;
+	unsigned long long sec;
 
 	if (alarm->enabled)
-		rtc_tm_to_time(&alarm->time, &sec);
+		sec = rtc_tm_to_time64(&alarm->time);
 	else
 		sec = 0;
 
@@ -236,7 +236,7 @@ static int tegra_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (sec) {
 		tegra_rtc_alarm_irq_enable(dev, 1);
 
-		dev_vdbg(dev, "alarm set as %lu. %d/%d/%d %d:%02u:%02u\n",
+		dev_vdbg(dev, "alarm set as %llu. %d/%d/%d %d:%02u:%02u\n",
 			sec,
 			alarm->time.tm_mon+1,
 			alarm->time.tm_mday,
-- 
1.9.1

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
