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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE5CC43217
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BF4C61211
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbhILSUm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 14:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235203AbhILSUh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 14:20:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69954C061574;
        Sun, 12 Sep 2021 11:19:22 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id s10so16053320lfr.11;
        Sun, 12 Sep 2021 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iJA+09/oXBeGyThFH4rEakTMnaSOIHFJRqu4fOZYzzI=;
        b=B3k+OKm0m/Wtale4/820UBG+UWO2AJnxzxRu+wHjIoAxQ+pxlIMGGJ8sERReYs4UQ+
         xLXlLUzDwj51Pes0cdGtDqlNbhYoEAaz4wGjeymxPRYXvIUM8IXoLKNilsGKLH1iFnC0
         uyGgQXU1pBAWVi43COL38jUY8iPWXvqMg5XC/aMiNd9kGubLB8nlEzdUw5h7v5GJw46c
         6S+uA74dsl3XfBy9vqeCXDiB0N4XW0nUP131Vf5auzj9k9bDDIKPex5EsgAQvuJs/bnO
         Sm7Fl0nSScUQjx5NUOIZF7KEp/PJpOmf8OSI0HWkILD03XcdO0S/zm3XsWDGQl5NtaFI
         3KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJA+09/oXBeGyThFH4rEakTMnaSOIHFJRqu4fOZYzzI=;
        b=25ugii2ACDyUDeiVksw4ffyfSUQAU9qGm5luUfFuN8JI/CgKKCaAK89SnEic7PqffA
         UlxVUBcKibGz1uVsk+VvevPTv6E2t0k0QHsAbDcD93Kg5Yg7iRKKctcItflidKOp0glv
         v16fea3XA8uAniLknyWBafJp8/aHY4/o7oYPINhb5tg4rU7GCCDetbFEfvR4PE5xw63x
         vT5I7H6wBfrH/OAQnL+WrRpGukVXcrLEupTVwjxbmsIOyjuLqCrseMrgCLtBZnOWdqKZ
         7ssqE75bec4fmpAscovcunHO89mzdYqgqCmnZ/PSDa5SMBgw/1CVn9DMreKKbwiNVLye
         2Nag==
X-Gm-Message-State: AOAM533xL2Pmhu0wmKcpiU5YBDU8kD+xr/409c2p0ERhSm7ocfHa43j/
        9UyzkywD1QpSeLNIznV0OcY=
X-Google-Smtp-Source: ABdhPJwygAeBk2CcGdhtkA5jidcv4TEv4rdLCKbZbIznaOWOdK5jVchunRJzC5UdY7MMOxLwaNtOKw==
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr6373355lfe.444.1631470760788;
        Sun, 12 Sep 2021 11:19:20 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id a18sm664556ljd.4.2021.09.12.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 11:19:20 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v7 3/7] soc/tegra: pmc: Expose USB regmap to all SoCs
Date:   Sun, 12 Sep 2021 21:17:14 +0300
Message-Id: <20210912181718.1328-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912181718.1328-1-digetx@gmail.com>
References: <20210912181718.1328-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All Tegra SoCs prior to Tegra186 have USB power controls within the Power
Management controller. These controls need to be configured by USB driver.
Expose the regmap to these SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 74de84a014e9..7c9bc93147f1 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3067,7 +3067,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc = {
 	.pmc_clks_data = NULL,
 	.num_pmc_clks = 0,
 	.has_blink_output = true,
-	.has_usb_sleepwalk = false,
+	.has_usb_sleepwalk = true,
 };
 
 static const char * const tegra30_powergates[] = {
@@ -3128,7 +3128,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output = true,
-	.has_usb_sleepwalk = false,
+	.has_usb_sleepwalk = true,
 };
 
 static const char * const tegra114_powergates[] = {
@@ -3185,7 +3185,7 @@ static const struct tegra_pmc_soc tegra114_pmc_soc = {
 	.pmc_clks_data = tegra_pmc_clks_data,
 	.num_pmc_clks = ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output = true,
-	.has_usb_sleepwalk = false,
+	.has_usb_sleepwalk = true,
 };
 
 static const char * const tegra124_powergates[] = {
-- 
2.32.0

