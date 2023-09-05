Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA92CA0FFF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 19:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240600AbjIETHC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239286AbjIETHB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 15:07:01 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C759910C9
        for <linux-tegra@vger.kernel.org>; Tue,  5 Sep 2023 12:06:25 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so3954918a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 05 Sep 2023 12:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940723; x=1694545523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Lyvqa4ehdDUPxRvhVu2QVwAbbRfiYfIlEbafqal+r0=;
        b=qCAqFPlItIKMbKtqWejlbc/jNFp64dktakMZ0MpDyD2IgPUAbdWhTYuIrxcqWU5FA+
         1AuqiPE6WJ7JwbjlHxQqBrVmECGFbJi+o3XY1kPAT4j/HPJDmQ7PVraRUZYgmYUbTZWg
         hjvnEZ7pHCuD1vvwyXFyztwXGydPFLZ6mH2XImwR0dN4F2FSWQVm2SJynauRYUNTLQB2
         rA3tWze7wWlSzjDGrVOYBbGRS8DQK+QoKt/bwb0Yyz3S4Bgqi1/9PFpmFvoX/KsmRlf1
         TllSqTSf8juO9e0SVV2X5CXAl8WHv3xBLzKqQ0cjfteYZ/ivnSGPYP2bbzcbOOopCfkm
         LHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940723; x=1694545523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Lyvqa4ehdDUPxRvhVu2QVwAbbRfiYfIlEbafqal+r0=;
        b=KnBy+6/2wfI7fPLT/aWDDd/PfDYYLZmt6ujH/zRdi1cuH9FeDLZwtqF5OT0wk5Yz6K
         ZktphtS+tUHc5vmtDyZR6wVv5o9q77Curfpm12FDwEswcxXfA/4+xX8HO6Ki+Leuco3b
         U5Aj7Ezniqkna3S9LagokjXILdlJJj4M0Xdb/KfsgLSnr8nGDNduoA/xmeKKIfQq7ovR
         pBirksPZtWLVzkx+Klbmx70uhrrNKVAutzyLSgtFqeSI87R59t3RzQTgjVsilXiiuqcg
         z6QRBD2Ig9PALCJEtjNhszZGfg8Fayd250WS/7TMGW5WStgFoOnedqM9NOA901NkGh0l
         LDwg==
X-Gm-Message-State: AOJu0YyPLHlR/4sIB0xbvHCIjhsUYQs5EZWcmKi9JMe9LKWddnepSxip
        uLFDhRo9tYTnlt9p9CI6OLvFBUBSdzX1yc8Nfcc=
X-Google-Smtp-Source: AGHT+IG/jv5LelRKHFkS+zSS/4W2MFsO0ZmIobecKNQDMGWNcj2BwZSzitK+fLdVa7TdoNhlKNwX4g==
X-Received: by 2002:a05:6000:1190:b0:313:f399:6cea with SMTP id g16-20020a056000119000b00313f3996ceamr489890wrx.4.1693940018296;
        Tue, 05 Sep 2023 11:53:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 10/21] gpiolib: replace find_chip_by_name() with gpio_device_find_by_label()
Date:   Tue,  5 Sep 2023 20:52:58 +0200
Message-Id: <20230905185309.131295-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Remove all remaining uses of find_chip_by_name() (and subsequently:
gpiochip_find()) from gpiolib.c and use the new
gpio_device_find_by_label() instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 408f8a7753f9..90e8c3d8b6f6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1161,18 +1161,6 @@ struct gpio_device *gpio_device_find_by_label(const char *label)
 }
 EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
 
-static int gpiochip_match_name(struct gpio_chip *gc, void *data)
-{
-	const char *name = data;
-
-	return !strcmp(gc->label, name);
-}
-
-static struct gpio_chip *find_chip_by_name(const char *name)
-{
-	return gpiochip_find((void *)name, gpiochip_match_name);
-}
-
 /**
  * gpio_device_get() - Increase the reference count of this GPIO device
  * @gdev: GPIO device to increase the refcount for
@@ -3924,21 +3912,22 @@ EXPORT_SYMBOL_GPL(gpiod_remove_lookup_table);
  */
 void gpiod_add_hogs(struct gpiod_hog *hogs)
 {
-	struct gpio_chip *gc;
 	struct gpiod_hog *hog;
 
 	mutex_lock(&gpio_machine_hogs_mutex);
 
 	for (hog = &hogs[0]; hog->chip_label; hog++) {
+		struct gpio_device *gdev __free(gpio_device_put) = NULL;
+
 		list_add_tail(&hog->list, &gpio_machine_hogs);
 
 		/*
 		 * The chip may have been registered earlier, so check if it
 		 * exists and, if so, try to hog the line now.
 		 */
-		gc = find_chip_by_name(hog->chip_label);
-		if (gc)
-			gpiochip_machine_hog(gc, hog);
+		gdev = gpio_device_find_by_label(hog->chip_label);
+		if (gdev)
+			gpiochip_machine_hog(gdev->chip, hog);
 	}
 
 	mutex_unlock(&gpio_machine_hogs_mutex);
@@ -3999,7 +3988,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		return desc;
 
 	for (p = &table->table[0]; p->key; p++) {
-		struct gpio_chip *gc;
+		struct gpio_device *gdev __free(gpio_device_put) = NULL;
 
 		/* idx must always match exactly */
 		if (p->idx != idx)
@@ -4021,9 +4010,8 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-		gc = find_chip_by_name(p->key);
-
-		if (!gc) {
+		gdev = gpio_device_find_by_label(p->key);
+		if (!gdev) {
 			/*
 			 * As the lookup table indicates a chip with
 			 * p->key should exist, assume it may
@@ -4036,15 +4024,15 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
-		if (gc->ngpio <= p->chip_hwnum) {
+		if (gdev->chip->ngpio <= p->chip_hwnum) {
 			dev_err(dev,
 				"requested GPIO %u (%u) is out of range [0..%u] for chip %s\n",
-				idx, p->chip_hwnum, gc->ngpio - 1,
-				gc->label);
+				idx, p->chip_hwnum, gdev->chip->ngpio - 1,
+				gdev->chip->label);
 			return ERR_PTR(-EINVAL);
 		}
 
-		desc = gpiochip_get_desc(gc, p->chip_hwnum);
+		desc = gpiochip_get_desc(gdev->chip, p->chip_hwnum);
 		*flags = p->flags;
 
 		return desc;
-- 
2.39.2

