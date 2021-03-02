Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BAAC4332B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20C5764E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377909AbhCCDbS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350248AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31749C06121E;
        Tue,  2 Mar 2021 04:11:05 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id q23so23610492lji.8;
        Tue, 02 Mar 2021 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4j3lRDRGM4I1dDuBpFWs7Ys2Csw3GokfMe1B1dm/1hQ=;
        b=bky9Ip8iHudus4iSNpeprUO1jGP9ZiI3IhFVwroXor5SZneY9WH/1eCgSbSAGIIASe
         JYvY0V3YnxCMyLD66lw8qRitDajy2NHVS4zHwesZTCripkLmcHnbmKQIBhCciBXC2zl5
         tWquiFGZqY9ao9xArS8qn17u+wVC0CsMlgYqeD4reJc+EBbVn3J5BfFdW+Cjc3GW4VGE
         lk32/hFafUYOqYkkmc+P3MhYT749hIjR1iphztesCox94BKOfw2RM8J10QxQT+rzlWeG
         LDeNsUxTusEVxSYbNWFxYGUuK2Xjz0mwqJnTYKCgw0LPJVp56/Nxe5pAx2UxtA6pKp+J
         hn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4j3lRDRGM4I1dDuBpFWs7Ys2Csw3GokfMe1B1dm/1hQ=;
        b=sHFKR9zb+8l3skwXRJ4fBizIL9UHPG5VjRCTcPJFuZw1bV0Pp5Au37TwdrPvF7FdOB
         UwqkQRGitRgu02R97jBs7+WrmnhgjuDYy3smLuHCptei9KPpDRqle+C7awa1ze9UvqXg
         5P5qRIjwUBaBpYU0zHgd9BSYz7+wiJjjzlQ8tcnN/fLAyiHhyiMSA4LFEt1ocYhw30hu
         n4HLgsTh43CFQviRZJmBjmWYY4hxCIwe0mgf3v0HB/lRiuOjXE8yY5d+GKBWm3PoQx9J
         QOVk8sDVLt9zSIp/hFbN3dVRbyMGbsSQoVgrYv5DnckXeVKvEevnAm7R38WAjizxxBhY
         O8jQ==
X-Gm-Message-State: AOAM532wH77x967UJiAGz50/vXdwQbCPzfncoHTyzJW9i8ADpvzdXNbx
        0jNnL/sVJwsKYCYVCv8Fk+U=
X-Google-Smtp-Source: ABdhPJxQajy59vjvgYkouGAvUPpNz/1PLEz1pf44oGxwZdBc8RUzJb5JwjokR6za3DgK9rotDiJe7A==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr11358200ljj.397.1614687063759;
        Tue, 02 Mar 2021 04:11:03 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:03 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/14] ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core domains
Date:   Tue,  2 Mar 2021 15:09:54 +0300
Message-Id: <20210302121003.15058-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
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

