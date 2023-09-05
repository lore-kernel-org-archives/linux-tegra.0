Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEC6CA0FFA
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 18:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239504AbjIESzG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 14:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239470AbjIESzF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 14:55:05 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9040A194
        for <linux-tegra@vger.kernel.org>; Tue,  5 Sep 2023 11:54:34 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4013454fa93so28410985e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 05 Sep 2023 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940016; x=1694544816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD8mhbYtSpsp4MugkXhi33yXQT05nfWNxdtLBId4RL8=;
        b=ilV5yCdeRzZ+G5yIoeldAMeJvdL6TejWCwd6BDF10srY/hFvyug/k5w/DpbABu2kuB
         esKaZbpatQxH4BV8YUHRoJfnEZ8iZml3r8QocdOmnTXpd5EbarxqhB+KAPBs8RFJFbpk
         FkqXYWuo7hfzKH0NpOXh6toJVQFtFAgoulvWzpPj1Bd9V7D7JRe40+idqmCj2vU4GvfN
         7C4O3LXRHOKpk9pt8C9JOmogDWJt7fgmcaOUGg/zuQ+LckXuUGahGsMKQWkoLslh2Z8e
         WW2ri+AaMwI+sQbAmlEmxl8D7DuUfWBNLtC3pQRVELrcGofDc9GVqdFIZIHr+0UOzKzU
         rSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940016; x=1694544816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gD8mhbYtSpsp4MugkXhi33yXQT05nfWNxdtLBId4RL8=;
        b=ND5PNwk4e1uHbF+ytEfTwwnm3VGYYmB8+/IfDLvwjIBsN+PLoayTNHzQWLLUVSYJ3H
         n0KKie/xoBS1kFQqbzewK+aT1QaCvpoYqw7QUd3l18J+SZ6xcBpYBhYcxDgHqsivx6ME
         XCBaIWL6ztdEDzXjJrMjtQ69HDvxhLrBm2tRtET/j2Hcbzjuhjw7JUVK5teit1n8QSwC
         G57vYe3PWEWjRRGZHXJMg+7iWHuuVddR3bu/7Q+JywEqdn8kN5AZp+w3mOGY6lCPnkGB
         OY2IMnqyD0UdPcd2LRaWXhVXPMfyyblpz80QulGSNXfCc03NDy5VPV/mn7HoGsb7Vx2O
         alQQ==
X-Gm-Message-State: AOJu0Yya2KD1FMOKx7qhKbMNjzr1XCwag0beSYOdWSn+D9WV3IjjSxSs
        gmN+m6vwKoeF1Flnii66KpLGag==
X-Google-Smtp-Source: AGHT+IFIMVvhNg464qJima4kezuYWuRmRs+hpxgOQnc+URZYC5BvtqpinR7GN44km7chTJtWGj8fDQ==
X-Received: by 2002:a7b:c390:0:b0:401:38dc:8918 with SMTP id s16-20020a7bc390000000b0040138dc8918mr481515wmj.24.1693940015869;
        Tue, 05 Sep 2023 11:53:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:35 -0700 (PDT)
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
Subject: [PATCH 08/21] gpio: acpi: provide acpi_gpio_device_free_interrupts()
Date:   Tue,  5 Sep 2023 20:52:56 +0200
Message-Id: <20230905185309.131295-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're moving away from public functions that take struct gpio_chip as
argument as the chip - unlike struct gpio_device - is owned by its
provider and tied to its lifetime.

Provide an alternative to acpi_gpiochip_free_interrupts().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 29 +++++++++++++++++++++++------
 include/linux/gpio/driver.h | 12 ++++++++++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index fbda452fb4d6..5633e39396bc 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -558,12 +558,9 @@ void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
 }
 EXPORT_SYMBOL_GPL(acpi_gpiochip_request_interrupts);
 
-/**
- * acpi_gpiochip_free_interrupts() - Free GPIO ACPI event interrupts.
- * @chip:      GPIO chip
- *
- * Free interrupts associated with GPIO ACPI event method for the given
- * GPIO chip.
+/*
+ * This function is deprecated, use acpi_gpio_device_free_interrupts()
+ * instead.
  */
 void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
 {
@@ -604,6 +601,26 @@ void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
 }
 EXPORT_SYMBOL_GPL(acpi_gpiochip_free_interrupts);
 
+/**
+ * acpi_gpio_device_free_interrupts() - Free GPIO ACPI event interrupts.
+ * @chip	GPIO device
+ *
+ * Free interrupts associated with GPIO ACPI event method for the given
+ * GPIO device.
+ */
+void acpi_gpio_device_free_interrupts(struct gpio_device *gdev)
+{
+	struct gpio_chip *gc;
+
+	/* TODO: protect gdev->chip once SRCU is in place in GPIOLIB. */
+	gc = gdev->chip;
+	if (!gc)
+		return;
+
+	acpi_gpiochip_free_interrupts(gc);
+}
+EXPORT_SYMBOL_GPL(acpi_gpio_device_free_interrupts);
+
 int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b68b3493b29d..47906bc56b3d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -835,4 +835,16 @@ static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
 	return NULL;
 }
 
+/*
+ * FIXME: Remove this once the only driver that uses it - android tablets -
+ * becomes a good citizen and stops abusing GPIOLIB.
+ */
+#ifdef CONFIG_ACPI
+void acpi_gpio_device_free_interrupts(struct gpio_device *gdev);
+#else
+static inline void acpi_gpio_device_free_interrupts(struct gpio_device *gdev)
+{
+}
+#endif
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.39.2

