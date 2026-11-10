Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314361;
	b=o/BhnGHN+xzvtg7Ut9QPlJBfSjApe80ZMm5tGX17BuH0dUIVX2fRIZAVJVdKsAYo1UYa
	 9oM6aBb4jhylsaTTjvMtPZZ4G3W9gD2S0q3k+/S04vcJEk+0UMGejjk6+FYrxnJ6uTR3Q
	 yPPsxAWdJXAVfHDG8LhQgTKi7NvOGeiRh9BON97tnUwaCE90Iey0YiNMlKfus6t2gxM9S
	 4KhGHVzSRymFkv5rby35CyGACIF2zdqPHM8MrE2a7UZ0OGr1v8egoZdqsH1ftcCkCUv96
	 5Af76ce2L+ZqPs/m1teU0WQQsNhirzxUPZSJ71u3uggaPIBPa2tYr8AZ17c/Xxyx3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uYAyXCbVq5IVIokzvYWTPnTXnuYSofZcAfPhaWu0jmA=;
	b=Lk/qOyLoIOlt9bBSfw5gwl9YvovHLm4PVXKN2dklbUP7ltWGAUv1hXAyarAfL9ZLqSOz
	 XZJHaQasZ7zjAzeSj4crZ6aRi0vecY4hzwDE4WKFemDiq6qK9+IYW4hGQoyGF66bM1Sp/
	 gjl+ItNt8d4MDzrkZKFO6YDRY6YiCw8v0BDaLqFpRmToQcsZWHE9b6aOKfDxbhrvwgDre
	 /inuiFYVBfQ2kE8pJcRiVqF1o3rqFb6GDQw05AYvFtN7HFBDsbCBUYFSnkcXclIPxLqhf
	 GCWodHuT24BIG31ys5MBurLTONfAhxlGIpPXm2GbccRfeI415XhRVueLKdOK3ODreqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8HAragg;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AEA60A2614
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 12:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AEA60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8HAragg
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1039140f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 04:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314359; x=1794919159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYAyXCbVq5IVIokzvYWTPnTXnuYSofZcAfPhaWu0jmA=;
        b=F8HAraggJAAUI1kIOZ+eMAkYeMFgEKu4Sc8DSEJb3pbETwBSbWvZEI+nUyWvyX4+fc
         pZ6LjGNA7xubKNf/HCFZz3XY0cpN3q58GXSnBzytl69452/ZKYvvsS/tYzBRThMsnffa
         ly2hcFurjZ8nH98lm22YRNGJjrpVjmO7kO7gTMaWGKFseAyxn0eZG5oLav/aFuZcwx8x
         vlpBhLvSTB3B0ovTa+gl2qOl+uTSqsYjQ0YwDiWvO80JBtgUK9CK+1LJGho4ygo8SFqm
         jxpeh+KIyQHbo8I3THop1qH66yltKjOQccVMWAEIvKB3UEnhg1a18hB6EAbtdW2x71uH
         Emxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314359; x=1794919159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYAyXCbVq5IVIokzvYWTPnTXnuYSofZcAfPhaWu0jmA=;
        b=cZSFKvTNSpzpq2qZtKeHq9V1LPggZabrieFSzktsKifSMnsItQQhHHyZbUEE43VlvL
         u8TeSh9hGO4U66NG7Q9HU7kFLSesbaY3MbyynCmZFLGfScgHFBKOFEwqCDTd49NmAXRM
         gbd6FbwkuTDf3WGoSnuYSob45EzSn0QRJFPhD4B/roSh6ib087COcoQrslRLTfz7U5NC
         FVGnA4Vx66+XHqCxByD6eyRsAUCg7WRlacjh0EgMYOXhYYQtPwNrhdbbys7Hij1cLwXj
         b+ucj9SVKRtbXESBqnWU4yHEOdv7Zy36h94T239McswgV39DgnPvaz74OozHnRCFXfTT
         arZw==
