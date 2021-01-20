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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B46AC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 08:09:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0765E2332A
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 08:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbhATII7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 03:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730077AbhATIG5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 03:06:57 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3883C0613ED
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 00:05:30 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id p21so22924088qke.6
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 00:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=DHTbZHOkLsKuxtNFUubtLM+gqL6YY3qNMXB7NuoXXTA=;
        b=Il85GfxJuukw/3SvMs3zLOlirjw0U0IRX28xLvqLD/ty4nOJ9Xp2b6K/KilcjTtmQM
         l537tY9lg5rnaulxbobhsAQ4ifT7eB3rf7cPRgXY2+779zC29zzRqjwxCm/qPxoZFv/T
         YLNOmli8uuHOFGw2BPlx47YqPWcXY9rNa3RaHpibks4PcGEamflHasRmla1Xc09F3K3H
         q/XHi9O0n4NiedG60FpJA022VrFu72+DH+a6+I8VVIwjqABMUaVUYwhaJgA5/MCSpuah
         95TGfv7ff6pRPcUfPbgtt/nVwnmLY6DkE0HEZitHNxnfVAqkWg4tMJoqPW9JRwpn00BR
         AEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DHTbZHOkLsKuxtNFUubtLM+gqL6YY3qNMXB7NuoXXTA=;
        b=IjGaaLRGtSnDeWmwMUrdGpmisf4QT68b2wnSrAUTNOEefro4c9nSd4Gqk/7x9WO92E
         KK7ZxTx7AG/MwK7jJy28DSeffHB7wyclqGr8Pmh5JfEUim8ixryBpszJa3wUni1PgERq
         ayU+UfBwg66oRlJADK6QIHoLVh8Y0g4HiQ9TMoOI8imsoCnnb13J3/MkmBFMVUJv6au9
         C8sK55+0nlOyrfFG4/dGBZ40CdtWT6qeqanbHOW/1XlD1VGfNwLw9Zb2SazFE/M3b6Uh
         ddNVL/EkmHwuVsbv63MbMd8GSxHL19vThAlHCQm/HWGijJjEsOlOTwhUF7o5qHguxIn4
         xCdQ==
X-Gm-Message-State: AOAM530qN/9h5ybeDxMFaAJsyItbG/+KjzbJBI/tb35PNUu0k89E1hS/
        q5BFRQR42eu4zMwdDxwokavz6PBDTmXjb3s=
X-Google-Smtp-Source: ABdhPJyakDkqGvLIh+tdPGMZ1JrSamWDar9qMU1B4qiTmPWOBDxyLEdM7ux0cpDZXMRzWb92SLidW5+XN5u+0vQ=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:ad4:58c2:: with SMTP id
 dh2mr8314576qvb.4.1611129929818; Wed, 20 Jan 2021 00:05:29 -0800 (PST)
Date:   Wed, 20 Jan 2021 00:05:21 -0800
In-Reply-To: <20210120080522.471120-1-saravanak@google.com>
Message-Id: <20210120080522.471120-3-saravanak@google.com>
Mime-Version: 1.0
References: <20210120080522.471120-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v1 2/2] of: property: Add fw_devlink support for interrupts
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
        Kevin Hilman <khilman@baylibre.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This allows fw_devlink to create device links between consumers of an
interrupt and the supplier of the interrupt.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 0b256ce9d7d5..9dd9cc50e65a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_irq.h>
 #include <linux/string.h>
 #include <linux/moduleparam.h>
 
@@ -1289,6 +1290,15 @@ static struct device_node *parse_gpio_compat(struct device_node *np,
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
@@ -1315,6 +1325,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_pinctrl7, },
 	{ .parse_prop = parse_pinctrl8, },
 	{ .parse_prop = parse_gpio_compat, },
+	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.30.0.284.gd98b1dd5eaa7-goog

