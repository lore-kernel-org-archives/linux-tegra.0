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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E11EC07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E75F2610A5
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhGKX6C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbhGKX6B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:58:01 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA21C0613DD;
        Sun, 11 Jul 2021 16:55:13 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d15so1292215qte.13;
        Sun, 11 Jul 2021 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+h7Xnx/aF5REyi17i/Rfwigl3xjB1i2XDxnAZ/gSmw=;
        b=E/9T5IJmur4IyHQCUOZoVQRBQk0EA0eGIE9dGMNLdDYF1i9dQMccmCCYdTT+9WN4RC
         rfTp+eyHVpP+tAJmqGhmHLWhdsaF35lmotKCY3qg6LpIWVWYWDCv3U7JpRHJVaIb20yA
         j+1F4z4lmxOOPoyYoC+smrbCva6rgPDZmZri9I58izJB1m0cm9zqIMZrPKbmrcPxYIwq
         GcZe7tL2SrwMBNhCFTxe4kyPyp374aN39p912CUmhlSJwY8eGVM+zjRwR2YxuYPu3OEe
         bBLFXygO7edHL2D0NVzc+KbmObiYhitqX/ZK/xufLNlutcGgB/R2FeYYuUJk1U6gCf2m
         b1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+h7Xnx/aF5REyi17i/Rfwigl3xjB1i2XDxnAZ/gSmw=;
        b=WyKcTOKMQeFPieSC26m5KDgvzpglUxJZqzG8/usjgw5xcXg3TYbIbgoaW1eLInA8Sf
         UPK1osHqdZyq15hICZRs1GaXGjnVJ/oESgcCMMgVhn+TuOxJWDmg2rWdOaGvYF+DkduB
         hkUCqBLpPnl531daXmeplOz7IwY5ua1uGRBCqpEUTZj30VGW8Fxn0vAdqXWhrNCBytTK
         jEr852p9Z8utB13Pc9XVCd7ZXYbAtmhaoXBRRTfJN5LPTRN7rS6UMYLTZhWs40NtYktj
         AhpElPynx4fBMFMQJTLspM5d9VQvsiJhl1FOwa3hECz21ssqL1JoY+dUW/IgDWpufDwn
         QheQ==
X-Gm-Message-State: AOAM531eTSt++BWw8BuyVv4+USh7MwhWfjKSZo2u83AzLnAETYi483yC
        V2aLjLRUg78ojx1LoHWtgu0=
X-Google-Smtp-Source: ABdhPJxFff3xa+N7qG34A7GRenD+wnF3mpvcJrSFrp9UFNu2plhcmv0cYwWL4gKP4jPAnqeo0NgtCg==
X-Received: by 2002:ac8:74d7:: with SMTP id j23mr12641066qtr.212.1626047712971;
        Sun, 11 Jul 2021 16:55:12 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id h10sm4963133qta.74.2021.07.11.16.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:55:12 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/5] ARM: tegra_defconfig: Enable Acer A500 drivers
Date:   Mon, 12 Jul 2021 02:54:33 +0300
Message-Id: <20210711235435.31165-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711235435.31165-1-digetx@gmail.com>
References: <20210711235435.31165-1-digetx@gmail.com>
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

