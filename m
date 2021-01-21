Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BE7C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F8F120888
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbhAUSsD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbhAUS0A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:26:00 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D95C0617A7;
        Thu, 21 Jan 2021 10:23:32 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b10so3612334ljp.6;
        Thu, 21 Jan 2021 10:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypUw/eWje7JsdwKcZj2L6qITXPb045n6mG7TDpv0Hp8=;
        b=VJ5cpDa6ymZFADGC3BvTIm4C0OIPela2+17LdYMT0XTuXlPTrsFn9NRuTBeK3rIMxv
         ssNqrqZkSZX8JGna9RiEdwSL/Dj8Krfwmv/EtRRaGhyx6R9tnd7vgUaQKe7AyK9kZUMx
         P0SeImwnhlUL9/uCpdAl3pJxsfW7OWHzHb/MkecnsNG3U1skOzG8zFUojqWv0GTzDJOh
         mYFBjuv8M8cgYD78zk6X3dIdX4gLadzzJ6YA4yY17XDC4bBxCx+RtG21ORzBESzLNyn+
         YJak+3Um2aZSsOWKSxA+yyx+x3hvM/EsWDmRugOL11Y8B5wJH2/QUBkTkqxMIBHLIRl/
         59ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypUw/eWje7JsdwKcZj2L6qITXPb045n6mG7TDpv0Hp8=;
        b=NjelTF8CyfdKVs41hbFw7ycdcY+ue3+Ad7/P/YfdNBtDeEJVPUFB0nX8cXujdHEytf
         pxgaqib6KVWxLq+4BlRXRyg1jS8oYsyWvrvBEcc/r3sSVuuKazY3DYqXBn065YUli7vN
         qu/SO+UtVH0PjXGr1bfKPSY7Uq9NyV9UMB8qN1hcM5NNWQcUegq3m4lDQpEeErZQSQu7
         MiTU2eygS7UoukOQzO9Uw9L9k5O9raU1TKxlrkKHSAq2Qnnp9hLlsUcMGYA/BdpfF2ku
         MhHwALe9r3Opfc1iYst6SE57LyLRNSo+K0YdU+wG0zRZiNeefasMS2Fwhag1IAp2YvSg
         3o1A==
X-Gm-Message-State: AOAM532ltaQKgSivHJDucBQg76zPByJwverVIDbz9uv57gJ1LKG4/ws7
        VzEXpsoflwRq2KiiUl3B5Dw=
X-Google-Smtp-Source: ABdhPJxll1cE4U5ITMzQderkVtHw2DiYoF/Tc1kDf3xYNpvzocmqQZXs+dkzhWvWqVAXVeYIs9TS4w==
X-Received: by 2002:a2e:580b:: with SMTP id m11mr313021ljb.426.1611253411067;
        Thu, 21 Jan 2021 10:23:31 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:30 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/13] ARM: tegra: ouya: Specify all CPU cores as cooling devices
Date:   Thu, 21 Jan 2021 21:23:06 +0300
Message-Id: <20210121182308.16080-12-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If CPU0 is unplugged the cooling device can not rebind to CPU1. And if
CPU0 is plugged in again, the cooling device may fail to initialize.

If the CPUs are mapped with the physical CPU0 to Linux numbering
CPU1, the cooling device mapping will fail.

Hence specify all CPU cores as a cooling devices in the device-tree.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-ouya.dts | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 8f66b16a786f..faeccc301368 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -392,19 +392,23 @@ cpu0: cpu@0 {
 			cpu-supply = <&vdd_cpu>;
 			#cooling-cells = <2>;
 		};
-		cpu@1 {
+
+		cpu1: cpu@1 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			cpu-supply = <&vdd_cpu>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -456,7 +460,10 @@ map0 {
 				};
 				map1 {
 					trip = <&cpu_alert1>;
-					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
-- 
2.29.2

