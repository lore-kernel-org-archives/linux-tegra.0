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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A41C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 22:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 654C223A5E
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 22:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbhAUW6w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 17:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbhAUW6t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 17:58:49 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D32E4C061788
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 14:57:18 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id z19so2455201qtv.20
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 14:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=uXaJ+OStKaU1TSDiW6h4CbV+WkJ9mG9O+r64LsV2Mn0=;
        b=nmTtBqSvr08bFOptKNcnSwo1YDeMJkZzF68xQek9c3YINaVsmTMySUDd2xXtLvWxWZ
         tjLmThb8Lfo+sR5bmrD4iEyakM5OrmBzghsoGrYqzxf/PKZd2CvPBvLi+n/9gOWDbezO
         2e9kqUbeB00crKhHvlMJV9haXkGiaj0dAGkXdLm1XIxUOTvqLBMQSSF51OQ4AE9yDmwS
         DbvR3N1OiBNp1pOlE7TzGuGzqafNrowIP6/fhh3Uga6Z5mQKviWaB1gszrOkJgxDPtfq
         JgnT5LBRTxx+ipdKzvzSh1efd2VLLeCInjPxZoOTraBeMlQvCdZLHppUdXp0dv/EO2F5
         x5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uXaJ+OStKaU1TSDiW6h4CbV+WkJ9mG9O+r64LsV2Mn0=;
        b=EsvA1Gq1AdniJfgBATDgHwzg23hDs8EN5Vpc8nMyYkAf4tzLixAwtLkpIdR8WoUO6l
         lhWGLS/Uw2pyGo5GUYywJTMLJ5kya1oQGhxKhOfus34MLcUqlIf7h3aWDQ9vuYtCg8tW
         gF4YIH9RbZBITDywjLec0+QLTae658G3GxdJ5E/LY8Jkp3pKnUpEqcx3dFyViXcOY+QQ
         NOxdTGjj7XU3+flxYLGWcmOFJ5a2h3agPz7VUbg1KklAL9nBDCPmqMlk5Pz7wXxFjqNz
         dzzWNjBqcQzLANkn5pAsdzlpOkj/BfJEGmlWMcWTCEpr83gg1fD1rC/iNs0wIbTzlW41
         cwjg==
X-Gm-Message-State: AOAM531V1fLwoHcTO4f4e4sWCi8H3WlqGU8nuDIJx8/dJ/VgHPnqpXpF
        MimC0vw10BXv/LKn6MAT4r4P1a0FyMUqVEg=
X-Google-Smtp-Source: ABdhPJzZsp+6O4qLnPlS0yerTYDKRtyqqRjS5GVEnuxz1NCmThN07PoGdf5AN1Xru0GR5/LMb7l7tU/mTL9+x1U=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:ad4:5a53:: with SMTP id
 ej19mr1822719qvb.61.1611269837945; Thu, 21 Jan 2021 14:57:17 -0800 (PST)
Date:   Thu, 21 Jan 2021 14:57:11 -0800
In-Reply-To: <20210121225712.1118239-1-saravanak@google.com>
Message-Id: <20210121225712.1118239-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v2 1/2] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, kernel-team@android.com,
        Rob Herring <robh@kernel.org>,
        Thierry Reding <treding@nvidia.com>
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

