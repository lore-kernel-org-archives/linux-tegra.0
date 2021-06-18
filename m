Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0067CC49EAF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB67861205
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbhFRV5r (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbhFRV5q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:57:46 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BF5C061574;
        Fri, 18 Jun 2021 14:55:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id p7so18854107lfg.4;
        Fri, 18 Jun 2021 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yt0BSTexIurBcE0nAITbWkaUHmp5dbQZvjYenG8vIbg=;
        b=DZduqRBHS/BOblgyH4GnfiEpqmMJfg8F9fekED1mVx2aYZLKo0+hBF/ZIulpmrl1XG
         wlj4HdU3Jub009AZWpcZLnV81EdXyBHunMiiqniyM2wXIh4s2qWeHHetbE4F7SuzpD3F
         AnJx6//uKD51oZcMZCXP1wYNYAEwj9+oc37uStVOZVECmNkM46szWFWLCCi3E5z5GZ5+
         wQuhKJR9G39w5ZnY0JvUD+Ik4PnWv9my1yqaDB30WHzykVmN5gHz8i6+Kb3oqCUhBCLc
         JXzhF8qN5fOAhcHpVqQK7hOAAQVpVfL1YcAGMQpVfxVNphz737henKoRwhkaKFznkWWf
         0hGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yt0BSTexIurBcE0nAITbWkaUHmp5dbQZvjYenG8vIbg=;
        b=t132fIvMbf5HzJ20SP+DG85UtZSEwBRYVhuJMLVKiLLdBLzk3gd/1LWCjGFy9iBa+v
         iIiJhjqBt9mvWNRVoyJrPPur2Vk7IuA+WLsw0Pk2OqE99R7KS/VK84t51XcQcuZ/B4RB
         IEyIMxqv7SKblSF9+3CXS4Zo9zvy+TipHYOhHnmwND1O2ExtUg1mkyI9tyjo/GbuB6r3
         ZWPYVZjeH+gDSpvmIxn+2uMExQD/Cs2cfROuAR0SeCKOTIE02HkJ5QfgbVt8eFeNoZoa
         2wl5R9yau77R3/7Wl1Wb8Gz78zTJcq+e25Eawh3x/FPa5jLbJ2fUZ9Z1X50x39xbISbP
         /ksg==
X-Gm-Message-State: AOAM533R5XPJRfQ4a61eYtvwcZ9mTzgTMmkPKaPcnnPuRZmg75/sqEq0
        Aajf/uB+EmyvSmgzs0G7vSU=
X-Google-Smtp-Source: ABdhPJxg9vKgC6+4txTLCB63suNJLKxw/Vh/JDODYms7X6iJLlT4M2vfsR9KAsL3FDF2JjOC0efIYA==
X-Received: by 2002:a05:6512:ad6:: with SMTP id n22mr4830694lfu.114.1624053333342;
        Fri, 18 Jun 2021 14:55:33 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id b20sm791773ljo.138.2021.06.18.14.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:55:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/4] hwmon: (lm90) Disable interrupt on suspend
Date:   Sat, 19 Jun 2021 00:54:55 +0300
Message-Id: <20210618215455.19986-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618215455.19986-1-digetx@gmail.com>
References: <20210618215455.19986-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I2C accesses are prohibited and will error out after suspending of the
I2C controller, hence we need to ensure that interrupt won't fire on
suspend when it's too late. Disable interrupt across suspend/resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/hwmon/lm90.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 658b486d2f5e..b53f17511b05 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1973,11 +1973,36 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 	}
 }
 
+static int __maybe_unused lm90_suspend(struct device *dev)
+{
+	struct lm90_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+
+	if (client->irq)
+		disable_irq(client->irq);
+
+	return 0;
+}
+
+static int __maybe_unused lm90_resume(struct device *dev)
+{
+	struct lm90_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+
+	if (client->irq)
+		enable_irq(client->irq);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(lm90_pm_ops, lm90_suspend, lm90_resume);
+
 static struct i2c_driver lm90_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm90",
 		.of_match_table = of_match_ptr(lm90_of_match),
+		.pm	= &lm90_pm_ops,
 	},
 	.probe_new	= lm90_probe,
 	.alert		= lm90_alert,
-- 
2.30.2

