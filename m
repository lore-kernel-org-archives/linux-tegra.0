Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182F8CA0FFF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 19:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjIETKj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbjIETKi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 15:10:38 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E7910C9
        for <linux-tegra@vger.kernel.org>; Tue,  5 Sep 2023 12:10:08 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso4073747a12.0
        for <linux-tegra@vger.kernel.org>; Tue, 05 Sep 2023 12:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940952; x=1694545752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPYbcmhlviFwWzuYOu9Z0ne7hiPspJP6iTCWdpKZ06M=;
        b=M6dDKLce2kyXlsWViC6NGFPhJDm0u1Xi6awNKIQjlnKv2yfFAxhHF66nOJRXbOF5VO
         mxxn/ZV8qNyXrQnhpolrTTctfSD14s02EVC7yi283mVCIyniv/36JFcu21wtnCBUODZ6
         Qf8VOEfVxnTV6g66T3s6NIbQGQ1y0IahDlrgYcWEOUwEMDi+r71jIO9XGkdt1bn3OBkp
         NPawUWoG2EG3S5nXIpXtx1qsYpyRa4CwKsXmWo308HR9HoBPBOSH3eHcyJRtJ2cGUlxV
         tyeDH6NRe4A8ZXjvuNvSwfMFyTVOjG2YXRjU2skKGVpvJQZ3fKU0a27dCEkcJFUoIwOn
         n0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940952; x=1694545752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPYbcmhlviFwWzuYOu9Z0ne7hiPspJP6iTCWdpKZ06M=;
        b=gwbnWJoArsdVHiRvJqvDN7HGghQ6BCSGCDRfThrbEfheDYDj0pFXutgZzH+0mjKcBL
         Uov7w+FeiWxRpS8XYC0EZHemxiOAMUU2iK+xz3UjJ+uq6xobOF6ES+7iShRmZMJ0JToJ
         zUvvGviqTa2QpOnYPOg3+XdGIh971Dw3Y2umejdrWYLxp96d8VJZyDoAv8hjdlZ4bshJ
         YimpcT+WgDUzPQFb7OhBKuw7lftxbJBA1m8x/Pq0lhtxbBk382cVZQgmd12+Jh57UMmW
         FyGaep2pW9yCz46Qv1efiHl5Gn1s5YbK+VBeWHspuHW8PPXlLONQiF+tmKORx/FW8MRV
         cqrg==
X-Gm-Message-State: AOJu0Yz/2xlSd6sSAAJKmphxhqq63tbEoeCELI+aPiFV5i6xN+w9z0FZ
        8smQmL89m9HFoa0UQxSWXekWTD3G7sZsxAAse0k=
X-Google-Smtp-Source: AGHT+IH7bFhmwhJkbEP09mNLLK4toqHl75c1c56y8lKZfC2ULSFpMzvdc2De5dyozg7UIqDbZnvopw==
X-Received: by 2002:a7b:cb96:0:b0:3fe:d6bf:f314 with SMTP id m22-20020a7bcb96000000b003fed6bff314mr414148wmi.39.1693940021910;
        Tue, 05 Sep 2023 11:53:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:41 -0700 (PDT)
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
Subject: [PATCH 13/21] hte: tegra194: improve the GPIO-related comment
Date:   Tue,  5 Sep 2023 20:53:01 +0200
Message-Id: <20230905185309.131295-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Using any of the GPIO interfaces using the global numberspace is
deprecated. Make it clear in the comment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hte/hte-tegra194.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 6fe6897047ac..9fd3c00ff695 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip *gc,
 		return -EINVAL;
 
 	/*
+	 * GPIO consumers can access GPIOs in two ways:
 	 *
-	 * There are two paths GPIO consumers can take as follows:
-	 * 1) The consumer (gpiolib-cdev for example) which uses GPIO global
-	 * number which gets assigned run time.
-	 * 2) The consumer passing GPIO from the DT which is assigned
-	 * statically for example by using TEGRA194_AON_GPIO gpio DT binding.
+	 * 1) Using the global GPIO numberspace.
+	 *
+	 * This is the old, now DEPRECATED method and should not be used in
+	 * new code. TODO: Check if tegra is even concerned by this.
+	 *
+	 * 2) Using GPIO descriptors that can be assigned to consumer devices
+	 * using device-tree, ACPI or lookup tables.
 	 *
 	 * The code below addresses both the consumer use cases and maps into
 	 * HTE/GTE namespace.
-- 
2.39.2

