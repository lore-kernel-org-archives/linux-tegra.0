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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDFFC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 21:03:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A965023A57
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 21:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388775AbhAOVCq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 16:02:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731435AbhAOVCn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 16:02:43 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A7AC061757
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 13:02:02 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id l7so8431352qth.15
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 13:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=HxQUFzxtkBI9IE2jZdisE7OWgiNmHacDc1aIpJob93c=;
        b=fcry9Lnx+lFYwZJOSIFilMZOfFjtLVaUyqSqSmrqaaSK6S56bQsgMZmazbos/VfW+t
         Bbm50u3Wh9ltZLSmEp5iioaxhc6efP45gT8eUmffMrrz/zt93VjuoF97MSLyBN5UqLFO
         d+jw288OCReuJt2rx9EYVdbd/gXDD4xntD8A1bTuR52uyae6XYmkIVqgQRlzorbHQ5wX
         J6PDnC2Ovx72pDJ6ZwtN0ms+WvcVePSlipcU5U8VhD9GMv0PU6BhQHtELx9tMPGeojKB
         PPpWi2Qj+xF5CjIbFFDsgFVGiQm5iKQ5Q995ZUOahsQkch0WX9vV+j+9ZSjacaR4UsoS
         +rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=HxQUFzxtkBI9IE2jZdisE7OWgiNmHacDc1aIpJob93c=;
        b=R14maPSixpbdHVGmllFddsQ5dSajni1M8uNvhwhv840HQ9HimRvmICcllqt1POxJcG
         u+Gpa6UoTsHKzijD8Y/qVLf89MMVftCxUQ7lA4DmT/zPxl0c6Vv88+CHQEMboRcnkLSi
         ReQCqVJm3s7dflqZIjeEsR2mX+XFkCY/rZr6ERsTq0l5k2X8YV/br+Bdk2rEdEtuMvX3
         OB0Ozpcn4SOCuio+ySjmmPd71ngSDyQ4ARC7/Qh24NidAuQHOqAYkB9nlkdQSOmOMv/K
         EsOC7Fuy2P0qg50YZ8B8EsEoxPv/VFbMVkESyrKHnJY+TS/tASEI8vlWBf8fu6/hp6IC
         6j0A==
X-Gm-Message-State: AOAM533XATj8qJV9zjSeLwVzisJULlVRB7KFBReFekTu7vw9EhsTbWWP
        rlTY+4hPObg4HEDPWm0daL/qI4io2b+tecI=
X-Google-Smtp-Source: ABdhPJzzFJ4sVYqQ5ohkt/drFJVkon5uRFouk1OF5Nb7fuaqlAi3rQHoA9RR7PjoJKZvqMU0aWek0r3Q+y1UA0U=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a0c:8642:: with SMTP id
 p60mr14075482qva.6.1610744522082; Fri, 15 Jan 2021 13:02:02 -0800 (PST)
Date:   Fri, 15 Jan 2021 13:01:58 -0800
Message-Id: <20210115210159.3090203-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v1] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-tegra <linux-tegra@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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
Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 5f9eed79a8aa..1c8c65c4a887 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1258,6 +1258,8 @@ DEFINE_SIMPLE_PROP(pinctrl5, "pinctrl-5", NULL)
 DEFINE_SIMPLE_PROP(pinctrl6, "pinctrl-6", NULL)
 DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
 DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
+DEFINE_SIMPLE_PROP(gpio_compat, "gpio", "#gpio-cells")
+DEFINE_SIMPLE_PROP(gpios_compat, "gpios", "#gpio-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
@@ -1296,6 +1298,8 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_pinctrl6, },
 	{ .parse_prop = parse_pinctrl7, },
 	{ .parse_prop = parse_pinctrl8, },
+	{ .parse_prop = parse_gpio_compat, },
+	{ .parse_prop = parse_gpios_compat, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.30.0.284.gd98b1dd5eaa7-goog