X-Forwarded-Encrypted: i=1; AL+hErFLx145sUp8/inTcRh0BVdA7mqXJeIUuQ3E3bePgl+4IzL3XnZk/VC5htooHx3nx6Ypw/SAYjx5TnL9bw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vVQTByrxN/misbrMmO1pzcMjRbZxvPBilcbP7nFMIZR3KQoqF
	uXNmBxzf2KMoR1C9+Wuj/a0co566fa/eLplpgfavDBnciHAVz0spIxl/
X-Gm-Gg: AYBFou3JKZuaNS2yI+fjIC6KXb/zuca20smiiaBUTYbAsgog0CK9Hf2NVt6bcgMHb/s
	mj++/v5Bi3VGqiuAFulhbEk+kMQGH/LDw9IeluTuBmgKUJvG2K+acKqq+q7CKmi+SmoF+fgTUab
	dU12gRvnaIWB7x1WAmQLyeXqAc33iT3W+n+pF/neeSb5RHVJ/4iDpmWocKlst6dFlIEXxHbqIvm
	FxbTJZaa0Xo1jQOVF6+IjjCZuwoLikzWpB6dNcNvqkfxlJqipdhEWFMBoLo3WgG+LkIbrLCJX9X
	cj0BuaiH6dcXHjozvbRzmuFOr/Q49sIQoDaM4jBkGsjBADz/x/iDkhhkptUsX22RN/FKV5tev8l
	B2rcuUjOXQfhWqPpPe755BFzlwrQkp7mtWVIB/3grd6kiJMdEucA2x8F+qkF+ElQpWqnvEx0z4O
	Y94jFsnHv+oVfH/Kd57oZDPuY2pdt4ld6wCvjT4ApjRHxcY4BLUqoWYAPmPXpbK1sAp5wEHbKLP
	NfKngfiq70rY8Tqz1E4ebYqpcYe+Q5Mqk9FSg0nT6Yjs0WAD3NyUd3Z8Pjz2xTxF1Um5bz08ioi
	C7r4xYlX/3Xh0VnTgNfyvbwDxjl4Aby9qg9eVkMg1ipvitDUKgTt1PKGloq4vg==
X-Received: by 2002:a05:6000:46c6:b0:48c:4f94:222f with SMTP id ffacd0b85a97d-4982e82c326mr3192682f8f.17.1794314359401;
        Tue, 10 Nov 2026 04:39:19 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:18 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 10 Nov 2026 13:39:07 +0100
Subject: [PATCH 2/6] watchdog: tegra_wdt: Move SoC specific parts into
 match data
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
Message-Id: <20261110-t20-for-upstream-v1-2-5923449951fe@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3903;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=IdSNK3LuIegx6VFe0fbvLhcfTCNF+IDFwU8FE8CK1jk=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngaJvv+4d9GuI2up/wP7BlaJyuamVN7eI1t/V2aCpO
 9/2Z+XsjlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRhLmMDH1H+Bk1dvS/MG3e
 9OZLxZESviU5z/9FPThhvHp+cdpM05eMDOvCxDxzJVt7dua3vZh7I+ngp8Ocv/q+LIqaofKr6Ee
 bFiMA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The driver only supports the watchdog blocks of Tegra30 and later. Move
the parts that differ between SoC generations, namely the watchdog
operations, the maximum timeout and the register setup, into a per-SoC
structure selected through the match data, so that support for Tegra20,
which has no watchdog block, can be added.

Suspend and resume call the operations through the watchdog device, so
they work with any SoC.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/watchdog/tegra_wdt.c | 45 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/tegra_wdt.c b/drivers/watchdog/tegra_wdt.c
index 6b3f65c4d593..bb6233320579 100644
--- a/drivers/watchdog/tegra_wdt.c
+++ b/drivers/watchdog/tegra_wdt.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/stringify.h>
 #include <linux/watchdog.h>
 
