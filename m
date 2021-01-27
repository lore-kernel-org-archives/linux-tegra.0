Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39322C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 08:58:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE8F420756
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 08:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhA0I5Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:57:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:60982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233375AbhA0IzF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 03:55:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94BE920754;
        Wed, 27 Jan 2021 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611737659;
        bh=aL5ww7x0yIMNn8eMOTqyx6f5SllCtTcRixceXOr0Tek=;
        h=Subject:To:From:Date:From;
        b=ubyxgHVHbx/TGFSFp/MRo0mE9rD5k/okkP/tkhfvSP/H/uJOyF6ZdrTAFkFVe18xV
         +gOZkDjfg6XEJZY/It8W2zzP7/g991TwJl/2j6kfSO65jID/4Nxp05EsrNhgYEkqEi
         sleTmxroFOLT2lic+mub63qXFkp3Ik5aKy0FY98w=
Subject: patch "of: property: Add fw_devlink support for "gpio" and "gpios" binding" added to driver-core-next
To:     saravanak@google.com, bgolaszewski@baylibre.com,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, linus.walleij@linaro.org,
        linux-tegra@vger.kernel.org, robh@kernel.org, treding@nvidia.com
From:   <gregkh@linuxfoundation.org>
Date:   Wed, 27 Jan 2021 09:54:16 +0100
Message-ID: <161173765639250@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    of: property: Add fw_devlink support for "gpio" and "gpios" binding

to my driver-core git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
in the driver-core-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From e13f5b7a130f7b6d4d34be27a87393890b5ee2ba Mon Sep 17 00:00:00 2001
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 21 Jan 2021 14:57:11 -0800
Subject: of: property: Add fw_devlink support for "gpio" and "gpios" binding

To provide backward compatibility for boards that use deprecated DT
bindings, we need to add fw_devlink support for "gpio" and "gpios".

We also need to ignore these properties on nodes with "gpio-hog"
property because their gpio[s] are all supplied by the parent node.

Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Cc: linux-tegra <linux-tegra@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Saravana Kannan <saravanak@google.com>
Link: https://lore.kernel.org/r/20210121225712.1118239-2-saravanak@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
2.30.0


