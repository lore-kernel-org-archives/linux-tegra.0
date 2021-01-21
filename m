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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B35C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 22:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 900E223A3A
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 22:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbhAUW6x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 17:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbhAUW6t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 17:58:49 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2534EC06178A
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 14:57:21 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id j12so3667800ybg.4
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 14:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=uK0Guj4THP5+g44Z1zImR7+l85HfUzHMOtHW5TTbFrQ=;
        b=ImsE1yIWnsaLWJKqkKF6DHLyG4Jfq9a8VZaWAtFYT5/ADnPXhERzP1ZWXSFdsvDIDD
         EuHN6GEGCtOpkwE9UYUFBJUYv7S++PFMoMcUjMNu+zv6BPbShHbfo+/Hbtf7ZothLc57
         TlsHjBXz7qc8X9ugUrxMCKCQAJi8q30LOuPfn7T4SOgTa9bEUuFALFvycM/5XteYnO0p
         W5R7fzwIewBeXDQzuwGiqboXlgy3cFEibVvuWrFzkx308XTVrK3HijFfsQ6IcnD0QxrY
         gSsINIMbyPfnooS281kGwFZo96F79RBV8twjIcXpc/Ewj0Oear7t/jSdS3G6VgPZP7yR
         8ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uK0Guj4THP5+g44Z1zImR7+l85HfUzHMOtHW5TTbFrQ=;
        b=atgKFmjaNEMm5naiE/wWc0sJgpLkW71aifrqRh0ptLhHViwelrGSmJWt41Em4/v3ny
         xUTW0rg+Ft02c6D+9o9HX6B8HTFAgLm+uEfSNETBDOGYX0+sVVMcYl9n/ve8WQ4bdjhw
         LbfEVq9QL0qYDQwTCSqbXx36zCkqJzBe29z6mtpjtY9E+nI+bSrnOs/+aESyAuwwNPZU
         yZPW9HpWKRIAm0RArHEX+IKZDuK91rF4gPbJWINv9ZmcYnOjkiIuV7aAuNUhaSwYPxxM
         walYJ2Lvp5TYgG2f648ImabzSMFEzU3pspKka0Nr05kbSJ1ZGBRIlfUUht9HqMgamGdz
         6/Og==
X-Gm-Message-State: AOAM532EKK+IxQqo0nPW7mOxIJMmalHeIiMKMb+XQ4Ew6XCDS55iC4tH
        07mPrCLz5w4JS9qUNfiwst2mHmdC6CDaSC8=
X-Google-Smtp-Source: ABdhPJwFPya6ZpnojdN9+DfUQ2rdg/34vXkXUzMjpHddMGECP5xV2BbOs91bcILedlNvkfi3tEmbyaqkd6sPwjI=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a25:7c46:: with SMTP id
 x67mr2450968ybc.464.1611269840361; Thu, 21 Jan 2021 14:57:20 -0800 (PST)
Date:   Thu, 21 Jan 2021 14:57:12 -0800
In-Reply-To: <20210121225712.1118239-1-saravanak@google.com>
Message-Id: <20210121225712.1118239-3-saravanak@google.com>
Mime-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v2 2/2] of: property: Add fw_devlink support for interrupts
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
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

This allows fw_devlink to create device links between consumers of an
interrupt and the supplier of the interrupt.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index b2ea1951d937..6287c6d60bb7 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_irq.h>
 #include <linux/string.h>
 #include <linux/moduleparam.h>
 
@@ -1293,6 +1294,15 @@ static struct device_node *parse_gpio_compat(struct device_node *np,
 	return sup_args.np;
 }
 
+static struct device_node *parse_interrupts(struct device_node *np,
+					    const char *prop_name, int index)
+{
+	if (strcmp(prop_name, "interrupts") || index)
+		return NULL;
+
+	return of_irq_find_parent(np);
+}
+
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
@@ -1319,6 +1329,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_pinctrl7, },
 	{ .parse_prop = parse_pinctrl8, },
 	{ .parse_prop = parse_gpio_compat, },
+	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.30.0.296.g2bfb1c46d8-goog

