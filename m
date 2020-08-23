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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61846C433E1
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CCDF206C0
	for <linux-tegra@archiver.kernel.org>; Sun, 23 Aug 2020 14:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tZOVHl6o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgHWOs2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 Aug 2020 10:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbgHWOs0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Aug 2020 10:48:26 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2316C061574
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so6804705ljj.4
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EaBvL32tcEigONyE/qxDU3km7C5iOhDt/gYUThD/Lio=;
        b=tZOVHl6oyCjSkI+ZX62nzeeCQtygQXQshViI2itFlf/SZmKu3cqYAj9cligMieeIXJ
         SnmrTBnc2Fe+CXXHUWmuOEQYr7nsK4Pw+3HWklFF2xNPHWwYzJTt6f1DIVlZIhviIIyO
         XgY85aoXL4RMpbomKKp5LgeL2tukGsOxpqJn5hcD/5kGbo6QBhqhR1xotYcADs2fu0iI
         2RAC81i33e+uLOVQft8qauuQ99kxSH2kmyLX6xOWieyjktuXewsJH/p1qT+xSQ0cSpUz
         nCywoyxQax1/p9gylnJViJ2KuIKvyt5spqE0qu2sg3YkXrMKXZtHG8nENr4rWJcNq/di
         tofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EaBvL32tcEigONyE/qxDU3km7C5iOhDt/gYUThD/Lio=;
        b=YcE2sUNm7e+mD8ma2ddMQtoFql/iari3YUNMLa846l8C7Y37oFzL17SglmC4SnF+fk
         g37QbIQ71Qa5PBvA9h37cPYHKa7caI+VZYxXCZtoesh0WUQAtmmp427JGM+N61CKvMBp
         4hS6aFxtOT0KuPdBJ1+tqRQiLaVtC7BmfZzswBtvCyoVkoM7uBNFqYZbm94OQEYY04E8
         BxJN6YiTVdeorPgomt9WvDY6SeRByZoROYT8MOgrOjJgWrpbe1I19rorfvhOweRIARJL
         UvnFOQs+ZeegM+qlKzkGyCdZk0mJWcghLLfdC2IXhG3MRA6J70tdjZpCDFCY6d5vo+Ws
         qGdA==
X-Gm-Message-State: AOAM531SnEbfvOKaQ99WAtluonJN5wJbEI3x3jS/lLrezDg+LTAKH2DQ
        tZPS+DicL9E3c2EOW3f1KFs=
X-Google-Smtp-Source: ABdhPJw4J7ZgjAsfgrQjbAgKioGCC4b8+7kkKemlFfSK5p2WfS7epgRP6urS9ZbWUle5D+7ivshvoA==
X-Received: by 2002:a05:651c:1390:: with SMTP id k16mr701924ljb.176.1598194103350;
        Sun, 23 Aug 2020 07:48:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l24sm1635560ljb.43.2020.08.23.07.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 07:48:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Wright Feng <Wright.Feng@cypress.com>, linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/4] ARM: tegra: acer-a500: Use PLLC for WiFi MMC clk parent
Date:   Sun, 23 Aug 2020 17:47:24 +0300
Message-Id: <20200823144725.28299-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200823144725.28299-1-digetx@gmail.com>
References: <20200823144725.28299-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The default parent for all MMCs is PLLP, which is running at 216MHz on
Tegra20 and 50MHz clock can't be derived from PLLP. The maximum SDIO
clock rate is 50MHz, but this rate isn't achievable using PLLP.

Let's switch the WiFi MMC clk parent to PLLC in order to get true 50MHz.
This patch doesn't fix any problems, it's just a minor improvement.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index b89e9398f681..ab3c378e5519 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -744,6 +744,10 @@ mmc@c8000000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SDMMC1>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_C>;
+		assigned-clock-rates = <50000000>;
+
 		max-frequency = <50000000>;
 		keep-power-in-suspend;
 		bus-width = <4>;
-- 
2.27.0

