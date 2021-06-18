Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC89EC49EA4
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E295613FB
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234501AbhFRVOt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbhFRVOs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:14:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1595DC061574;
        Fri, 18 Jun 2021 14:12:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x14so15769550ljp.7;
        Fri, 18 Jun 2021 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MeY6wV2QzE9NSk+VpIFpZHo+rQw4MCvKxWcvQ8OvFGU=;
        b=ldzX5ODiQl04CIVwHg739Cs2Sj6BldgiRcPzF89bnaKpmEfIH6XA4TRwQdJ2mt8Y7U
         1nX/GxCn1mOyiP/tNgzgpe3LoDJCu8YfKx4shy9SIr+zQ90rsNU9m5e4sfEGiy/3YWe+
         LG8g6XTP0yzZlyuxPr9b3rHZCrAPaX8MKBVqBm3UTYqopC8y416+AYjwz2sh+BZOkTTe
         2qQgLvS4RpDSvhOmwEBBzkpqcnjxtcWbWeL5I9QYxZdrn/TEG+Wgy4Yh8G+5q9gZPBxO
         auWqokaTGdzSw84JEIpxYSi5wfjrJHgXGpXY5UVuENam1MloaYFUSLNB89jp3OA+Kzz7
         kc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeY6wV2QzE9NSk+VpIFpZHo+rQw4MCvKxWcvQ8OvFGU=;
        b=qM+19i6XMH7mgnyQQCqeX3iwZTG9BXqHisIk7UDMm2BzLQV8kqDMf09JB1HUuD9XjP
         LTK+r4KLaYyaVzuc3m64XpIoQM9iIDrkp1OZuFYfRzkVIp7qadEVNqcABseRejJuskSo
         TpvpjJRHbRTI9CvxyyNpBX7Q5+MUciwMHaViTZFhEjHh1C5AYW6kk2uyAB9IGn/gIjf0
         72mzCyRquA+UKDY64cH1ULQzDqRayG5XyYOv+UTjgAyRB48Hwk+ug3W1794OyirGF9x3
         BiRIvGodv6BhlF1wAbIXqQ5YfpeLaknIeGFqxjCkXvf9+Fc1gjkC7Omc6BtNG5h+Gt8j
         ee7g==
X-Gm-Message-State: AOAM530xQXMOPeh216Cp+3XUl74oEXa6nr80Ki67FnXpXILNydsH2CvZ
        wn9/Tc+XtJ1L1A+0xUxR7HQ=
X-Google-Smtp-Source: ABdhPJyNtmQgKHp6+KHVP3Bfj3OBMK62gLUpgyZwtfzSiIgQ9asfhF5OsOLcCgWxi4myUgFFl7ufBg==
X-Received: by 2002:a05:651c:294:: with SMTP id b20mr11492718ljo.156.1624050755432;
        Fri, 18 Jun 2021 14:12:35 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id a8sm1183802ljq.127.2021.06.18.14.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:12:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/4] hwmon: (lm90) Unmask hardware interrupt
Date:   Sat, 19 Jun 2021 00:12:01 +0300
Message-Id: <20210618211202.2938-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618211202.2938-1-digetx@gmail.com>
References: <20210618211202.2938-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The ALERT interrupt is enabled by default after power-on, but it could
be masked by bootloader. For example this is the case on Acer A500 tablet
device. Unmask the hardware interrupt if interrupt is provided.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/hwmon/lm90.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index e7b678a40b39..658b486d2f5e 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1704,6 +1704,13 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	if (data->kind == max6696)
 		config &= ~0x08;
 
+	/*
+	 * Interrupt is enabled by default on reset, but it may be disabled
+	 * by bootloader, unmask it.
+	 */
+	if (client->irq)
+		config &= ~0x80;
+
 	config &= 0xBF;	/* run */
 	lm90_update_confreg(data, config);
 
-- 
2.30.2

