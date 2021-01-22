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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC181C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A913023B01
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbhAVUax (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730178AbhAVU2s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19033C061A29;
        Fri, 22 Jan 2021 12:25:13 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id a12so1159371lfb.1;
        Fri, 22 Jan 2021 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4j3lRDRGM4I1dDuBpFWs7Ys2Csw3GokfMe1B1dm/1hQ=;
        b=UXMk23CTxHEWdr3uQgfJUtAG9YLhWTcX9LYpm8uh/wvHMO/C8bSWVZKm186f3bBQ2H
         hWeRWrKOilcv55sWdwt/etvPhkhL6nbeQXEgjmyaT1K3j5e5r3leuUBPv3JUGY7MgH/j
         DYjepK0IuACrmxA+fN5n8jfUbrKtp/wxh87rJYRX0Q36SpRtDfOX48uOeOVshiZKpU7V
         GsJQvQ+sKbbsSSC5iSbE7mM7d8aZRptUdNPGj1msO/EztR7yEd1sdM3UvrYeOGIP8Jsz
         z4sF80O8TTP0HlBA+qjdEdzsstaNiL+TE7kQuq4PwoetetCpeMlrLi3VabvBEdByJfYl
         k8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4j3lRDRGM4I1dDuBpFWs7Ys2Csw3GokfMe1B1dm/1hQ=;
        b=SlIFwpOWxajpNbTNdtnA2a2HZ7SMgcFXqqDpAARLHb3kXggWNmY1VFBVMytDj9SNY2
         H+FZU0+oDZ+qjzbA/WPa5IHpC+loRrjPT9EGdykhQeWoOB76EyrXtSX+cj8AIDRzO7dg
         8ZHZpFlYhuMliIKfnDnrG4xx7LmLXeDwDaBrX7dYTwqziBj5CpSGPc4KNikhm+3hCKob
         rn21IE7WD4A53HoC7Zo3pKJLRCCFsfSbguTGGJN3pupJiV0XskiPlGcDu2Px20eyFbGV
         8LFESINkVSRzG2lYDKWjklKowXchlVdyAV1Y9cpX4TTO7MnxrAqlNl3ILaW1MsnQTqyp
         9M9g==
X-Gm-Message-State: AOAM533rLfIkehS062el+yrBsrmqzz5Bx9oqleFefUrq2itb8cuqc0pv
        SIF/w7AZOe1VvaxAGM6+2f0=
X-Google-Smtp-Source: ABdhPJx6T74+N6tuxXbu5lIfhGQ2iMPUUVAgOy1rM4+SsNiX0AZdXtCJKTnTr5sk+zz1SKnYYmpLuQ==
X-Received: by 2002:a05:6512:3045:: with SMTP id b5mr1680368lfb.32.1611347111537;
        Fri, 22 Jan 2021 12:25:11 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:11 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core domains
Date:   Fri, 22 Jan 2021 23:24:49 +0300
Message-Id: <20210122202457.13326-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable full voltage scaling ranges for CPU and Core power domains.

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 7e49112cd9a1..940a9f31cd86 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -387,10 +387,10 @@ sys_reg: sys {
 
 				core_vdd_reg: sm0 {
 					regulator-name = "+1.2vs_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1225000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
-					regulator-coupled-max-spread = <170000 450000>;
+					regulator-coupled-max-spread = <170000 550000>;
 					regulator-always-on;
 
 					nvidia,tegra-core-regulator;
@@ -401,7 +401,7 @@ cpu_vdd_reg: sm1 {
 					regulator-min-microvolt = <750000>;
 					regulator-max-microvolt = <1100000>;
 					regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
-					regulator-coupled-max-spread = <450000 450000>;
+					regulator-coupled-max-spread = <550000 550000>;
 					regulator-always-on;
 
 					nvidia,tegra-cpu-regulator;
@@ -425,10 +425,10 @@ ldo1 {
 
 				rtc_vdd_reg: ldo2 {
 					regulator-name = "+1.2vs_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1225000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
-					regulator-coupled-max-spread = <170000 450000>;
+					regulator-coupled-max-spread = <170000 550000>;
 					regulator-always-on;
 
 					nvidia,tegra-rtc-regulator;
-- 
2.29.2

