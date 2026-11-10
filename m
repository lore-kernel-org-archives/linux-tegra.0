Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314367;
	b=K7momCQ1hXbVtCx/1XW4UPXY29IBofSDofuoIW8rtYMhd3vx9wpOk+EqYqcB7omBEyNk
	 QbceTBvbHv19vjVoEAApzQR+PVXnurga41C+/aRql85knsVHVE/ce5VAOjdQ/PIhAcqz5
	 Rax/OOqxORj3g9Q7bosjHu3Xwr+DfFmOdvCjuVCL3YIuCRzBgsk9sk5OaWPPJZj8r8XFl
	 KHMK6C76ZU6ROuc9b/r6ZuMwkGlRfPgMyRTiTRFPGKerIrnrrVFnvcPnutsN7CmHQZqVA
	 15e+pxPl5CiPbeGVldmJgXcFhrNA4wyo77GgIOy8Acm9+Wm+69QQM4ts8CK+iRB3W0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tMC8EGofaq7T5ry8RVT9J8t2/iZrN9dz+SRZa/MGrjE=;
	b=gsSmTSp5RnVdny0/cIno6CatJJWAFot1Ydg57fPNtvuT3hlr9pTyUJfQWcbpHPC3NfK0
	 pW/twiT5X84NKtnuQaHIVqiEABs3dKGwg9FLAWppC1UfEhbOerc3OcrVr9zss+U1E5nwS
	 nQnkWU/8wdYjTCA4hnHrGktU4mIeumfoMbHcOa9BNeJzMDYw/bSYVpGCCBnFpUPjCPPgg
	 0Jr24PuqeUO5H02OYdjvv2lbaobrWuu7m9H8ETlNI155bhotUx9bM9pJslG/QR8JDqShK
	 o3nEe8l6FxD/79xdDNWOi5UIfZwAhFEZMLuLESoHXEI7/sGq6tSPo2UphELA4NqjqMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdShT5mr;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8860A3832
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 12:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C8860A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdShT5mr
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1051501f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 04:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314366; x=1794919166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMC8EGofaq7T5ry8RVT9J8t2/iZrN9dz+SRZa/MGrjE=;
        b=mdShT5mrp5jJNanyuEppUWJIl2u1ANKzgTF2B3IYw2t5t905hi9jh+FO813qtWYrgL
         2O4vxBmZtw9DHp84w6vnLDFn4wrF7jy+n8AkuOvx1UKrVSfHG53yk8fadyOWbYkHuo5D
         9UDOCM/8LgmOmOu43TrWh4sGI8Y9XuND9eepOenmK+nb7Eiy5WJqcbUwLP22/yCjePgQ
         hUic7Mtqtvm94aqWRhRra+lzawq+36IBGLwv7+mjC2yGSYxMmLPO/sIPtOc7TfWPnOrF
         7J3YiQGNzQ/YqTmuvDz5r90VnrG7Wy7hBgwbqyj+9swjv5/bDCzSb2TtM4X3x52X4QLs
         tgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314366; x=1794919166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMC8EGofaq7T5ry8RVT9J8t2/iZrN9dz+SRZa/MGrjE=;
        b=u1eiEJMJnTh3kQpYEr2eXNhYHF11lOrZTI/qq0tsgqjlPsUJ7CsgHFPryWd4zxYR8o
         nO9bPKU3tyYuNCwclrSckxVhMeH+bD94NUHvCZGKG2Uk8kQZlCNocBgKU7r42+Guu05R
         6QPfKU4dSMnHPpMG/KUvc1uuD2Z5mCJD8PTKg//7q9w7ldQ1WzbMFiNMcIMitlMifGub
         iomDS/fsxUVmNutGhlxXk9N/KBodumT1UPZNb/q88HEoYv0kRKFbqFmJw4WjTKXCyPWp
         47lcvz4+H2F8FaDETD3I5dc01q+0FuwVr+hzFLEfuc27Lrk8UnPlvCqkHkc7JZwhXmBu
         NhCA==
X-Forwarded-Encrypted: i=1; AL+hErGqindf+PjtR4tDK6Jxc4wLrC6jfkPUERRyXsghygXanHNDwX4MJTh8/ztMQf565PSiu98Kyvmu3jVtEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1yMrRt5SrtJY46Z7i/lpow+5DfaZK34ILNX8Trz95d1HnLQPS
	X96bA76oWBP2TxxYX6dl1MTf0TjqsyHDteu5w8513KP83qGzeLfO+R0x
