Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1442AC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE82123A1C
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:29:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbhAUTTX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbhAUTRz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 14:17:55 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF09FC061788
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 11:16:43 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id p80so3139909ybg.10
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 11:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=uXaJ+OStKaU1TSDiW6h4CbV+WkJ9mG9O+r64LsV2Mn0=;
        b=eYA5oY8hKyFgrd6TaGKQAuh6YxqMlqPxpbJ8pyoyuBQ5PnSRAWEUsOSfVIlKlrnTNe
         1g9UPvefodcMNDtEPBEVZO417AdPQEKhx4hr9piNifguWGsv4TKREN42AXZzhMzK9/Pv
         ixaynA7Sd0OdpCfDWG+36lcv/ab/sSQE2olYxokM9JRdaDHeEbW8pE9Sg5rrPc4H3YjU
         cwK/ti8L3uMXvyX6jMTKTQx3IEddmzePDlcylcPGlkZkp60JX3KEGnYxxtO63Q8m9ckF
         dNphdkfdARYdmL25bczQDMud97R+KKV6D91nxyiHcUxDJbUzJWW+BjgdiPzlxbM4he64
         C+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uXaJ+OStKaU1TSDiW6h4CbV+WkJ9mG9O+r64LsV2Mn0=;
        b=gyTU6EoSehfxScRCavjFaduEzRwIJudmI5DQH+NVWAKBLmmWxqihiBCkbKOxLwaxuC
         WAXz+cDNY2tNAqWgCR7Rz5wWqNB7wlf7IupaliU2/zxcFIip4DQelJXWI+T0yO7mNAbY
         fk99l/Supg6vpK7zpANTwbjIdSfiUUBAbBI+6dR0Tib275gQmIfCrahPYbo9L8RWSvXT
         NfUfx/H1003ISh8X1tB2FEP8NbjAz0zgVh7tMpiLReTjbxfNZlV2oeMDsm76gnUP8GDK
         6AZ2dJ9DC5b9Q4hCRaoTAVUJeV+0cDsr9Zx7zRmoNnOfR2603nAh3KaU1zEZ1skUj7jJ
         cSCw==
X-Gm-Message-State: AOAM531ftf3Zz6ojD4qSGV3hbX20K6Me8IddiBXiH9hkO5KFZdxU7xd3
        Str/n4TxWPwifAEUucp97wRBN+SjivmSuP8=
X-Google-Smtp-Source: ABdhPJy4L6QwhSe0V+bSgCGU7lb6sP9PuorwKblCURljHt9RwnFbXh8XjG13AZV/uRwJfoVT4D3nP1Zn8jH2KNU=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a25:243:: with SMTP id
 64mr1209671ybc.257.1611256603164; Thu, 21 Jan 2021 11:16:43 -0800 (PST)
Date:   Thu, 21 Jan 2021 11:16:36 -0800
In-Reply-To: <20210121191637.1067630-1-saravanak@google.com>
Message-Id: <20210121191637.1067630-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210121191637.1067630-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
Subject: [PATCH v2 1/2] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel-team@android.com, linux-tegra <linux-tegra@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

To provide backward compatibility for boards that use deprecated DT
bindings, we need to add fw_devlink support for "gpio" and "gpios".

We also need to ignore these properties on nodes with "gpio-hog"
property because their gpio[s] are all supplied by the parent node.

Cc: linux-tegra <linux-tegra@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 5f9eed79a8aa..b2ea1951d937 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1271,6 +1271,28 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
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
+	/*
+	 * Ignore node with gpio-hog property since its gpios are all provided
+	 * by its parent.
+	 */
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
@@ -1296,6 +1318,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_pinctrl6, },
 	{ .parse_prop = parse_pinctrl7, },
 	{ .parse_prop = parse_pinctrl8, },
+	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.30.0.296.g2bfb1c46d8-goog

