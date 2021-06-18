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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E987BC49EA7
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C4161078
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 21:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbhFRV5q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 17:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234751AbhFRV5p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 17:57:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3E2C06175F;
        Fri, 18 Jun 2021 14:55:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f30so18981696lfj.1;
        Fri, 18 Jun 2021 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MeY6wV2QzE9NSk+VpIFpZHo+rQw4MCvKxWcvQ8OvFGU=;
        b=YdXibpHOgSHnU/hUKAPdKMoTeqx/tW7n64WIU7TtpPR9U4uV4H5MFAsEX5Sh+KorIE
         53omzn7BnM5pDFX/1KUmTkGqqaOxDiinpGsePghga9dWmoN66LCLRoL7XteyVi2zqecf
         PzNxf0EvTzklmlUqlgaBwiGV+4/r6jI0nY77C0XHxcskcTNJej4iUShz+STQaHuP0vDk
         42e3RDSQLg/78+Pj3kwR2JU20aMd16WJ9/6BHFsU6DRPw1sM6Zr7iUafCBXkaTNeksTr
         2FZ5dgb2NSvS+oVFu4smz/hOEseddc2sqZLijSgCrRbvqBO6CTjqLX/Vf52ikfJbkBVP
         UTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MeY6wV2QzE9NSk+VpIFpZHo+rQw4MCvKxWcvQ8OvFGU=;
        b=hDzXnbagdwTfh81+X7ah7pDxBbasDTacDk1G3P0Zk87d+KzON0scJbTVumfvkxwcu6
         4ML3MxE3jKeX4ootHacKUICY9OIiN2UEVrUsiIHjA34RsIYR4EUHTSBDzhbbiXXmuAWJ
         9JolSYqkFI+lbZPvMRQq1zIn0ycAXVhQHW/OIWdclszHz9HkM+p5WLvTT+Nvlz4a7Fjv
         8LW8k0dGLzzyHtCdK6tKc6aSI7hhD03+9HaUMeHisjQZ5QWqQ/uXBsGCQNqhDJEO5TTt
         DXBzJgiZ/jngEZevVgB5EedRQ04ItvvDNlIqCDwEISbfnbVwh2xcb5jEe+AFuDzovnST
         huMw==
X-Gm-Message-State: AOAM533kwOf13o9as5LMyf6p6EfvQRri8Bw5gpO0PXcZqG6lB/5i1/1O
        osC/qbUwGTSAw2/A7Bwsm2Q=
X-Google-Smtp-Source: ABdhPJzzHnxeDGZroUCgjgrm208BDlJcQ4bzqtC9x+fACBEiddckixyyxbx45r894v9YHyR9OOVtig==
X-Received: by 2002:ac2:5581:: with SMTP id v1mr17506lfg.414.1624053332696;
        Fri, 18 Jun 2021 14:55:32 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id b20sm791773ljo.138.2021.06.18.14.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:55:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/4] hwmon: (lm90) Unmask hardware interrupt
Date:   Sat, 19 Jun 2021 00:54:54 +0300
Message-Id: <20210618215455.19986-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618215455.19986-1-digetx@gmail.com>
References: <20210618215455.19986-1-digetx@gmail.com>
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

