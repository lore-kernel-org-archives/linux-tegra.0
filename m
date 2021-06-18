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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4524DC49361
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2690661279
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234472AbhFRVOr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234467AbhFRVOq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:14:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7AEC06175F;
        Fri, 18 Jun 2021 14:12:35 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f30so18829260lfj.1;
        Fri, 18 Jun 2021 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kKcZ2vbUbM/pJhKwlOaZ6pdbjwD5t3Uzj7fgtFpJ6xs=;
        b=a4J6pCs8jf/mXp1gt1PbdaaWuPLOfiy/HGAXZjhOyWIkJh325F6wFgAAZfYDKw6D58
         B7Ljomgr0CRGLAHfz4srDdHGupAoCsvTowdDDkGVpq6TzsQsfhPexUbKerYY1ywy9mY2
         0hsJswJUrMyNwfZugcYXheFRMk8ozE1r0W8vcMSjnE+ARaZmuxS7acjmAOyq1oLVCaz1
         3UoWt82YAnGWdWP38WDp6MDz4vtBhEK4xzZP1wFxlQBRgaApfHG6zsOBTZR81aa1B9ZB
         vORBf+iyneZ8dujnMmnbq5dY1UnwVUwJmn3HH6JYDZzZkgVbKaONzGsckP+ua5oNuo9b
         6m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kKcZ2vbUbM/pJhKwlOaZ6pdbjwD5t3Uzj7fgtFpJ6xs=;
        b=CPtHoLdRIM1Dml4P/MCWTNwpdjnxTwmlaUkQAinv9fG/6+wXtkVK2B8tf0DZYnjZJ7
         bT8mTwbQNb3a92P0te7yso9u5JA+HEwiOawxmnpj9m9/Urh8/ICFNAI5ApBih7fKyRTX
         EDLZosSQiNC4gDKLBtrzH03KYSG6gqTBp06aWoiN+KgnjrYG5ufuZQpN/C5Gx7O0VYla
         JMw64jTn/+1OcLcAfoPVW7H6K2YfHyQaDDnuaDlLZBwdZ1dViOg4i7reIiaAwEqFk1GH
         MXpSDThysmJV/LAXp9kxWShgNGvMQ5XaM+7PrBhE+Wowkves47TYmIM17YThBOAURjYO
         mfog==
X-Gm-Message-State: AOAM533DfdZ4r3k4tzE1KRIEb747AsiRhQiEYxgatyUDwu6hhXg7q7o9
        ypTecTcl4wNZIVu3aVvDROc=
X-Google-Smtp-Source: ABdhPJxP8ZhhB2lnOpXIthDZVK5CNgb8tZ1VyHkBTDAj9s5L5PVSHv9SVR5MNtlgHMKeCJRvRYBXQg==
X-Received: by 2002:ac2:5e2f:: with SMTP id o15mr4880140lfg.354.1624050754240;
        Fri, 18 Jun 2021 14:12:34 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id a8sm1183802ljq.127.2021.06.18.14.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:12:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/4] hwmon: (lm90) Don't override interrupt trigger type
Date:   Sat, 19 Jun 2021 00:11:59 +0300
Message-Id: <20210618211202.2938-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618211202.2938-1-digetx@gmail.com>
References: <20210618211202.2938-1-digetx@gmail.com>
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

