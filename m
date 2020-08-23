Return-Path: <SRS0=c9q3=CB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB6CC433E3
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D743206C0
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t8vxkhb6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgHWOsd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 Aug 2020 10:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgHWOs0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Aug 2020 10:48:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE7EC0613ED
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:25 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 185so6797581ljj.7
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eQfNvgU8IZ/1lB0fZsO9hnlQcjf/AwRpfps15nQ0KiA=;
        b=t8vxkhb6p7UeoRHFWEwAGIC4Fs+VOg8K75HoWPD8Yyhh8aqbb299bYt2GLhFB6AWRh
         TCgDZQ40iZAWqGIImcrvOtA38ydSREJIl1FU40Wy8VZ2rwhrRDp8JW5VGx30qfSlsf1h
         HFl2i8Q7xF1n81GNNiG+bnk80N7qXnqObAwMsZJPmJe+GcMU8sTM8p0VcTpR/cCCDkq5
         MM9jjx+EP8ge1rh0Ws2XhQsJ1wBJxWGFSvlRTFnN3UV7G1LDcavL0P5PmYbenqwvzi3B
         BVU6d0Ehqxp6CI7qVsQwvL1UV1U3LCegj5yXaKcE+6qqLQrseapGvOdCQEejxrxw0g8s
         5Wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eQfNvgU8IZ/1lB0fZsO9hnlQcjf/AwRpfps15nQ0KiA=;
        b=tc5ngQsp68P6FDruuiderkwx4prwXNanYOztfeuZMtoyJg3WZ2xqI8QDX2p1bngbpg
         4jIETh4cJ2ekBr/Tn8Cb6dXA6Yf3FW1AhPv4LZGyqMShuTeAn4PPkoGj54aJK/bsckg6
         hif5OA6Wxww2CDVdKuuZ1ubeeHvHYr1N0TCMH3eol6RyQadBmBGo4d4rKYOHg6sywE6b
         US+JRgzVBeupBj6vu2/OMN2XumfzEU4k1939jcF6wdBM9oOHHYSNwZUuts9dNr/6v5fR
         h14tsh8vU+UoTlSRKOCN/R+6AL+X8XMnSEzurP0o3DqgLM6mIaNWS99BbjIAGCXcCQzL
         l8cg==
X-Gm-Message-State: AOAM5335WurH1S6PMgCRbOhuN6P4aFSa+Sh1iLwlYu4uP7jMi+y/qKoe
        78z4cp+MxA8OC3+aj0UqX9o=
X-Google-Smtp-Source: ABdhPJywD/f/d4NiXf1/Lks+Ss7n1JzCAjlHaEcoV/jjc1MGtaBqeAxwKoY63facXdPqZrjqiMr8mw==
X-Received: by 2002:a05:651c:1344:: with SMTP id j4mr812157ljb.164.1598194104226;
        Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l24sm1635560ljb.43.2020.08.23.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 07:48:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Wright Feng <Wright.Feng@cypress.com>, linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/4] ARM: tegra: nexus7: Use PLLC for WiFi MMC clk parent
Date:   Sun, 23 Aug 2020 17:47:25 +0300
Message-Id: <20200823144725.28299-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200823144725.28299-1-digetx@gmail.com>
References: <20200823144725.28299-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The default parent for all MMCs is PLLP, which is running at 408MHz on
Tegra30 and 50MHz clock can't be derived from PLLP. The maximum SDIO
clock rate is 50MHz, but this rate isn't achievable using PLLP.

Let's switch the WiFi MMC clk parent to PLLC in order to get true 50MHz.
This patch doesn't fix any problems, it's just a minor improvement.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 903457292c04..21387a91c40f 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -976,6 +976,11 @@ mmc@78000400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		assigned-clocks = <&tegra_car TEGRA30_CLK_SDMMC3>;
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_C>;
+		assigned-clock-rates = <50000000>;
+
+		max-frequency = <50000000>;
 		keep-power-in-suspend;
 		bus-width = <4>;
 		non-removable;
-- 
2.27.0

