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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D91C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:28:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A11A223A54
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbhAUS1K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbhAUSYo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:24:44 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707E5C06178A;
        Thu, 21 Jan 2021 10:23:27 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id n11so3611059lji.5;
        Thu, 21 Jan 2021 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4j3lRDRGM4I1dDuBpFWs7Ys2Csw3GokfMe1B1dm/1hQ=;
        b=Ka0pXB6RSESuSmexHJ2hM6LHB+tBOWkIMFui+tT+hw7q+9bQw5DTDDKSvt4j2k5D8I
         vEmAebasd56b4D82N3Ufy1CGpl4rAjwRMKnapkWcFalW2HzobcJ8Rd/c+MSFi3Ctc2fa
         oRopLIIPMQqBy5C/APVN/T+AKvMf61dWDlQ+ZiMj+IHCHU2w5AEB6NjqJuOdZBrsDBhE
         V99/bSDza9Wa0XeVGLzCEx/GoT+ImFhNGUg7tFVS/7AO8BuiY5dbDC6TMIMVZH72lgLb
         YphZsEqF4YhFrWKmqf9DxcO21roZOWxHNXUElg6aRc2eIA7vrGkMxAUjPDOqdweylgsm
         HncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4j3lRDRGM4I1dDuBpFWs7Ys2Csw3GokfMe1B1dm/1hQ=;
        b=WqzfVLdHwaSDglD5k3MKbblkoHUkJ1ahNJuITzJqSA53LbW9YeAaHm+I03H8mQU6wQ
         ZZCd7YsCKOznJSgnbJKhhL9l4gIfgkVznlhUDAJoZXgLaPF+E2aTuuuzZp6JPcARmfdL
         OxaOGDHerZ6o537mXz44oc0gA7etXMc2AHCVHfdN0AqV1nmXMyoVHcvSWPprTbtBNlpu
         hPKEAU5O574/ZbiShv8ApTgZU0XiHloXlK9Epg6xtBRWMmJ5n/Wd0DxikNxvcXg3A2cq
         D8rdrfu85VdoJI6ccQato312QmFg4wDECIer5r9/HRcVhgUYXeO0p9+g5EvfYdX0R5ig
         AKow==
X-Gm-Message-State: AOAM531Rd1A6l0l8Mi0NPvGFIwIQw+jLgZn1TTkOsUC+RS5fLEv8E68Q
        8Cmrff8x36rH/tHgX3rOJ68=
X-Google-Smtp-Source: ABdhPJww+jYvFRZ8Zoas4Bi7AS/tRPfF2ykwDQpdYi2jrjjYIHra2r5lp9cMJRh9geGwoZUN3n10Lw==
X-Received: by 2002:a2e:86d2:: with SMTP id n18mr304658ljj.398.1611253406043;
        Thu, 21 Jan 2021 10:23:26 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/13] ARM: tegra: paz00: Enable full voltage scaling ranges for CPU and Core domains
Date:   Thu, 21 Jan 2021 21:23:00 +0300
Message-Id: <20210121182308.16080-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
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

