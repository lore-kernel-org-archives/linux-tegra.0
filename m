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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F267C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 08:07:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D2682313A
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 08:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbhATIHU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 03:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730526AbhATIGI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 03:06:08 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5970AC0613CF
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 00:05:28 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id 188so22902902qkh.7
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 00:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=uGaUoM+E9lfomuo5VcB6+FBCFYFJdpblUN9bMb0KEQ8=;
        b=WXFajYaCVStBAKnz0wmB2RrIJ38/1vH//mTVPlMPb41/IhwYJkh+lPTxY4cx0w0w50
         fArOq6D2XgX0y4Bo3onEcnRQ9phEiUsLnrfusOxat89NlAdQQm9p93P4AzfVIha1z/t9
         QrXpm97SWljygpeLIS6G+W41y/CcfX8285AT/dVcGidwhI6PKrlOmv2qv4FlYlavSNle
         NWQiSDPLVy4CkmQqIeKZWZ8Mf/hC7LcaRT7F21eDu4HbDZfynn4hElcSIADLjfVgAVwU
         hcl0k69nFgk6t4yypuOwqCqc3tFltgbbtbwL4pWshP+Xu6W7zX03ckMKncpS1/DDjMyo
         NDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uGaUoM+E9lfomuo5VcB6+FBCFYFJdpblUN9bMb0KEQ8=;
        b=Cm7EkkxxujaEzs/OpoqiOVnE+EIQPTh7v1K75erwSqlfBuRi6ex3T2pobs6vEZ0iPI
         0eEdXxWVeymCvgfM4tBDtkSetSHes+WbHjkWdRrvuJkHgoE7cHLqkf/HrINVVbdITg7g
         3Oc8QAPZ7xhaIX0xJI5jsA7N4cAGUpgEjYTjYwotfteSTJ/rWMywzX5qT0HCDjY/DDLG
         bt8TWCyoebvJ4B0OSp53sgoj6AoSLINWPdFuuZYgtUUjHJgcsWou6HTFtf4aj6i486H+
         GX+yj4OyjplgFtfP4AiRHq/kTEwz2xlhU+543FeEh48B+L7aQUlkXNLivldRu1tEPm+u
         z4PA==
X-Gm-Message-State: AOAM531niM5o1qEf/FcGbnwZYdKjFqFEPHezgcam6MQmYby5MzxBXtpX
        LzGkcyZJ+nyziQUGkVvmZWfRJ5s8BJXV3do=
X-Google-Smtp-Source: ABdhPJw7tNEQiVhvl/LJcPnKFL/dA/jCctKdfptjpMAvIQ5ksmAAJk6aEs0ccjbVgVaDM7oMM/eCKVnVTTZR6vE=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a0c:f107:: with SMTP id
 i7mr8384314qvl.35.1611129927528; Wed, 20 Jan 2021 00:05:27 -0800 (PST)
Date:   Wed, 20 Jan 2021 00:05:20 -0800
In-Reply-To: <20210120080522.471120-1-saravanak@google.com>
Message-Id: <20210120080522.471120-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210120080522.471120-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v1 1/2] of: property: Add fw_devlink support for "gpio" and
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
        Kevin Hilman <khilman@baylibre.com>, kernel-team@android.com
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

