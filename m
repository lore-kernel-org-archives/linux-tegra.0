Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EC3C48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48D75613F7
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbhFRVOr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234475AbhFRVOr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:14:47 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C13C061760;
        Fri, 18 Jun 2021 14:12:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id d16so11328960lfn.3;
        Fri, 18 Jun 2021 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cHKKGqG+HiXcNhiKSAaNM3Q7s/meJMLf7e7j2Dmgl90=;
        b=fvUULSdxWtZ1ILUwSFyZ70+RrcBuw2JRq0wedlv4hwjXOX/a0sRFNRlxb/q5jdUEEg
         2vBBCQqaSCgPQYze6BtLUjZWgb0btpR4x7FhY9pLwnxCYJviYz1USgfRXSzDqvhDTHEg
         FqqYw6jh68zDVexJqDidmI4Y/geDsjFkLjw6D8080h09Tmtyu5+MJTrgcSAsoLg2/HUZ
         Ztt4fJYNcRuDr33/brdFjiIPuc6iMuKQOGvRfbLJBXQT4bOvnp/FCeyps5tmKxp9SNE6
         Zzze0ParrEsFBepiKWNkcjV5RvVN07duFB+ZNZFZvfqqGUcBZz/INbwNRzISZ2kD4Wo/
         x53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cHKKGqG+HiXcNhiKSAaNM3Q7s/meJMLf7e7j2Dmgl90=;
        b=lUlykrk+q9CMn3UcdladRZc2FeLYvD3dkSePd4UPFM6AvS1NTQ6fTLbD+2AD13FUwI
         2gEFFCw2vAu7TqDYzhhc4ApFVLHyr3EjOVNQu326kZS/NriuorrqTvDmWgZswv6S9V8D
         R4LNhBWW7qMGZ4yKocHsMvcBul4wz8gI/ETmCDdetWrMR9KfkQFyf2s5SApIAumnb6My
         bk4FCT4q+lz8KXk1cd/FdFnMzMo/3AAZEalhEwAFMz8PqFUpBz1seRupN5N1XSgkgM2s
         VEXJa9aFW7paJbTwVfV2zpPDkFKAX/+NNUjp7fKOGIPJ1D+/RV0yZg5C5OLGrgkf6JPr
         MEdA==
X-Gm-Message-State: AOAM5333w+oQ87pAQ+YpO7JNO3DOzFwakNra3g9evod4IviiTGrx7CFZ
        AGCXfihLym/FRnlgZSSd0+I=
X-Google-Smtp-Source: ABdhPJxjhyo5zFnR12fwifKNGPlQcXw7BPgEF3CetyjoTrPmnviehARJxU2hYdDXod0Vrmc4Z3Jurg==
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr4291830lfr.365.1624050754813;
        Fri, 18 Jun 2021 14:12:34 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id a8sm1183802ljq.127.2021.06.18.14.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:12:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/4] hwmon: (lm90) Use hwmon_notify_event()
Date:   Sat, 19 Jun 2021 00:12:00 +0300
Message-Id: <20210618211202.2938-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618211202.2938-1-digetx@gmail.com>
References: <20210618211202.2938-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use hwmon_notify_event() to notify userspace and thermal core about
temperature changes.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/hwmon/lm90.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 2e057fad05b4..e7b678a40b39 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -465,6 +465,7 @@ enum lm90_temp11_reg_index {
 
 struct lm90_data {
 	struct i2c_client *client;
+	struct device *hwmon_dev;
 	u32 channel_config[4];
 	struct hwmon_channel_info temp_info;
 	const struct hwmon_channel_info *info[3];
@@ -1731,22 +1732,41 @@ static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
 
 	if ((st & (LM90_STATUS_LLOW | LM90_STATUS_LHIGH | LM90_STATUS_LTHRM)) ||
 	    (st2 & MAX6696_STATUS2_LOT2))
-		dev_warn(&client->dev,
-			 "temp%d out of range, please check!\n", 1);
+		dev_dbg(&client->dev,
+			"temp%d out of range, please check!\n", 1);
 	if ((st & (LM90_STATUS_RLOW | LM90_STATUS_RHIGH | LM90_STATUS_RTHRM)) ||
 	    (st2 & MAX6696_STATUS2_ROT2))
-		dev_warn(&client->dev,
-			 "temp%d out of range, please check!\n", 2);
+		dev_dbg(&client->dev,
+			"temp%d out of range, please check!\n", 2);
 	if (st & LM90_STATUS_ROPEN)
-		dev_warn(&client->dev,
-			 "temp%d diode open, please check!\n", 2);
+		dev_dbg(&client->dev,
+			"temp%d diode open, please check!\n", 2);
 	if (st2 & (MAX6696_STATUS2_R2LOW | MAX6696_STATUS2_R2HIGH |
 		   MAX6696_STATUS2_R2THRM | MAX6696_STATUS2_R2OT2))
-		dev_warn(&client->dev,
-			 "temp%d out of range, please check!\n", 3);
+		dev_dbg(&client->dev,
+			"temp%d out of range, please check!\n", 3);
 	if (st2 & MAX6696_STATUS2_R2OPEN)
-		dev_warn(&client->dev,
-			 "temp%d diode open, please check!\n", 3);
+		dev_dbg(&client->dev,
+			"temp%d diode open, please check!\n", 3);
+
+	if (st & LM90_STATUS_LLOW)
+		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+				   hwmon_temp_min, 0);
+	if (st & LM90_STATUS_RLOW)
+		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+				   hwmon_temp_min, 1);
+	if (st2 & MAX6696_STATUS2_R2LOW)
+		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+				   hwmon_temp_min, 2);
+	if (st & LM90_STATUS_LHIGH)
+		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+				   hwmon_temp_max, 0);
+	if (st & LM90_STATUS_RHIGH)
+		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+				   hwmon_temp_max, 1);
+	if (st2 & MAX6696_STATUS2_R2HIGH)
+		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
+				   hwmon_temp_max, 2);
 
 	return true;
 }
@@ -1904,6 +1924,8 @@ static int lm90_probe(struct i2c_client *client)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
+	data->hwmon_dev = hwmon_dev;
+
 	if (client->irq) {
 		dev_dbg(dev, "IRQ: %d\n", client->irq);
 		err = devm_request_threaded_irq(dev, client->irq,
@@ -1940,7 +1962,7 @@ static void lm90_alert(struct i2c_client *client, enum i2c_alert_protocol type,
 			lm90_update_confreg(data, data->config | 0x80);
 		}
 	} else {
-		dev_info(&client->dev, "Everything OK\n");
+		dev_dbg(&client->dev, "Everything OK\n");
 	}
 }
 
-- 
2.30.2

