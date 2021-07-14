Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A60AC07E96
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 438B0613AA
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237646AbhGNCy2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 22:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237627AbhGNCy2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 22:54:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA439C0613DD;
        Tue, 13 Jul 2021 19:51:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 22so875166lfy.12;
        Tue, 13 Jul 2021 19:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+h7Xnx/aF5REyi17i/Rfwigl3xjB1i2XDxnAZ/gSmw=;
        b=AMRebTyvY8qScLni1zk0uNdWq1WyCQIEH9SmJC5dIJc7xKgB1PE/ym8ntDiYNL+ynz
         CgYmj4H5osgxskLGMbVeAe+x/nyE5YTJhABQpavWQ6wx79dThPMPhVwbIF11BQYEbGSA
         TQ6wtpnkeGYA+wGG4HvNyNR6ByTCGGEEwXGFALMpVsBMUfPKOB1soVjcsPs9lF6sckfJ
         baNMnv/0nR9OeYqXmu0uyw+ISMlQKn1CpFBiCClX3jSEp9xULE22rD5TblhjI6r9IS5Q
         3/wHbki0J8gluHL6mdfn9zEI6+IDC7gf+1MMjf3TdNJBR0jWi3UMzqGqSZxNA37drk6Q
         5gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+h7Xnx/aF5REyi17i/Rfwigl3xjB1i2XDxnAZ/gSmw=;
        b=KiY+s34dU7+NZFnJ8AhyoSsyVHVPKbI7dMOMLyfw22A5fAp0X+GIJFiZirwMYwJGK0
         3NNofBDaYW2B+no3x98coIIj3g4Tlx2goVCx2jRb95n1VJHUpJxMWRMPDIjZ9XE912+H
         XItH9nuSJDeBgvzW3FNCz8yxHf4iJ+GSr8F0edJ5fUvM1GO+MRcz+JRrRocGktD3SpxY
         YwA5M8woInASJqoaz1QwSr9ylSJCf8L6A79f1b810AV9QKw9t790IHOszt5aXKZPn/2E
         gus10ndHcW0kil1lvs6MetSwOsSWNYp3G05vUp3KUPRNVmDsmZNPQ1eqX6K7c4tuVLq8
         xn7Q==
X-Gm-Message-State: AOAM533VMYadmLUW5/3kuxl16Y8/bvXhzZwFsY+tPsSpbiT30aaoHmRi
        a18jdMMU0FyZJ7+0o2xN1DQ=
X-Google-Smtp-Source: ABdhPJyzV8Bq7WvhTdR6G7IDCNFvdN44wEYd+NYuMul+X24+237eh/fykTKzG4pXUVTc4LkIUt65MA==
X-Received: by 2002:a05:6512:3fa1:: with SMTP id x33mr6106841lfa.378.1626231095274;
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id a10sm50281lfb.93.2021.07.13.19.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/7] ARM: tegra_defconfig: Enable Acer A500 drivers
Date:   Wed, 14 Jul 2021 05:51:23 +0300
Message-Id: <20210714025127.2411-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714025127.2411-1-digetx@gmail.com>
References: <20210714025127.2411-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable EC controller drivers of the Acer A500 tablet.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index ced01b114cd3..52db1c4f9de4 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -159,6 +159,7 @@ CONFIG_POWER_RESET_AS3722=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_SBS=y
 CONFIG_BATTERY_BQ27XXX=y
+CONFIG_BATTERY_ACER_A500=y
 CONFIG_CHARGER_GPIO=y
 CONFIG_CHARGER_SMB347=y
 CONFIG_CHARGER_TPS65090=y
@@ -182,6 +183,7 @@ CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS6586X=y
 CONFIG_MFD_TPS65910=y
+CONFIG_MFD_ACER_A500_EC=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AS3722=y
@@ -266,6 +268,7 @@ CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_LEDS_TRIGGER_CAMERA=y
+CONFIG_LEDS_ACER_A500=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AS3722=y
 CONFIG_RTC_DRV_DS1307=y
-- 
2.32.0

