From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V2 - 08/27] rtc: Remove use of seq_printf return value
Date: Sat, 21 Feb 2015 20:02:15 -0800
Message-ID: <1424577735.20944.6.camel@perches.com>
References: <cover.1424573328.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1424573328.git.joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The seq_printf return value, because it's frequently misused,
will eventually be converted to void.

See: commit 1f33c41c03da ("seq_file: Rename seq_overflow() to
     seq_has_overflowed() and make public")

Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
---

V2: sigh - Fix : vs ; line termination typo in rtc-tegra

 drivers/rtc/rtc-cmos.c   | 36 +++++++++++++++++++-----------------
 drivers/rtc/rtc-ds1305.c |  6 +++---
 drivers/rtc/rtc-mrst.c   | 16 +++++++++-------
 drivers/rtc/rtc-tegra.c  |  4 +++-
 4 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 5b2e761..87647f4 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -459,23 +459,25 @@ static int cmos_procfs(struct device *dev, struct seq_file *seq)
 	/* NOTE:  at least ICH6 reports battery status using a different
 	 * (non-RTC) bit; and SQWE is ignored on many current systems.
 	 */
-	return seq_printf(seq,
-			"periodic_IRQ\t: %s\n"
-			"update_IRQ\t: %s\n"
-			"HPET_emulated\t: %s\n"
-			// "square_wave\t: %s\n"
-			"BCD\t\t: %s\n"
-			"DST_enable\t: %s\n"
-			"periodic_freq\t: %d\n"
-			"batt_status\t: %s\n",
-			(rtc_control & RTC_PIE) ? "yes" : "no",
-			(rtc_control & RTC_UIE) ? "yes" : "no",
-			is_hpet_enabled() ? "yes" : "no",
-			// (rtc_control & RTC_SQWE) ? "yes" : "no",
-			(rtc_control & RTC_DM_BINARY) ? "no" : "yes",
-			(rtc_control & RTC_DST_EN) ? "yes" : "no",
-			cmos->rtc->irq_freq,
-			(valid & RTC_VRT) ? "okay" : "dead");
+	seq_printf(seq,
+		   "periodic_IRQ\t: %s\n"
+		   "update_IRQ\t: %s\n"
+		   "HPET_emulated\t: %s\n"
+		   // "square_wave\t: %s\n"
+		   "BCD\t\t: %s\n"
+		   "DST_enable\t: %s\n"
+		   "periodic_freq\t: %d\n"
+		   "batt_status\t: %s\n",
+		   (rtc_control & RTC_PIE) ? "yes" : "no",
+		   (rtc_control & RTC_UIE) ? "yes" : "no",
+		   is_hpet_enabled() ? "yes" : "no",
+		   // (rtc_control & RTC_SQWE) ? "yes" : "no",
+		   (rtc_control & RTC_DM_BINARY) ? "no" : "yes",
+		   (rtc_control & RTC_DST_EN) ? "yes" : "no",
+		   cmos->rtc->irq_freq,
+		   (valid & RTC_VRT) ? "okay" : "dead");
+
+	return 0;
 }
 
 #else
diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index 129add77..12b0715 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -434,9 +434,9 @@ static int ds1305_proc(struct device *dev, struct seq_file *seq)
 	}
 
 done:
-	return seq_printf(seq,
-			"trickle_charge\t: %s%s\n",
-			diodes, resistors);
+	seq_printf(seq, "trickle_charge\t: %s%s\n", diodes, resistors);
+
+	return 0;
 }
 
 #else
diff --git a/drivers/rtc/rtc-mrst.c b/drivers/rtc/rtc-mrst.c
index e2436d1..ab02bda 100644
--- a/drivers/rtc/rtc-mrst.c
+++ b/drivers/rtc/rtc-mrst.c
@@ -277,13 +277,15 @@ static int mrst_procfs(struct device *dev, struct seq_file *seq)
 	valid = vrtc_cmos_read(RTC_VALID);
 	spin_unlock_irq(&rtc_lock);
 
-	return seq_printf(seq,
-			"periodic_IRQ\t: %s\n"
-			"alarm\t\t: %s\n"
-			"BCD\t\t: no\n"
-			"periodic_freq\t: daily (not adjustable)\n",
-			(rtc_control & RTC_PIE) ? "on" : "off",
-			(rtc_control & RTC_AIE) ? "on" : "off");
+	seq_printf(seq,
+		   "periodic_IRQ\t: %s\n"
+		   "alarm\t\t: %s\n"
+		   "BCD\t\t: no\n"
+		   "periodic_freq\t: daily (not adjustable)\n",
+		   (rtc_control & RTC_PIE) ? "on" : "off",
+		   (rtc_control & RTC_AIE) ? "on" : "off");
+
+	return 0;
 }
 
 #else
diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index d948277..b318017 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -261,7 +261,9 @@ static int tegra_rtc_proc(struct device *dev, struct seq_file *seq)
 	if (!dev || !dev->driver)
 		return 0;
 
-	return seq_printf(seq, "name\t\t: %s\n", dev_name(dev));
+	seq_printf(seq, "name\t\t: %s\n", dev_name(dev));
+
+	return 0;
 }
 
 static irqreturn_t tegra_rtc_irq_handler(int irq, void *data)
