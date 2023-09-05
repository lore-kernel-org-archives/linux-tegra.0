Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317CCC83F3E
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 19:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240303AbjIETJU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbjIETJT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 15:09:19 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF4ACDB
        for <linux-tegra@vger.kernel.org>; Tue,  5 Sep 2023 12:08:47 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52a4737a08fso3907685a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 05 Sep 2023 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940860; x=1694545660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFpxyOwy5Bm9Qt9hRSpXKADqH+X+nrhUxL/zhVP0yhY=;
        b=CPs5Ma25n7Xm5JFcrZjUCIQbPU0GLhyeTgmSu4kaE7GVHHczi+H6ssAkArm2jnqHQx
         /JMs/z2Ysdpd+pxFzBSuEwuC3riQiLazmR7YaUczwYOGNZjcdLUOyHy27VgVeEn8hpP7
         2h02rT9QwprQlcWTW8wB0CsQnKKDOa9APF8ENLV8J3wrrE49o09YPK9hQnDbjf5avjU0
         4JR3DCekM53t/3fXLbl7IA5tGboxoITCTj8r+hf6ZAGABwAmuqXSGgfdZfu5UWm5DwEV
         JhWRO17urdfCj1qY0+tlf/hwKyOCcLUFrlZXq0TWZgpuEirJ6fYOT0Q7aHOCXFA+DJMq
         l4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940860; x=1694545660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFpxyOwy5Bm9Qt9hRSpXKADqH+X+nrhUxL/zhVP0yhY=;
        b=gOe0sIDh9slZYAvXEo0PCp+80z22hb/9AM3v1lyqcbwyFc0Vn/3kc8fGn2FeQBc1C+
         CYYr2zJvqG29QlK/TSaTLjKlBZQnOmnIhBe9il1UGveasB9y8IGI8iWE2YC7lrftnPFI
         xiqtPFJCBVtD5TVZx0zamTg+22n+XeTr+92+W97sIhczbNh5qf/v4SSiW6k8EXvFA4wK
         wn3CJDa7P+RwVuK8UF/JEqoezwayvy/rTj3n8asr3lmO86ljP/igYlMtq3EGLLbiEJ2+
         3VQ0Fgz0lfwBX5marej3Ns0SFaaR5HWIrBxPbUBCAvNnL4uDHpKO2Tmczq37fnwEk116
         Pncw==
X-Gm-Message-State: AOJu0YxkBfpM9pbHSXe0Hp/mN6ZOb9vgk7MZph2ThSIykxCoJ5Qz1j5f
        MxvZb12ayvmMq3tzGK70w0gNMMuREXsTFH4D2+U=
X-Google-Smtp-Source: AGHT+IFRNQIOeT3zr09E3n7bBEGrta/pNu8Vff14KdMD6sxtlr9ZDhLyFMZ76FUBno0gzmLiwhMBVA==
X-Received: by 2002:a5d:5592:0:b0:317:54de:9719 with SMTP id i18-20020a5d5592000000b0031754de9719mr425005wrv.70.1693940024276;
        Tue, 05 Sep 2023 11:53:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:43 -0700 (PDT)
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
Subject: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
Date:   Tue,  5 Sep 2023 20:53:03 +0200
Message-Id: <20230905185309.131295-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiochip_find() is going away as it's not hot-unplug safe. This platform
is not affected by any of the related problems as this GPIO controller
cannot really go away but in order to finally remove this function, we
need to convert it to using gpio_device_find() as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 36 +++++++++++++--------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 9808cd27e2cf..a28ea6ac1eba 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -560,22 +560,6 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
 	&ams_delta_nand_gpio_table,
 };
 
-/*
- * Some drivers may not use GPIO lookup tables but need to be provided
- * with GPIO numbers.  The same applies to GPIO based IRQ lines - some
- * drivers may even not use GPIO layer but expect just IRQ numbers.
- * We could either define GPIO lookup tables then use them on behalf
- * of those devices, or we can use GPIO driver level methods for
- * identification of GPIO and IRQ numbers. For the purpose of the latter,
- * defina a helper function which identifies GPIO chips by their labels.
- */
-static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
-{
-	char *label = data;
-
-	return !strcmp(label, chip->label);
-}
-
 static struct gpiod_hog ams_delta_gpio_hogs[] = {
 	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
 		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
@@ -615,14 +599,28 @@ static void __init modem_assign_irq(struct gpio_chip *chip)
  */
 static void __init omap_gpio_deps_init(void)
 {
+	struct gpio_device *gdev;
 	struct gpio_chip *chip;
 
-	chip = gpiochip_find(OMAP_GPIO_LABEL, gpiochip_match_by_label);
-	if (!chip) {
-		pr_err("%s: OMAP GPIO chip not found\n", __func__);
+	/*
+	 * Some drivers may not use GPIO lookup tables but need to be provided
+	 * with GPIO numbers. The same applies to GPIO based IRQ lines - some
+	 * drivers may even not use GPIO layer but expect just IRQ numbers.
+	 * We could either define GPIO lookup tables then use them on behalf
+	 * of those devices, or we can use GPIO driver level methods for
+	 * identification of GPIO and IRQ numbers.
+	 *
+	 * This reference will be leaked but that's alright as this device
+	 * never goes down.
+	 */
+	gdev = gpio_device_find_by_label(OMAP_GPIO_LABEL);
+	if (!gdev) {
+		pr_err("%s: OMAP GPIO device not found\n", __func__);
 		return;
 	}
 
+	chip = gpio_device_get_chip(gdev);
+
 	/*
 	 * Start with FIQ initialization as it may have to request
 	 * and release successfully each OMAP GPIO pin in turn.
-- 
2.39.2

