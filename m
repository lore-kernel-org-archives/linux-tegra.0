Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB7BCA0FFE
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 19:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240996AbjIETAa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbjIETAT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 15:00:19 -0400
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CF919A6
        for <linux-tegra@vger.kernel.org>; Tue,  5 Sep 2023 11:59:54 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40037db2fe7so28206395e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 05 Sep 2023 11:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940014; x=1694544814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=McARVDmmerEY5wHGnfSVduhuNUmGbxJFUYE82GX2LGMBEzTnsykwiuevbEzqd7cL/R
         8sbqPOpfD3tsTqcGab3+HiR06TgCiTRw4EaWIIlsQSwd+dO3+XgF7I+8QiUV9D1nV+pD
         R1EKI2HerjznBaxEEB52EHOQvC+iPfMNb7fo9s/n5tGlUgQ9sSZIT0ba7L+1TSWAEHb/
         8k9hEbTxfwgxiEXhuKyvFEsaqQQ8W7zrWAiynm0pZzxOGb4oIsEMjITbDm4MldR8XWCh
         qZ/VPjuVYVbIgn0l8HFm6ZJgqPVabay/Cp5Y1nKRBybc45MhpUi7JFXsj55+MQXj1E60
         UcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940014; x=1694544814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=mE8w99tnueYLTVit9jcD+27PvsWs/5c47c7JBXgPxJP3jkwkAnvo8dVnIHSz6/CU0i
         5izc07oM9wt5TYcOi9savMACxtaJJuNLTQ8UWqgdzsECKfEgLSpvSeu2qoQHWBhdQ7F7
         pe4OwBOFVIsmoLx1qSqVcHbkewnSMHcSKioDuQk3yorHDfczBIPAEKeZzNai5TcpVaP7
         7oN9OFZERb2FjvK0nckj7+htFIQLEnpQFB1+t2VMFbOJ9V8rD4+SkvNWmo4RhIcIHqR9
         A+rdrjlqjxdvTE12SpvJCbtoBOC8HbbW8jQlBVCyVxFy8gEF8RVXaL4luA4W1ZSHcsT3
         dwkw==
X-Gm-Message-State: AOJu0YwhjVK4q1dzEirNdS3KW8QrxGjybn0Y2WOjVtjeqjqPNetASY03
        Sg9oz61G/1b9S9Crrq2nGmlZlg==
X-Google-Smtp-Source: AGHT+IGj2EuAvHtXRXD8rdSvHdyQNmCzp7/4dD7j6aPqgw+n/kXSu9aLQQjPpRIFRE646UdFzsOLag==
X-Received: by 2002:adf:e0c5:0:b0:319:6b6c:dd01 with SMTP id m5-20020adfe0c5000000b003196b6cdd01mr477303wri.17.1693940014702;
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
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
Subject: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
Date:   Tue,  5 Sep 2023 20:52:55 +0200
Message-Id: <20230905185309.131295-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's start adding getters for the opaque struct gpio_device. Start with
a function allowing to retrieve the base GPIO number.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 13 +++++++++++++
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9637a79a9a60..9715bbc698e9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -233,6 +233,19 @@ struct gpio_device *gpiod_to_device(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_device);
 
+/**
+ * gpio_device_get_base() - Get the base GPIO number allocated by this device
+ * @gdev: GPIO device
+ *
+ * Returns:
+ * First GPIO number in the global GPIO numberspace for this device.
+ */
+int gpio_device_get_base(struct gpio_device *gdev)
+{
+	return gdev->base;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_base);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e3747e730ed1..b68b3493b29d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -780,6 +780,9 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
+/* struct gpio_device getters */
+int gpio_device_get_base(struct gpio_device *gdev);
+
 #else /* CONFIG_GPIOLIB */
 
 #include <linux/err.h>
-- 
2.39.2

