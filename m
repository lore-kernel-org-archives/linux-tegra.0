Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8384CCA0FFF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 19:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241503AbjIETNB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242068AbjIETMj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 15:12:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0896D1AB
        for <linux-tegra@vger.kernel.org>; Tue,  5 Sep 2023 12:12:07 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so333689a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 05 Sep 2023 12:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941068; x=1694545868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LktKQq4MWoQ/qKoiT9d7DgSnCPQ1kCPUYmKK3IZgeGM=;
        b=228ohd9t6ZtSSu5en6ApOtOCZ9D1RbU6AP9oRrGvZ4X3//qg2feIKcQRAb7iAFOmE9
         IsJn1NPLwQSm0Ymnz9gZ+cJ5aI6Q2Pw5Xbyoyx7N6mfZCox6XWm9Tu1i2BU5pY31xiEH
         Vio8Uw/I9r5+m44BRCLTAwUMJ2wQUM99WnbxcBi6DXDI0/X0wGFJ3YN0gq6Olz2KBuoz
         Z+57Gz1B96jm4Sel6NapTnslGlHMObeBRz1nHPNR8+3GGIZh1jOuoEmd8tdacytspsBD
         +jbI3EirBwnbSeXJDOwQBeyOBjh1WjRxohhiRVL3tgFbuWZ548TkPYrSY55lMI0g9CZ+
         Fmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941068; x=1694545868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LktKQq4MWoQ/qKoiT9d7DgSnCPQ1kCPUYmKK3IZgeGM=;
        b=cAHFjOE2VICzK1iSOcwqxcT09CX0z3U9JFO2DEWOOgQxzVea19wy5uc/UZaqDEx+gX
         VNPJmynBl+e0WzptkgXgcS2x20nyd2Tm46yJ7lavD2h0+bL4eqdOOWUUfbTbz/aQelK8
         RncbBcV50vJP+7Q2mQm8u663XBPuCKdRfNgNOqWV/R3o9j5wN2FFIaZp6pM+vCZfkRT5
         pEx9W+96vZd2c9rlSHB8nkJ2pRXsaHU5dXNVe+ky09li+vy8sbK0Br6vi1Mwd9edwxt7
         qPy+HpX8VwZWsTKwOnqzuY9FAhojtsW58dqozLDlbrgobAlXrSy9xkwWGvAHBqenWZk7
         a6JQ==
X-Gm-Message-State: AOJu0YyzMO7YJ7OtyoNKW3E+VAr2uzKryjdDteoESmaF2fDdSU7V42db
        BM3fWAwxiF+Chl7xn6Q/qnqdUD8lppzl79Vdct0=
X-Google-Smtp-Source: AGHT+IEKE+XCvxCtmXJO+rvvHv5Ifn1+auM+4ZurnpxJ8t+aLjhMPMETigx/CB4V/gfiHQTOepYw2A==
X-Received: by 2002:a05:600c:4b1f:b0:401:bcec:be3e with SMTP id i31-20020a05600c4b1f00b00401bcecbe3emr598796wmp.17.1693940017155;
        Tue, 05 Sep 2023 11:53:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:36 -0700 (PDT)
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
Subject: [PATCH 09/21] gpiolib: reluctantly provide gpio_device_get_chip()
Date:   Tue,  5 Sep 2023 20:52:57 +0200
Message-Id: <20230905185309.131295-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The process of converting all unauthorized users of struct gpio_chip to
using dedicated struct gpio_device function will be long so in the
meantime we must provide a way of retrieving the pointer to struct
gpio_chip from a GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 18 ++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9715bbc698e9..408f8a7753f9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -246,6 +246,24 @@ int gpio_device_get_base(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_base);
 
+/**
+ * gpio_device_get_chip() - Get the gpio_chip implementation of this GPIO device
+ * @gdev: GPIO device
+ *
+ * Until we can get rid of all non-driver users struct gpio_chip, we must
+ * provide a way of retrieving the pointer to it from struct gpio_device. This
+ * is *NOT* safe as the GPIO API is considered to be hot-unpluggable and the
+ * chip can dissapear at any moment (unlike reference-counted struct
+ * gpio_device).
+ *
+ * Use at your own risk.
+ */
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
+{
+	return gdev->chip;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_chip);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 47906bc56b3d..bb9ec741bfda 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -782,6 +782,7 @@ struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
 /* struct gpio_device getters */
 int gpio_device_get_base(struct gpio_device *gdev);
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.39.2

