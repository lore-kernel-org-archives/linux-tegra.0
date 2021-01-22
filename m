Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5180C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B5A123B04
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731078AbhAVUab (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbhAVU2l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:41 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFB8C0610D6;
        Fri, 22 Jan 2021 12:25:19 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id a8so9290130lfi.8;
        Fri, 22 Jan 2021 12:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//LXOze+13I5z/FYLaqJrmRyfxqFIxZ8QuJGcysQP04=;
        b=QH2nxiVAuaWaepDmlyhR3xKmfNxLqg0rxryCq/fjLgCRcWrPdjpzTiR1lFpB2tbwv9
         4NBcGWtADFhnfNQk+6Hw1wvpxUGOslb02wfXGuQhWPlj6iLf31TG41XarLbqOcSLQTCQ
         0bI0zcHUjqn342lJspC7xMBtHeEwT5MH4iAUR5z/co+/93zynfYxq+GPSI3m9RnGT/7Z
         19EpN0mY2rYYcxQrGvfbLkXGCGlvZThPxeL95dZjI6L3Wfb9UgQlJ4X7SXsrz9trWU79
         /HDIYKm/War4NJtAghjHSimedWa9+pEXZWix+YOHdiiYzH+oHYRYNcXl3Bs+dJnV5Udx
         sK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//LXOze+13I5z/FYLaqJrmRyfxqFIxZ8QuJGcysQP04=;
        b=ZzxApmDykS12LnFQK4PNbwQtHy8QaL04LxOdUeY0eVtWoHlufIysMBUUOBEEVfHLKg
         +GpTjccvWMAl//6NiGGKRpk2PYqLnYlXaPDGRfxHAMBJHT9UcBdJtoe831VsnWCLq+pp
         qq798ApLonxXdhMK7EYBnvbDQa/nP+HM/AMNKbF/macQ8XnArYibXs4WYy4l2XR3PoKv
         FnF2NxM86+vF48BpwjaAckURPYtxda+/J+WRkbRhtBZkbTlidewzl6ZEjck3sCDTmdJI
         KybbaX3AyGx+IuhJdxyN2YuVFeASh/0adtn34Q2bDBw+y0aI/CUC0h0ZFWXnofAKpyEY
         kpbw==
X-Gm-Message-State: AOAM530RjVgfGHM1tH8iOFEwo9WzDQztSt5WdRSc8TGJW+XchyA6oz28
        g20tlrpKoX+sGbL3XkxZLPc=
X-Google-Smtp-Source: ABdhPJw13bCU+GDJ3KE2bHLfqp3aTevnPYFa8SRlyU9bn82mS6DAp3XHe0oE6KJ1zl/dXi529Njzzw==
X-Received: by 2002:ac2:568b:: with SMTP id 11mr120884lfr.8.1611347118262;
        Fri, 22 Jan 2021 12:25:18 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:17 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] ARM: tegra: Specify memory suspend OPP in device-tree
Date:   Fri, 22 Jan 2021 23:24:57 +0300
Message-Id: <20210122202457.13326-14-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Specify memory suspend OPP in a device-tree, just for consistency.
Now memory will always suspend on the same frequency.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi | 5 +++++
 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi  | 1 +
 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
index 49d9420a3289..781ac8601030 100644
--- a/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
@@ -128,24 +128,28 @@ opp@204000000,800 {
 			opp-microvolt = <800000 800000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0003>;
+			opp-suspend;
 		};
 
 		opp@204000000,950 {
 			opp-microvolt = <950000 950000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
+			opp-suspend;
 		};
 
 		opp@204000000,1050 {
 			opp-microvolt = <1050000 1050000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0010>;
+			opp-suspend;
 		};
 
 		opp@204000000,1110 {
 			opp-microvolt = <1110000 1110000 1150000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0004>;
+			opp-suspend;
 		};
 
 		opp@264000000,800 {
@@ -360,6 +364,7 @@ opp@204000000 {
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x001F>;
 			opp-peak-kBps = <3264000>;
+			opp-suspend;
 		};
 
 		opp@264000000 {
diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
index b84afecea154..ef3ad2e5f270 100644
--- a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
@@ -68,6 +68,7 @@ opp@216000000 {
 			opp-microvolt = <1000000 1000000 1300000>;
 			opp-hz = /bits/ 64 <216000000>;
 			opp-supported-hw = <0x000F>;
+			opp-suspend;
 		};
 
 		opp@300000000 {
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index cbe84d25e726..2c9780319725 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -128,12 +128,14 @@ opp@204000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0007>;
+			opp-suspend;
 		};
 
 		opp@204000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
+			opp-suspend;
 		};
 
 		opp@333500000,1000 {
@@ -312,6 +314,7 @@ opp@204000000 {
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x000F>;
 			opp-peak-kBps = <1632000>;
+			opp-suspend;
 		};
 
 		opp@333500000 {
-- 
2.29.2

