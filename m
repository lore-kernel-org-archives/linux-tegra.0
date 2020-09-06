Return-Path: <SRS0=ZsAf=CP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD07DC43461
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Sep 2020 19:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1BC8208B3
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Sep 2020 19:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an6GVYPe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgIFTAo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 6 Sep 2020 15:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIFTAl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 6 Sep 2020 15:00:41 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A29DC061574
        for <linux-tegra@vger.kernel.org>; Sun,  6 Sep 2020 12:00:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a22so7185479ljp.13
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2020 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jyKsLm5PPMVtFHkM5zOYcpoCB1tRWnWpYWPPYUyFJ0o=;
        b=an6GVYPe9uhbCxKrQtGtRBndmSyZp3XKAbV1vYLUg02nAXYenkuafjdQ9weTJiW7jZ
         AupMm4/uxi+jX8Eopm0O9264ZsJhkWF7JW9dJZVJ8Ou+B9BploBWaYVk+u75XM7TJFyA
         yWIjS6ulkweYxVdlYtN8fpNR9N+LgoY/fLXxYI0eZGF5TKDiczsD+O6LAnAVbAzsEUDb
         Y85Q+w+rLw05RylQnxbPGpNc23euI1kOYkMRXLhA1PrcuB7cf0L7ozpypw2N07mh6L1g
         s4lfr/hdBaS7kFp+b1/wcY8LX5nXD6wPyWtLxfAL5NaJdjxZcmOQgP7wTWTIxMnomIUl
         CTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jyKsLm5PPMVtFHkM5zOYcpoCB1tRWnWpYWPPYUyFJ0o=;
        b=h4FhQjjcexmsR5djNB37LAZf+344+AluDkEE9I4OBEccM0FZXFUr717EQylcCHZGML
         jd/Jd+do+1nM0MP3nsQ0Xl50TvkY1oP+6hDhTV6mcotaiTrDZRC+P5xd2ltaCbiC5oyZ
         lK2V+2sIYcYiKQdr3dt/ef7mcwZwWsuBSNXeJ5wxInetlHSUlldKRKOUww+Rjcu2b//l
         kM/O7urvLmRuVrOejaDVe6SEKg46Qm4Pye1RgFEAcm8AfBugDnzElZ3nynVaSzc/13FC
         2Rrae4hy/dk8oID7nPlPdspYOp6vMyA9Rgg1cwSd3bjvWhF1WfpaR4YY2RA8pmptA3FE
         LoRA==
X-Gm-Message-State: AOAM532KftAONXgOMA7Bn+g3ED4mXbnPMGaXOujwWDSnqms+xtXHxB4X
        NDxMWuhlx8Pg+NsO1ZWHmpg=
X-Google-Smtp-Source: ABdhPJzfxB92qwlmTMunp0PRKeyfAxL/YMQS5JNc5J2vf97FXHiixqoXD1vk5gkCjZEiew1jv9MJ7g==
X-Received: by 2002:a05:651c:319:: with SMTP id a25mr8383821ljp.281.1599418839638;
        Sun, 06 Sep 2020 12:00:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s8sm2900756ljo.11.2020.09.06.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 12:00:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] ARM: tegra: acer-a500: Add aliases for MMC
Date:   Sun,  6 Sep 2020 22:00:07 +0300
Message-Id: <20200906190008.25247-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906190008.25247-1-digetx@gmail.com>
References: <20200906190008.25247-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

MMC core now supports binding to a specific ID, which is very handy for
embedded devices, like Acer A500, because MMC ID may change depending on
kernel version or configuration which affects MMC driver probe order.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index ab3c378e5519..8a7a104b3717 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -20,6 +20,10 @@ aliases {
 		serial0 = &uartd; /* Docking station */
 		serial1 = &uartc; /* Bluetooth */
 		serial2 = &uartb; /* GPS */
+
+		mmc0 = &sdmmc4;	/* eMMC */
+		mmc1 = &sdmmc3; /* MicroSD */
+		mmc2 = &sdmmc1; /* WiFi */
 	};
 
 	/*
@@ -738,7 +742,7 @@ brcm_wifi_pwrseq: wifi-pwrseq {
 		power-off-delay-us = <300>;
 	};
 
-	mmc@c8000000 {
+	sdmmc1: mmc@c8000000 {
 		status = "okay";
 
 		#address-cells = <1>;
@@ -767,7 +771,7 @@ wifi@1 {
 		};
 	};
 
-	mmc@c8000400 {
+	sdmmc3: mmc@c8000400 {
 		status = "okay";
 		bus-width = <4>;
 		cd-gpios = <&gpio TEGRA_GPIO(I, 5) GPIO_ACTIVE_LOW>;
@@ -776,7 +780,7 @@ mmc@c8000400 {
 		vqmmc-supply = <&vdd_3v3_sys>;
 	};
 
-	mmc@c8000600 {
+	sdmmc4: mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		vmmc-supply = <&vcore_emmc>;
-- 
2.27.0

