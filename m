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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002CBC49361
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E034461078
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhFRV5n (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbhFRV5n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:57:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F37C06175F;
        Fri, 18 Jun 2021 14:55:33 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id h4so18935225lfu.8;
        Fri, 18 Jun 2021 14:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKcZ2vbUbM/pJhKwlOaZ6pdbjwD5t3Uzj7fgtFpJ6xs=;
        b=fKYZgAUqwQnNEvDREcpzB/9wiGHrUFlbsJVHAjXSzK9ZxuY5CEgORlzSwcRXo1e3nX
         o8j7yHv6q4zT6AECF0IC8n7Cp5Byo+C72Yre/g5QRsutGkCipKGTEdS11dHx/5T+gb35
         VRGeyUB8PX9A1ojquRzH+ZW0iuIr0rJaHSf/fXdjV5eV9Ebrh4qBcv4hzdLEK9TzZ8ZF
         tzKViRYws6ElQD002lnSW3mSIhI99QKq0j0na/OYHwpfI+ZCbH3jkTFz8ER+XxfOPr/7
         +SxCSKPg02ZmGd0eeMwivMWQsHD6Y81oVPmCLeq0Q53Mf959z/cxE6GzHSWbfpQrpXw3
         s+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKcZ2vbUbM/pJhKwlOaZ6pdbjwD5t3Uzj7fgtFpJ6xs=;
        b=o0Qc6Tw2KR6gtW6JHB6XUH6a2vY2t2GKLRzndT9WjIP4ZzeuMQo+okcx+9bD47p5zW
         yuAOe/i15d+kZqu7/ej09o/JDKvMHVzfEsFfPPm+5PDKWifdxI0A0HEZiJmQGoa6smFy
         2IHNgsggFdoKyBugfyZDlZkP3YpsFziQFov2lWrSDdKwX278cyGqS/TZn1LWFlJcfiq2
         8C6RJ4FC314UK7kChdtjmFYlOL+sLbw8b7ifXsyIQCMDPnb4S2tggVM0FHB0RUV8DwiC
         3PUdHK8lh2fkYPd19aimDQ/7bVDDh5+F92qs9UjNEkqY/jy24oAQB5QMdp116W/4l9Rs
         JXwA==
X-Gm-Message-State: AOAM5306spL/d25KPAMzgvIMv9AfevAu4XmTVTfO5GTT7eaCG2lPWA0J
        aFsQcwjCUtFsOXvGzCSVBUo=
X-Google-Smtp-Source: ABdhPJxRXyk9N4AEyZfdLo3qAbMJne981qg9gHvQXB7NMJVLqCsk4+XjTC2++sdDiI+sraoqly8sFQ==
X-Received: by 2002:a19:c34a:: with SMTP id t71mr4590014lff.499.1624053331443;
        Fri, 18 Jun 2021 14:55:31 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id b20sm791773ljo.138.2021.06.18.14.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:55:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 1/4] hwmon: (lm90) Don't override interrupt trigger type
Date:   Sat, 19 Jun 2021 00:54:52 +0300
Message-Id: <20210618215455.19986-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618215455.19986-1-digetx@gmail.com>
References: <20210618215455.19986-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The lm90 driver sets interrupt trigger type to level-low. This type is
not suitable for sensors like NCT1008 that don't deassert interrupt line
until temperature is back to normal, resulting in interrupt storm. The
appropriate trigger type should come from OF device description and
currently it's overridden by the driver's trigger type. Don't specify
the trigger type in the driver code, letting interrupt core to use the
device-specific trigger type.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/hwmon/lm90.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index ebbfd5f352c0..2e057fad05b4 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1908,8 +1908,7 @@ static int lm90_probe(struct i2c_client *client)
 		dev_dbg(dev, "IRQ: %d\n", client->irq);
 		err = devm_request_threaded_irq(dev, client->irq,
 						NULL, lm90_irq_thread,
-						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-						"lm90", client);
+						IRQF_ONESHOT, "lm90", client);
 		if (err < 0) {
 			dev_err(dev, "cannot request IRQ %d\n", client->irq);
 			return err;
-- 
2.30.2