@@ -63,6 +64,13 @@ struct tegra_wdt {
 	void __iomem		*tmr_regs;
 };
 
+struct tegra_wdt_soc {
+	const struct watchdog_ops *ops;
+	unsigned int max_timeout;
+	int (*init)(struct platform_device *pdev, struct tegra_wdt *wdt,
+		    void __iomem *regs);
+};
+
 #define WDT_HEARTBEAT 120
 static int heartbeat = WDT_HEARTBEAT;
 module_param(heartbeat, int, 0);
@@ -180,14 +188,32 @@ static const struct watchdog_ops tegra_wdt_ops = {
 	.get_timeleft = tegra_wdt_get_timeleft,
 };
 
+static int tegra30_wdt_init(struct platform_device *pdev, struct tegra_wdt *wdt,
+			    void __iomem *regs)
+{
+	wdt->wdt_regs = regs + WDT_BASE;
+	wdt->tmr_regs = regs + WDT_TIMER_BASE;
+
+	return 0;
+}
+
+static const struct tegra_wdt_soc tegra30_wdt_soc = {
+	.ops = &tegra_wdt_ops,
+	.max_timeout = MAX_WDT_TIMEOUT,
+	.init = tegra30_wdt_init,
+};
+
 static int tegra_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct tegra_wdt_soc *soc;
 	struct watchdog_device *wdd;
 	struct tegra_wdt *wdt;
 	void __iomem *regs;
 	int ret;
 
+	soc = device_get_match_data(dev);
+
 	/* This is the timer base. */
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
@@ -201,23 +227,24 @@ static int tegra_wdt_probe(struct platform_device *pdev)
 	if (!wdt)
 		return -ENOMEM;
 
-	/* Initialize struct tegra_wdt. */
-	wdt->wdt_regs = regs + WDT_BASE;
-	wdt->tmr_regs = regs + WDT_TIMER_BASE;
-
 	/* Initialize struct watchdog_device. */
 	wdd = &wdt->wdd;
 	wdd->timeout = heartbeat;
 	wdd->info = &tegra_wdt_info;
-	wdd->ops = &tegra_wdt_ops;
+	wdd->ops = soc->ops;
 	wdd->min_timeout = MIN_WDT_TIMEOUT;
-	wdd->max_timeout = MAX_WDT_TIMEOUT;
+	wdd->max_timeout = soc->max_timeout;
 	wdd->parent = dev;
 
 	watchdog_set_drvdata(wdd, wdt);
 
 	watchdog_set_nowayout(wdd, nowayout);
 
+	/* Initialize struct tegra_wdt. */
+	ret = soc->init(pdev, wdt, regs);
+	if (ret)
+		return ret;
+
 	watchdog_stop_on_unregister(wdd);
 	ret = devm_watchdog_register_device(dev, wdd);
 	if (ret)
@@ -236,7 +263,7 @@ static int tegra_wdt_suspend(struct device *dev)
 	struct tegra_wdt *wdt = dev_get_drvdata(dev);
 
 	if (watchdog_active(&wdt->wdd))
-		tegra_wdt_stop(&wdt->wdd);
+		wdt->wdd.ops->stop(&wdt->wdd);
 
 	return 0;
 }
@@ -246,13 +273,13 @@ static int tegra_wdt_resume(struct device *dev)
 	struct tegra_wdt *wdt = dev_get_drvdata(dev);
 
 	if (watchdog_active(&wdt->wdd))
-		tegra_wdt_start(&wdt->wdd);
+		wdt->wdd.ops->start(&wdt->wdd);
 
 	return 0;
 }
 
 static const struct of_device_id tegra_wdt_of_match[] = {
-	{ .compatible = "nvidia,tegra30-timer", },
+	{ .compatible = "nvidia,tegra30-timer", .data = &tegra30_wdt_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_wdt_of_match);

-- 
2.56.0