X-Gm-Gg: AYBFou0JQWB1N8XTWbw1M8gIAV5+SElmCG1Frfy57qXt5htf4ntZpAPmDfHCVehMmzV
	TBqoq/tulYMy/boW7A9LlTB8AEp4kkOdBqTDuGcmtRqbLDZHYQkhwX7uJJCcjgjYN1jQ45vYUsz
	HACN1tr3D5EaTHugaj5jZflj2khwBlmLS65PBkJ69nUn/j3JYWMYLSFXTgLwGwOVzD3UHIyI8Ji
	WIprbi0Bc2p2W6aYkVUfhETvHmdSRViOgbHOOThhIpP1yFIIMdocTtYIeWd9NITqDGFumXRg+vd
	18SgwCWvPKHVQNX5aeCFyXF/fEU0Y0lWJNB1IzJ0f0gI/f807KcMgPvdYn3fOKIZGF/XHsbrFbl
	Ca+Psdz83EMPUn47W95nSAm77z3fOTcM7i30W9i2V9p2dosOILNiV1lAaCeHaKdVRpYcKjeQzIO
	0BwPx6GRma2EyZaS3bpbgTJTHyf+Rtr0A8IsIJJfWMItPK3a7me8HYDtloA0fxEmDRAxwZKBtuG
	y/rch5AGWFMOAqx8S8QeXyvDHs8fYVVVgBQ6UfEXyoXCPPCAdU/EoqI6419HUjzGVbv5cj7VvZL
	gaNHBbR2HFmozQvGKNmASj7af0Jo/hWy4H1odGEV
X-Received: by 2002:a05:6000:46da:b0:492:7969:b4d2 with SMTP id ffacd0b85a97d-498308b98bfmr3018884f8f.40.1794314365416;
        Tue, 10 Nov 2026 04:39:25 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:24 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 10 Nov 2026 13:39:11 +0100
Subject: [PATCH 6/6] watchdog: tegra_wdt: Stop on Tegra20 VDE power off
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-t20-for-upstream-v1-6-5923449951fe@gmail.com>
References: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
In-Reply-To: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9546;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=n0wxVat+z1yCXWm8xKBK+6Td9OvyeLIKDcb98Fw/Kjc=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngaIVAUcUfSXEtDqUhNkv8fum8tnYH1zbPXWRyYP8K
 JPpL9o6SlkYxLgYZMUUWcweCn3hmef1fsPLrZ0wc1iZQIYwcHEKwEQ44hgZtnEkTlh0k/+3nFXI
 jB16HXUT264LG3jltrx7tEBWWXTbL0aG2SuEYpxOL3mT+aWsvvxd8OVFppor5+3RNJt6Lkykue4
 vBwA=
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

A watchdog reset doesn't reset the PMC, and Tegra20's boot ROM hangs
after it if the VDE power partition is off. Unless booted with
tegra_pmc.vde_always_on=1, the PMC driver powers the partition off when
it registers it, and genpd powers it off whenever the VDE is idle. A
watchdog started by the bootloader can still catch hangs early during
boot, before that happens.

Register a PMC partition power off notifier to stop the watchdog, and
the watchdog core's pings, before the VDE partition is powered off for
the first time. If the partition is already off, a watchdog left
running by the bootloader is stopped instead of taken over. Afterwards
the watchdog refuses to start with -EBUSY, as a reset would hang, even
if the partition is powered on again. If the notifier can't be
registered, the driver warns and keeps the watchdog running.

Stopping is the default. With tegra_pmc.vde_always_on=1, the partition
is never powered off, so the watchdog stays usable. Booting with
tegra_wdt.stop_on_vde_off=0 also keeps it usable, but at the risk of the
system hanging instead of rebooting.

The watchdog operations and the notifier share a mutex, as the notifier
runs outside of the watchdog core's locking.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 Documentation/watchdog/watchdog-parameters.rst |   5 +
 drivers/watchdog/tegra_wdt.c                   | 143 +++++++++++++++++++++++--
 2 files changed, 137 insertions(+), 11 deletions(-)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 348229ffcb43..3f7a1831c5cb 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -600,6 +600,11 @@ tegra_wdt:
     nowayout:
 	Watchdog cannot be stopped once started
 	(default=kernel config parameter)
