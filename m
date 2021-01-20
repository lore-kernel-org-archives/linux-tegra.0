Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36A9C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9912023131
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbhATHd7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 02:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbhATHd4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 02:33:56 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD767C061575
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 23:33:14 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id b62so19532194ybg.1
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 23:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=ntIoASCRpCylyuUWo1BxH783z7pAgM+MQ2ilEpRkz7U=;
        b=BnUV3D1wMPwn8m5vQQJGnS+fi7DxxuEzsF9ZkKD76GNjqyPz6FWg+2C0rZ+BxXyJOY
         IEBUx/mqJVeen2ie16qdOpNeLzVQp4pdB3s77QDKY5uHcsinusbJoNfEvJBDGWL6UxRr
         SIegZIhrV+NuAZFrjuUAEXHa0RZZ4gpo+N1S/1DsW8oCknaa7Cz3gSY2hBRaz40+CNni
         5HJnxF5oLfgsGttUM9odNEAaDJNAVg0MSjanbsfnTYUj8YsmhEk3LO+wH6rrTpx6XSP4
         NXW4cNDYsQ/6jLEsBXCOxF0pNZFJyLBqivkfXalVs8LVzmYAppJObW+inzVsq0oj5D4X
         vGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=ntIoASCRpCylyuUWo1BxH783z7pAgM+MQ2ilEpRkz7U=;
        b=KwEXAvoPGi2Mz5wuI6gRxETa0JcMwW/vncepTjD7PlgAmwU0rd+rOpThS096AD0q5j
         nvZtYtTj/WQQY6Jxogj3YxksUaGyqrWITsSB97oqiWIo4vI6935RJC7+o0+cNXiUszse
         zgCY1dyc+nKrAHfdXHWMGCl034vld9ZGjyF/13Gz1MnVlpZqX8irVSR4sadLACmg1quc
         w9SI4/zEu2ZALIsC9GAgrmAPCPhivIVkMKkyrQdT72dKLYizFNJImNHSzLR3pMuRbbI+
         ejHF6GnMCYVeLCCMQAICIrqGA5CyRnUMQunhGJNYESTMxHT1/S8R5K2Ip8gllHzC4KOZ
         QwBg==
X-Gm-Message-State: AOAM532YyZB9tSUx57tVdVRCA8xGHoO6GO1TgDAEgr/HO++p5fbrEK8y
        LL3BK52Sai46fy55I7kJdoLApO9JIF7w81Y=
X-Google-Smtp-Source: ABdhPJwWGWyiO5qbE/66ge8P3yQHzvAv7rV3wY8ILg2lDtmrlx3YyCIIQ4uvpFAioq+ts76QFrU8AffluFkZn1o=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a05:6902:6b0:: with SMTP id
 j16mr6982454ybt.169.1611127993976; Tue, 19 Jan 2021 23:33:13 -0800 (PST)
Date:   Tue, 19 Jan 2021 23:33:09 -0800
Message-Id: <20210120073310.427462-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v2] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-tegra <linux-tegra@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>, kernel-team@android.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

To provide backward compatibility for boards that use deprecated DT
bindings, we need to add fw_devlink support for "gpio" and "gpios".

Cc: linux-tegra <linux-tegra@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
Greg/Rob,

I think it's better for this to go into driver-core-next because this
fixed fw_devlink=on change that's queued for 5.12-rcX.

-Saravana

 drivers/of/property.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 5f9eed79a8aa..0b256ce9d7d5 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1271,6 +1271,24 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
 	return of_parse_phandle(np, prop_name, (index * 4) + 1);
 }
 
+static struct device_node *parse_gpio_compat(struct device_node *np,
+					     const char *prop_name, int index)
+{
+	struct of_phandle_args sup_args;
+
+	if (strcmp(prop_name, "gpio") && strcmp(prop_name, "gpios"))
+		return NULL;
+
+	if (of_find_property(np, "gpio-hog", NULL))
+		return NULL;
+
+	if (of_parse_phandle_with_args(np, prop_name, "#gpio-cells", index,
+				       &sup_args))
+		return NULL;
+
+	return sup_args.np;
+}
+
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
@@ -1296,6 +1314,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_pinctrl6, },
 	{ .parse_prop = parse_pinctrl7, },
 	{ .parse_prop = parse_pinctrl8, },
+	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.30.0.284.gd98b1dd5eaa7-goog