+    stop_on_vde_off:
+	Tegra20: stop the watchdog for good when the VDE partition is
+	powered off, as a reset would hang the boot ROM. Booting with
+	tegra_pmc.vde_always_on=1 keeps the partition, and with it the
+	watchdog, usable (default=1)
 
 -------------------------------------------------
 
diff --git a/drivers/watchdog/tegra_wdt.c b/drivers/watchdog/tegra_wdt.c
index 7c2c21f90de5..d36310c50f78 100644
--- a/drivers/watchdog/tegra_wdt.c
+++ b/drivers/watchdog/tegra_wdt.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -14,6 +16,8 @@
 #include <linux/stringify.h>
 #include <linux/watchdog.h>
 
+#include <soc/tegra/pmc.h>
+
 /* minimum and maximum watchdog trigger timeout, in seconds */
 #define MIN_WDT_TIMEOUT			1
 #define MAX_WDT_TIMEOUT			255
@@ -86,7 +90,12 @@ struct tegra_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*wdt_regs;
 	void __iomem		*tmr_regs;
-	void __iomem		*rst_source;	/* Tegra20 only */
+
+	/* Tegra20 only */
+	void __iomem		*rst_source;
+	struct notifier_block	powergate_nb;
+	struct mutex		lock;		/* hardware and vde_off */
+	bool			vde_off;
 };
 
 struct tegra_wdt_soc {
@@ -109,6 +118,21 @@ MODULE_PARM_DESC(nowayout,
 	"Watchdog cannot be stopped once started (default="
 	__stringify(WATCHDOG_NOWAYOUT) ")");
 
+/*
+ * After a watchdog reset, Tegra20's boot ROM hangs if the VDE partition is
+ * powered off, which the PMC driver does when it registers the partition,
+ * unless booted with tegra_pmc.vde_always_on=1. By default, the watchdog is
+ * therefore only used until the partition is powered off for the first time,
+ * which still allows a watchdog started by the bootloader to catch hangs early
+ * during boot. tegra_pmc.vde_always_on=1 keeps the watchdog usable for good.
+ * Clearing this keeps it usable as well, but at the risk of the system
+ * hanging instead of rebooting.
+ */
+static bool stop_on_vde_off = true;
+module_param(stop_on_vde_off, bool, 0);
+MODULE_PARM_DESC(stop_on_vde_off,
+	"Tegra20: stop the watchdog for good when the VDE partition is powered off (default=1)");
+
 static int tegra_wdt_start(struct watchdog_device *wdd)
 {
 	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
@@ -222,10 +246,9 @@ static int tegra30_wdt_init(struct platform_device *pdev, struct tegra_wdt *wdt,
 	return 0;
 }
 
-static int tegra20_wdt_start(struct watchdog_device *wdd)
+static void __tegra20_wdt_start(struct tegra_wdt *wdt)
 {
-	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
-	u32 period = wdd->timeout * USEC_PER_SEC / 2;
+	u32 period = wdt->wdd.timeout * USEC_PER_SEC / 2;
 	u32 val;
 
 	writel(TIMER_EN | TIMER_PERIODIC | (period - 1),
@@ -241,13 +264,10 @@ static int tegra20_wdt_start(struct watchdog_device *wdd)
 	val &= ~T20_RST_SOURCE_WDT_MASK;
 	val |= T20_RST_SOURCE_WDT_EN | T20_RST_SOURCE_WDT_SYS_RST_EN;
 	writel(val, wdt->rst_source);
-
-	return 0;
 }
 
-static int tegra20_wdt_stop(struct watchdog_device *wdd)
+static void __tegra20_wdt_stop(struct tegra_wdt *wdt)
 {
-	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
 	u32 val;
 
 	val = readl(wdt->rst_source);
@@ -256,6 +276,35 @@ static int tegra20_wdt_stop(struct watchdog_device *wdd)
 
 	writel(0, wdt->tmr_regs + TIMER_PTV);
 	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
+}
+
+static int tegra20_wdt_start(struct watchdog_device *wdd)
+{
+	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
+	int ret = 0;
+
+	mutex_lock(&wdt->lock);
+
+	if (wdt->vde_off) {
+		dev_warn(wdd->parent,
+			 "not starting, a reset would hang with VDE powered off\n");
+		ret = -EBUSY;
+	} else {
+		__tegra20_wdt_start(wdt);
+	}
+
+	mutex_unlock(&wdt->lock);
+
+	return ret;
+}
+
+static int tegra20_wdt_stop(struct watchdog_device *wdd)
+{
+	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
+
+	mutex_lock(&wdt->lock);
+	__tegra20_wdt_stop(wdt);
+	mutex_unlock(&wdt->lock);
 
 	return 0;
 }
@@ -264,15 +313,20 @@ static int tegra20_wdt_ping(struct watchdog_device *wdd)
 {
 	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
 
+	mutex_lock(&wdt->lock);
+
 	/*
 	 * Clearing the interrupt alone doesn't restart the timer's period, so
 	 * the reset could follow as soon as half the timeout after the ping.
 	 * Rewriting the timer setting restarts the period. The interrupt is
-	 * cleared afterwards, so one fired in between doesn't count.
+	 * cleared afterwards, so one fired in between doesn't count. While
+	 * stopped, the timer setting reads back as 0, so this doesn't start it.
 	 */
 	writel(readl(wdt->tmr_regs + TIMER_PTV), wdt->tmr_regs + TIMER_PTV);
 	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
 
+	mutex_unlock(&wdt->lock);
+
 	return 0;
 }
 
@@ -296,6 +350,45 @@ static const struct watchdog_ops tegra20_wdt_ops = {
 	.set_timeout = tegra20_wdt_set_timeout,
 };
 
+static int tegra20_wdt_powergate_notify(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	struct tegra_wdt *wdt = container_of(nb, struct tegra_wdt,
+					     powergate_nb);
+	unsigned int id = *(unsigned int *)data;
+
+	if (event != TEGRA_PMC_POWERGATE_POWER_OFF ||
+	    id != TEGRA_POWERGATE_VDEC)
+		return NOTIFY_DONE;
+
+	mutex_lock(&wdt->lock);
+
+	if (!wdt->vde_off) {
+		wdt->vde_off = true;
+		__tegra20_wdt_stop(wdt);
+
+		/*
+		 * Stop the core's pings. If user space has the device open,
+		 * its pings don't restart the watchdog either.
+		 */
+		clear_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+
+		dev_info(wdt->wdd.parent,
+			 "VDE powered off, watchdog stopped\n");
+	}
+
+	mutex_unlock(&wdt->lock);
+
+	return NOTIFY_OK;
+}
+
+static void tegra20_wdt_unregister_notifier(void *data)
+{
+	struct tegra_wdt *wdt = data;
+
+	tegra_pmc_powergate_unregister_notifier(&wdt->powergate_nb);
+}
+
 static int tegra20_wdt_init(struct platform_device *pdev, struct tegra_wdt *wdt,
 			    void __iomem *regs)
 {
@@ -326,18 +419,46 @@ static int tegra20_wdt_init(struct platform_device *pdev, struct tegra_wdt *wdt,
 
 	wdt->tmr_regs = regs + T20_WDT_TIMER_BASE;
 
+	ret = devm_mutex_init(dev, &wdt->lock);
+	if (ret)
+		return ret;
+
+	/*
+	 * If the VDE partition is already powered off, the notifier is called
+	 * right away and stops a watchdog left running by the bootloader.
+	 */
+	if (stop_on_vde_off) {
+		wdt->powergate_nb.notifier_call = tegra20_wdt_powergate_notify;
+
+		ret = tegra_pmc_powergate_register_notifier(&wdt->powergate_nb);
+		if (ret) {
+			dev_warn(dev, "failed to register VDE notifier: %d\n",
+				 ret);
+		} else {
+			ret = devm_add_action_or_reset(dev,
+					tegra20_wdt_unregister_notifier, wdt);
+			if (ret)
+				return ret;
+		}
+	}
+
 	/*
 	 * The bootloader may leave the watchdog running. Take it over with
 	 * our own timeout and timer 1, and let the core ping it until user
 	 * space opens the device.
 	 */
-	if (readl(wdt->rst_source) & T20_RST_SOURCE_WDT_EN) {
+	mutex_lock(&wdt->lock);
+
+	if (!wdt->vde_off &&
+	    (readl(wdt->rst_source) & T20_RST_SOURCE_WDT_EN)) {
 		dev_info(dev, "watchdog left running by the bootloader, taking it over (timeout %u sec)\n",
 			 wdt->wdd.timeout);
-		tegra20_wdt_start(&wdt->wdd);
+		__tegra20_wdt_start(wdt);
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	mutex_unlock(&wdt->lock);
+
 	return 0;
 }
 

-- 
2.56.0

