Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F37C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243076AbhLIRhl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243074AbhLIRhk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:40 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004E1C0617A2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:05 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id q3so10977522wru.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p8EDL6k5IbmshBH3qgD5LZD3zACvBYVNCMZA7RtoWq8=;
        b=VSPdfy/S+zGf/0zEWiVyq8A7qBhVt2xibZv+mNEzNntckjnqSruaTdXyettwwZt9/a
         TtY/4gnqZz+sPwxjVmQ7apQFm4XyxSr7r+ChyuelVrThQ2G1X1MPFdosR0OqWwyikfGG
         ll225w3U4i4Ms0Q9va+rSvPHkqDJDhP+lLoXuYEnsxtom4KMzgwOusmBEHBY/4hl9nur
         dUHI3QFsNsTz+Hsx7G5Mk45VQXSZg00aiW2EResdktt/PgaPR2ikK87MSIWdNRQ50WSM
         PyDxeUnvYRLQOYhe/D7NpNg5uk6RTAYX5QObCiILnDxCLqR1cHEKwECOTwJwQdDXN9Ra
         FUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p8EDL6k5IbmshBH3qgD5LZD3zACvBYVNCMZA7RtoWq8=;
        b=HyIPB1XW4MvuG+GmEynY/mPnNirqruIj1JFiJgzCDYEQmE/coGihEeoOGhTogojqAe
         NHa8spOgD/c12bRwEkO+Hk5JFtmbTpbAzNIbrQ02u2Xa54S0hDy1rceckQJtqCPZwd1D
         QPcWRIMhJRiIq3ldS3WziNsRGC1WKoriCX2Hg5NUCxMcIK7LaB9rhhSYVU755FobBrrG
         3hncACyShTEQGQY1h7I1N0Qq640qwladeSjkiOTUAYyPXu/Rb6hfFcJC1PrzowmaNjVj
         EDfEuga8jzLhLzmnp4MTRVRntTM5OYG48BtG4uP6drYfRQoTRF5Se2NfuKMSYC3WutNy
         M9OA==
X-Gm-Message-State: AOAM533iYcowclLOhEzgERTb951ids8nFLGB70T2xInwWc1Ee3LMDniN
        iXR+i3prkDFJK+gzevv4EirctPrAfG3O6Q==
X-Google-Smtp-Source: ABdhPJynKMjkwl5UFgNjKF7OuaMz7tAkY6IAxN9vGA6wP4GfWzdaMmS6c8pUdHE97hHW5FEPT8qMwg==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr8369601wru.366.1639071243809;
        Thu, 09 Dec 2021 09:34:03 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id u13sm10794026wmq.14.2021.12.09.09.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:03 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 01/25] ARM: tegra: Clean up external memory controller nodes
Date:   Thu,  9 Dec 2021 18:33:32 +0100
Message-Id: <20211209173356.618460-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The external memory controller should be sorted after the memory
controller to keep the ordering by unit-address intact. While at it,
rename the emc-timings and timing nodes to avoid including the RAM code
and clock frequency in their names. There is no requirement to do this,
so we can use simple enumerations instead.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |  483 +++--
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |  699 +++---
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  | 1918 +++++++++--------
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  639 +++---
 4 files changed, 1900 insertions(+), 1839 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
index a7ac805eeed5..f1583e64048a 100644
--- a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
@@ -6,76 +6,87 @@
 
 / {
 	clock@60006000 {
-		emc-timings-1 {
+		emc-timings-0 {
 			nvidia,ram-code = <1>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-20400000 {
+
+			timing-1 {
 				clock-frequency = <20400000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-40800000 {
+
+			timing-2 {
 				clock-frequency = <40800000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-68000000 {
+
+			timing-3 {
 				clock-frequency = <68000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-102000000 {
+
+			timing-4 {
 				clock-frequency = <102000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-204000000 {
+
+			timing-5 {
 				clock-frequency = <204000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-300000000 {
+
+			timing-6 {
 				clock-frequency = <300000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
 				clock-names = "emc-parent";
 			};
-			timing-396000000 {
+
+			timing-7 {
 				clock-frequency = <396000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
 				clock-names = "emc-parent";
 			};
-			timing-528000000 {
+
+			timing-8 {
 				clock-frequency = <528000000>;
 				nvidia,parent-clock-frequency = <528000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-600000000 {
+
+			timing-9 {
 				clock-frequency = <600000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-792000000 {
+
+			timing-10 {
 				clock-frequency = <792000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-924000000 {
+
+			timing-11 {
 				clock-frequency = <924000000>;
 				nvidia,parent-clock-frequency = <924000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
@@ -84,11 +95,221 @@ timing-924000000 {
 		};
 	};
 
+	memory-controller@70019000 {
+		emc-timings-0 {
+			nvidia,ram-code = <1>;
+
+			timing-0 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 0x8000000a
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x77e30303 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-1 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 0x80000012
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x76230303 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-2 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 0x80000017
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x74a30303 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-3 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 0x8000001e
+					0x00000001 0x00000001
+					0x00000002 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0502
+					0x74230403 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-4 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 0x80000026
+					0x00000001 0x00000001
+					0x00000003 0x00000000
+					0x00000002 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000003 0x00000006
+					0x06030203 0x000a0503
+					0x73c30504 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-5 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 0x80000040
+					0x00000001 0x00000001
+					0x00000004 0x00000002
+					0x00000003 0x00000001
+					0x00000003 0x00000008
+					0x00000003 0x00000002
+					0x00000004 0x00000006
+					0x06040203 0x000a0504
+					0x73840a05 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-6 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 0x80000040
+					0x00000001 0x00000002
+					0x00000007 0x00000004
+					0x00000004 0x00000001
+					0x00000002 0x00000007
+					0x00000002 0x00000002
+					0x00000004 0x00000006
+					0x06040202 0x000b0607
+					0x77450e08 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-7 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 0x80000040
+					0x00000001 0x00000002
+					0x00000009 0x00000005
+					0x00000006 0x00000001
+					0x00000002 0x00000008
+					0x00000002 0x00000002
+					0x00000004 0x00000006
+					0x06040202 0x000d0709
+					0x7586120a 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-8 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007 0x80000040
+					0x00000002 0x00000003
+					0x0000000c 0x00000007
+					0x00000008 0x00000001
+					0x00000002 0x00000009
+					0x00000002 0x00000002
+					0x00000005 0x00000006
+					0x06050202 0x0010090c
+					0x7428180d 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-9 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009 0x80000040
+					0x00000003 0x00000004
+					0x0000000e 0x00000009
+					0x0000000a 0x00000001
+					0x00000003 0x0000000b
+					0x00000002 0x00000002
+					0x00000005 0x00000007
+					0x07050202 0x00130b0e
+					0x73a91b0f 0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-10 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b 0x80000040
+					0x00000004 0x00000005
+					0x00000013 0x0000000c
+					0x0000000d 0x00000002
+					0x00000003 0x0000000c
+					0x00000002 0x00000002
+					0x00000006 0x00000008
+					0x08060202 0x00170e13
+					0x736c2414 0x70000f02
+					0x001f0000
+				>;
+			};
+
+			timing-11 {
+				clock-frequency = <924000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000d 0x80000040
+					0x00000005 0x00000006
+					0x00000016 0x0000000e
+					0x0000000f 0x00000002
+					0x00000004 0x0000000e
+					0x00000002 0x00000002
+					0x00000006 0x00000009
+					0x09060202 0x001a1016
+					0x734e2a17 0x70000f02
+					0x001f0000
+				>;
+			};
+		};
+	};
+
 	external-memory-controller@7001b000 {
-		emc-timings-1 {
+		emc-timings-0 {
 			nvidia,ram-code = <1>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -185,7 +406,7 @@ timing-12750000 {
 				>;
 			};
 
-			timing-20400000 {
+			timing-1 {
 				clock-frequency = <20400000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -282,7 +503,7 @@ timing-20400000 {
 				>;
 			};
 
-			timing-40800000 {
+			timing-2 {
 				clock-frequency = <40800000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -379,7 +600,7 @@ timing-40800000 {
 				>;
 			};
 
-			timing-68000000 {
+			timing-3 {
 				clock-frequency = <68000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -476,7 +697,7 @@ timing-68000000 {
 				>;
 			};
 
-			timing-102000000 {
+			timing-4 {
 				clock-frequency = <102000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -573,7 +794,7 @@ timing-102000000 {
 				>;
 			};
 
-			timing-204000000 {
+			timing-5 {
 				clock-frequency = <204000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -670,7 +891,7 @@ timing-204000000 {
 				>;
 			};
 
-			timing-300000000 {
+			timing-6 {
 				clock-frequency = <300000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -767,7 +988,7 @@ timing-300000000 {
 				>;
 			};
 
-			timing-396000000 {
+			timing-7 {
 				clock-frequency = <396000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -864,7 +1085,7 @@ timing-396000000 {
 				>;
 			};
 
-			timing-528000000 {
+			timing-8 {
 				clock-frequency = <528000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -961,7 +1182,7 @@ timing-528000000 {
 				>;
 			};
 
-			timing-600000000 {
+			timing-9 {
 				clock-frequency = <600000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1058,7 +1279,7 @@ timing-600000000 {
 				>;
 			};
 
-			timing-792000000 {
+			timing-10 {
 				clock-frequency = <792000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1155,7 +1376,7 @@ timing-792000000 {
 				>;
 			};
 
-			timing-924000000 {
+			timing-11 {
 				clock-frequency = <924000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430303>;
@@ -1254,216 +1475,6 @@ timing-924000000 {
 
 		};
 	};
-
-	memory-controller@70019000 {
-		emc-timings-1 {
-			nvidia,ram-code = <1>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emem-configuration = <
-					0x40040001 0x8000000a
-					0x00000001 0x00000001
-					0x00000002 0x00000000
-					0x00000002 0x00000001
-					0x00000003 0x00000008
-					0x00000003 0x00000002
-					0x00000003 0x00000006
-					0x06030203 0x000a0502
-					0x77e30303 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-20400000 {
-				clock-frequency = <20400000>;
-
-				nvidia,emem-configuration = <
-					0x40020001 0x80000012
-					0x00000001 0x00000001
-					0x00000002 0x00000000
-					0x00000002 0x00000001
-					0x00000003 0x00000008
-					0x00000003 0x00000002
-					0x00000003 0x00000006
-					0x06030203 0x000a0502
-					0x76230303 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-40800000 {
-				clock-frequency = <40800000>;
-
-				nvidia,emem-configuration = <
-					0xa0000001 0x80000017
-					0x00000001 0x00000001
-					0x00000002 0x00000000
-					0x00000002 0x00000001
-					0x00000003 0x00000008
-					0x00000003 0x00000002
-					0x00000003 0x00000006
-					0x06030203 0x000a0502
-					0x74a30303 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-68000000 {
-				clock-frequency = <68000000>;
-
-				nvidia,emem-configuration = <
-					0x00000001 0x8000001e
-					0x00000001 0x00000001
-					0x00000002 0x00000000
-					0x00000002 0x00000001
-					0x00000003 0x00000008
-					0x00000003 0x00000002
-					0x00000003 0x00000006
-					0x06030203 0x000a0502
-					0x74230403 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-102000000 {
-				clock-frequency = <102000000>;
-
-				nvidia,emem-configuration = <
-					0x08000001 0x80000026
-					0x00000001 0x00000001
-					0x00000003 0x00000000
-					0x00000002 0x00000001
-					0x00000003 0x00000008
-					0x00000003 0x00000002
-					0x00000003 0x00000006
-					0x06030203 0x000a0503
-					0x73c30504 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-204000000 {
-				clock-frequency = <204000000>;
-
-				nvidia,emem-configuration = <
-					0x01000003 0x80000040
-					0x00000001 0x00000001
-					0x00000004 0x00000002
-					0x00000003 0x00000001
-					0x00000003 0x00000008
-					0x00000003 0x00000002
-					0x00000004 0x00000006
-					0x06040203 0x000a0504
-					0x73840a05 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-300000000 {
-				clock-frequency = <300000000>;
-
-				nvidia,emem-configuration = <
-					0x08000004 0x80000040
-					0x00000001 0x00000002
-					0x00000007 0x00000004
-					0x00000004 0x00000001
-					0x00000002 0x00000007
-					0x00000002 0x00000002
-					0x00000004 0x00000006
-					0x06040202 0x000b0607
-					0x77450e08 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-396000000 {
-				clock-frequency = <396000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000005 0x80000040
-					0x00000001 0x00000002
-					0x00000009 0x00000005
-					0x00000006 0x00000001
-					0x00000002 0x00000008
-					0x00000002 0x00000002
-					0x00000004 0x00000006
-					0x06040202 0x000d0709
-					0x7586120a 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-528000000 {
-				clock-frequency = <528000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000007 0x80000040
-					0x00000002 0x00000003
-					0x0000000c 0x00000007
-					0x00000008 0x00000001
-					0x00000002 0x00000009
-					0x00000002 0x00000002
-					0x00000005 0x00000006
-					0x06050202 0x0010090c
-					0x7428180d 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-600000000 {
-				clock-frequency = <600000000>;
-
-				nvidia,emem-configuration = <
-					0x00000009 0x80000040
-					0x00000003 0x00000004
-					0x0000000e 0x00000009
-					0x0000000a 0x00000001
-					0x00000003 0x0000000b
-					0x00000002 0x00000002
-					0x00000005 0x00000007
-					0x07050202 0x00130b0e
-					0x73a91b0f 0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-792000000 {
-				clock-frequency = <792000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000b 0x80000040
-					0x00000004 0x00000005
-					0x00000013 0x0000000c
-					0x0000000d 0x00000002
-					0x00000003 0x0000000c
-					0x00000002 0x00000002
-					0x00000006 0x00000008
-					0x08060202 0x00170e13
-					0x736c2414 0x70000f02
-					0x001f0000
-				>;
-			};
-
-			timing-924000000 {
-				clock-frequency = <924000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000d 0x80000040
-					0x00000005 0x00000006
-					0x00000016 0x0000000e
-					0x0000000f 0x00000002
-					0x00000004 0x0000000e
-					0x00000002 0x00000002
-					0x00000006 0x00000009
-					0x09060202 0x001a1016
-					0x734e2a17 0x70000f02
-					0x001f0000
-				>;
-			};
-		};
-	};
 };
 
 &emc_icc_dvfs_opp_table {
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
index df4e463afbd1..d4fdf2716454 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
@@ -1,76 +1,87 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	clock@60006000 {
-		emc-timings-3 {
+		emc-timings-0 {
 			nvidia,ram-code = <3>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-20400000 {
+
+			timing-1 {
 				clock-frequency = <20400000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-40800000 {
+
+			timing-2 {
 				clock-frequency = <40800000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-68000000 {
+
+			timing-3 {
 				clock-frequency = <68000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-102000000 {
+
+			timing-4 {
 				clock-frequency = <102000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-204000000 {
+
+			timing-5 {
 				clock-frequency = <204000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-300000000 {
+
+			timing-6 {
 				clock-frequency = <300000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
 				clock-names = "emc-parent";
 			};
-			timing-396000000 {
+
+			timing-7 {
 				clock-frequency = <396000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
 				clock-names = "emc-parent";
 			};
-			timing-528000000 {
+
+			timing-8 {
 				clock-frequency = <528000000>;
 				nvidia,parent-clock-frequency = <528000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-600000000 {
+
+			timing-9 {
 				clock-frequency = <600000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-792000000 {
+
+			timing-10 {
 				clock-frequency = <792000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-924000000 {
+
+			timing-11 {
 				clock-frequency = <924000000>;
 				nvidia,parent-clock-frequency = <924000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
@@ -79,11 +90,329 @@ timing-924000000 {
 		};
 	};
 
+	memory-controller@70019000 {
+		emc-timings-0 {
+			nvidia,ram-code = <3>;
+
+			timing-0 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001
+					0x8000000a
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000003
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0502
+					0x77e30303
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-1 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001
+					0x80000012
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000003
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0502
+					0x76230303
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-2 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001
+					0x80000017
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000003
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0502
+					0x74a30303
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-3 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001
+					0x8000001e
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000003
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0502
+					0x74230403
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-4 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001
+					0x80000026
+					0x00000001
+					0x00000001
+					0x00000003
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000003
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0503
+					0x73c30504
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-5 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003
+					0x80000040
+					0x00000001
+					0x00000001
+					0x00000004
+					0x00000002
+					0x00000003
+					0x00000001
+					0x00000003
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000004
+					0x00000006
+					0x06040203
+					0x000a0504
+					0x73840a05
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-6 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004
+					0x80000040
+					0x00000001
+					0x00000002
+					0x00000007
+					0x00000004
+					0x00000004
+					0x00000001
+					0x00000002
+					0x00000007
+					0x00000002
+					0x00000002
+					0x00000004
+					0x00000006
+					0x06040202
+					0x000b0607
+					0x77450e08
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-7 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005
+					0x80000040
+					0x00000001
+					0x00000002
+					0x00000009
+					0x00000005
+					0x00000006
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000002
+					0x00000002
+					0x00000004
+					0x00000006
+					0x06040202
+					0x000d0709
+					0x7586120a
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-8 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007
+					0x80000040
+					0x00000002
+					0x00000003
+					0x0000000c
+					0x00000007
+					0x00000008
+					0x00000001
+					0x00000002
+					0x00000009
+					0x00000002
+					0x00000002
+					0x00000005
+					0x00000006
+					0x06050202
+					0x0010090c
+					0x7428180d
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-9 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009
+					0x80000040
+					0x00000003
+					0x00000004
+					0x0000000e
+					0x00000009
+					0x0000000a
+					0x00000001
+					0x00000003
+					0x0000000b
+					0x00000002
+					0x00000002
+					0x00000005
+					0x00000007
+					0x07050202
+					0x00130b0e
+					0x73a91b0f
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-10 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b
+					0x80000040
+					0x00000004
+					0x00000005
+					0x00000013
+					0x0000000c
+					0x0000000d
+					0x00000002
+					0x00000003
+					0x0000000c
+					0x00000002
+					0x00000002
+					0x00000006
+					0x00000008
+					0x08060202
+					0x00170e13
+					0x736c2414
+					0x70000f02
+					0x001f0000
+				>;
+			};
+
+			timing-11 {
+				clock-frequency = <924000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000d
+					0x80000040
+					0x00000005
+					0x00000006
+					0x00000016
+					0x0000000e
+					0x0000000f
+					0x00000002
+					0x00000004
+					0x0000000e
+					0x00000002
+					0x00000002
+					0x00000006
+					0x00000009
+					0x09060202
+					0x001a1016
+					0x734e2a17
+					0x70000f02
+					0x001f0000
+				>;
+			};
+		};
+	};
+
 	external-memory-controller@7001b000 {
-		emc-timings-3 {
+		emc-timings-0 {
 			nvidia,ram-code = <3>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -251,7 +580,7 @@ timing-12750000 {
 				>;
 			};
 
-			timing-20400000 {
+			timing-1 {
 				clock-frequency = <20400000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -419,7 +748,7 @@ timing-20400000 {
 				>;
 			};
 
-			timing-40800000 {
+			timing-2 {
 				clock-frequency = <40800000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -587,7 +916,7 @@ timing-40800000 {
 				>;
 			};
 
-			timing-68000000 {
+			timing-3 {
 				clock-frequency = <68000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -755,7 +1084,7 @@ timing-68000000 {
 				>;
 			};
 
-			timing-102000000 {
+			timing-4 {
 				clock-frequency = <102000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -923,7 +1252,7 @@ timing-102000000 {
 				>;
 			};
 
-			timing-204000000 {
+			timing-5 {
 				clock-frequency = <204000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1091,7 +1420,7 @@ timing-204000000 {
 				>;
 			};
 
-			timing-300000000 {
+			timing-6 {
 				clock-frequency = <300000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1259,7 +1588,7 @@ timing-300000000 {
 				>;
 			};
 
-			timing-396000000 {
+			timing-7 {
 				clock-frequency = <396000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1427,7 +1756,7 @@ timing-396000000 {
 				>;
 			};
 
-			timing-528000000 {
+			timing-8 {
 				clock-frequency = <528000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1595,7 +1924,7 @@ timing-528000000 {
 				>;
 			};
 
-			timing-600000000 {
+			timing-9 {
 				clock-frequency = <600000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1763,7 +2092,7 @@ timing-600000000 {
 				>;
 			};
 
-			timing-792000000 {
+			timing-10 {
 				clock-frequency = <792000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1931,7 +2260,7 @@ timing-792000000 {
 				>;
 			};
 
-			timing-924000000 {
+			timing-11 {
 				clock-frequency = <924000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430303>;
@@ -2101,324 +2430,6 @@ timing-924000000 {
 
 		};
 	};
-
-	memory-controller@70019000 {
-		emc-timings-3 {
-			nvidia,ram-code = <3>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emem-configuration = <
-					0x40040001
-					0x8000000a
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000003
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0502
-					0x77e30303
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-20400000 {
-				clock-frequency = <20400000>;
-
-				nvidia,emem-configuration = <
-					0x40020001
-					0x80000012
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000003
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0502
-					0x76230303
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-40800000 {
-				clock-frequency = <40800000>;
-
-				nvidia,emem-configuration = <
-					0xa0000001
-					0x80000017
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000003
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0502
-					0x74a30303
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-68000000 {
-				clock-frequency = <68000000>;
-
-				nvidia,emem-configuration = <
-					0x00000001
-					0x8000001e
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000003
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0502
-					0x74230403
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-102000000 {
-				clock-frequency = <102000000>;
-
-				nvidia,emem-configuration = <
-					0x08000001
-					0x80000026
-					0x00000001
-					0x00000001
-					0x00000003
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000003
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0503
-					0x73c30504
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-204000000 {
-				clock-frequency = <204000000>;
-
-				nvidia,emem-configuration = <
-					0x01000003
-					0x80000040
-					0x00000001
-					0x00000001
-					0x00000004
-					0x00000002
-					0x00000003
-					0x00000001
-					0x00000003
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040203
-					0x000a0504
-					0x73840a05
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-300000000 {
-				clock-frequency = <300000000>;
-
-				nvidia,emem-configuration = <
-					0x08000004
-					0x80000040
-					0x00000001
-					0x00000002
-					0x00000007
-					0x00000004
-					0x00000004
-					0x00000001
-					0x00000002
-					0x00000007
-					0x00000002
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040202
-					0x000b0607
-					0x77450e08
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-396000000 {
-				clock-frequency = <396000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000005
-					0x80000040
-					0x00000001
-					0x00000002
-					0x00000009
-					0x00000005
-					0x00000006
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000002
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040202
-					0x000d0709
-					0x7586120a
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-528000000 {
-				clock-frequency = <528000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000007
-					0x80000040
-					0x00000002
-					0x00000003
-					0x0000000c
-					0x00000007
-					0x00000008
-					0x00000001
-					0x00000002
-					0x00000009
-					0x00000002
-					0x00000002
-					0x00000005
-					0x00000006
-					0x06050202
-					0x0010090c
-					0x7428180d
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-600000000 {
-				clock-frequency = <600000000>;
-
-				nvidia,emem-configuration = <
-					0x00000009
-					0x80000040
-					0x00000003
-					0x00000004
-					0x0000000e
-					0x00000009
-					0x0000000a
-					0x00000001
-					0x00000003
-					0x0000000b
-					0x00000002
-					0x00000002
-					0x00000005
-					0x00000007
-					0x07050202
-					0x00130b0e
-					0x73a91b0f
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-792000000 {
-				clock-frequency = <792000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000b
-					0x80000040
-					0x00000004
-					0x00000005
-					0x00000013
-					0x0000000c
-					0x0000000d
-					0x00000002
-					0x00000003
-					0x0000000c
-					0x00000002
-					0x00000002
-					0x00000006
-					0x00000008
-					0x08060202
-					0x00170e13
-					0x736c2414
-					0x70000f02
-					0x001f0000
-				>;
-			};
-
-			timing-924000000 {
-				clock-frequency = <924000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000d
-					0x80000040
-					0x00000005
-					0x00000006
-					0x00000016
-					0x0000000e
-					0x0000000f
-					0x00000002
-					0x00000004
-					0x0000000e
-					0x00000002
-					0x00000002
-					0x00000006
-					0x00000009
-					0x09060202
-					0x001a1016
-					0x734e2a17
-					0x70000f02
-					0x001f0000
-				>;
-			};
-		};
-	};
 };
 
 &emc_icc_dvfs_opp_table {
diff --git a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
index a0f56cc9da5c..ad0711500087 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
@@ -5,70 +5,80 @@ apbmisc@70000800 {
 	};
 
 	clock@60006000 {
-		emc-timings-1 {
+		emc-timings-0 {
 			nvidia,ram-code = <1>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-20400000 {
+
+			timing-1 {
 				clock-frequency = <20400000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-40800000 {
+
+			timing-2 {
 				clock-frequency = <40800000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-68000000 {
+
+			timing-3 {
 				clock-frequency = <68000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-102000000 {
+
+			timing-4 {
 				clock-frequency = <102000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-204000000 {
+
+			timing-5 {
 				clock-frequency = <204000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-300000000 {
+
+			timing-6 {
 				clock-frequency = <300000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
 				clock-names = "emc-parent";
 			};
-			timing-396000000 {
+
+			timing-7 {
 				clock-frequency = <396000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
 				clock-names = "emc-parent";
 			};
-			timing-528000000 {
+
+			timing-8 {
 				clock-frequency = <528000000>;
 				nvidia,parent-clock-frequency = <528000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-600000000 {
+
+			timing-9 {
 				clock-frequency = <600000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-792000000 {
+
+			timing-10 {
 				clock-frequency = <792000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
@@ -76,70 +86,80 @@ timing-792000000 {
 			};
 		};
 
-		emc-timings-4 {
+		emc-timings-1 {
 			nvidia,ram-code = <4>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-20400000 {
+
+			timing-1 {
 				clock-frequency = <20400000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-40800000 {
+
+			timing-2 {
 				clock-frequency = <40800000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-68000000 {
+
+			timing-3 {
 				clock-frequency = <68000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-102000000 {
+
+			timing-4 {
 				clock-frequency = <102000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-204000000 {
+
+			timing-5 {
 				clock-frequency = <204000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-300000000 {
+
+			timing-6 {
 				clock-frequency = <300000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
 				clock-names = "emc-parent";
 			};
-			timing-396000000 {
+
+			timing-7 {
 				clock-frequency = <396000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
 				clock-names = "emc-parent";
 			};
-			timing-528000000 {
+
+			timing-8 {
 				clock-frequency = <528000000>;
 				nvidia,parent-clock-frequency = <528000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-600000000 {
+
+			timing-9 {
 				clock-frequency = <600000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-792000000 {
+
+			timing-10 {
 				clock-frequency = <792000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
@@ -147,70 +167,80 @@ timing-792000000 {
 			};
 		};
 
-		emc-timings-6 {
+		emc-timings-2 {
 			nvidia,ram-code = <6>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-20400000 {
+
+			timing-1 {
 				clock-frequency = <20400000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-40800000 {
+
+			timing-2 {
 				clock-frequency = <40800000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-68000000 {
+
+			timing-3 {
 				clock-frequency = <68000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-102000000 {
+
+			timing-4 {
 				clock-frequency = <102000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-204000000 {
+
+			timing-5 {
 				clock-frequency = <204000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-300000000 {
+
+			timing-6 {
 				clock-frequency = <300000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
 				clock-names = "emc-parent";
 			};
-			timing-396000000 {
+
+			timing-7 {
 				clock-frequency = <396000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
 				clock-names = "emc-parent";
 			};
-			timing-528000000 {
+
+			timing-8 {
 				clock-frequency = <528000000>;
 				nvidia,parent-clock-frequency = <528000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-600000000 {
+
+			timing-9 {
 				clock-frequency = <600000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-792000000 {
+
+			timing-10 {
 				clock-frequency = <792000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
@@ -219,11 +249,883 @@ timing-792000000 {
 		};
 	};
 
-	external-memory-controller@7001b000 {
+	memory-controller@70019000 {
+		emc-timings-0 {
+			nvidia,ram-code = <1>;
+
+			timing-0 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 /* MC_EMEM_ARB_CFG */
+					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x77e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-1 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 /* MC_EMEM_ARB_CFG */
+					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x76230303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-2 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 /* MC_EMEM_ARB_CFG */
+					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74a30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-3 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74230403 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-4 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 /* MC_EMEM_ARB_CFG */
+					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0403 /* MC_EMEM_ARB_DA_COVERS */
+					0x73c30504 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-5 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0405 /* MC_EMEM_ARB_DA_COVERS */
+					0x73840a06 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-6 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
+					0x77450e08 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-7 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+					0x7586120a /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-8 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000d /* MC_EMEM_ARB_TIMING_RC */
+					0x00000008 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x0010090d /* MC_EMEM_ARB_DA_COVERS */
+					0x7428180e /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-9 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
+					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
+					0x73a91b0f /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-10 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
+					0x734c2414 /* MC_EMEM_ARB_MISC0 */
+					0x70000f02 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+		};
+
 		emc-timings-1 {
+			nvidia,ram-code = <4>;
+
+			timing-0 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 /* MC_EMEM_ARB_CFG */
+					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x77e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-1 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 /* MC_EMEM_ARB_CFG */
+					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x77430303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-2 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 /* MC_EMEM_ARB_CFG */
+					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x75e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-3 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x75430403 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-4 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 /* MC_EMEM_ARB_CFG */
+					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
+					0x74e30504 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-5 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0504 /* MC_EMEM_ARB_DA_COVERS */
+					0x74a40a05 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-6 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
+					0x77450e08 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-7 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+					0x7586120a /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-8 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RC */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x0010090c /* MC_EMEM_ARB_DA_COVERS */
+					0x7488180d /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-9 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
+					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
+					0x74691b0f /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-10 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00170e13 /* MC_EMEM_ARB_DA_COVERS */
+					0x746c2414 /* MC_EMEM_ARB_MISC0 */
+					0x70000f02 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+		};
+
+		emc-timings-2 {
+			nvidia,ram-code = <6>;
+
+			timing-0 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 /* MC_EMEM_ARB_CFG */
+					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x77e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-1 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 /* MC_EMEM_ARB_CFG */
+					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x76230303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-2 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 /* MC_EMEM_ARB_CFG */
+					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74a30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-3 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74230403 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-4 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 /* MC_EMEM_ARB_CFG */
+					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0403 /* MC_EMEM_ARB_DA_COVERS */
+					0x73c30504 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-5 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0405 /* MC_EMEM_ARB_DA_COVERS */
+					0x73840a06 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-6 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
+					0x77450e08 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-7 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+					0x7586120a /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-8 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000d /* MC_EMEM_ARB_TIMING_RC */
+					0x00000008 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x0010090d /* MC_EMEM_ARB_DA_COVERS */
+					0x7428180e /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-9 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
+					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
+					0x73a91b0f /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-10 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
+					0x734c2414 /* MC_EMEM_ARB_MISC0 */
+					0x70000f02 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+		};
+	};
+
+	external-memory-controller@7001b000 {
+		emc-timings-0 {
 			nvidia,ram-code = <1>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -391,7 +1293,7 @@ timing-12750000 {
 				>;
 			};
 
-			timing-20400000 {
+			timing-1 {
 				clock-frequency = <20400000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -559,7 +1461,7 @@ timing-20400000 {
 				>;
 			};
 
-			timing-40800000 {
+			timing-2 {
 				clock-frequency = <40800000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -727,7 +1629,7 @@ timing-40800000 {
 				>;
 			};
 
-			timing-68000000 {
+			timing-3 {
 				clock-frequency = <68000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -895,7 +1797,7 @@ timing-68000000 {
 				>;
 			};
 
-			timing-102000000 {
+			timing-4 {
 				clock-frequency = <102000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1063,7 +1965,7 @@ timing-102000000 {
 				>;
 			};
 
-			timing-204000000 {
+			timing-5 {
 				clock-frequency = <204000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1231,7 +2133,7 @@ timing-204000000 {
 				>;
 			};
 
-			timing-300000000 {
+			timing-6 {
 				clock-frequency = <300000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1399,7 +2301,7 @@ timing-300000000 {
 				>;
 			};
 
-			timing-396000000 {
+			timing-7 {
 				clock-frequency = <396000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1567,7 +2469,7 @@ timing-396000000 {
 				>;
 			};
 
-			timing-528000000 {
+			timing-8 {
 				clock-frequency = <528000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1735,7 +2637,7 @@ timing-528000000 {
 				>;
 			};
 
-			timing-600000000 {
+			timing-9 {
 				clock-frequency = <600000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1903,7 +2805,7 @@ timing-600000000 {
 				>;
 			};
 
-			timing-792000000 {
+			timing-10 {
 				clock-frequency = <792000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -2072,10 +2974,10 @@ timing-792000000 {
 			};
 		};
 
-		emc-timings-4 {
+		emc-timings-1 {
 			nvidia,ram-code = <4>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -2243,7 +3145,7 @@ timing-12750000 {
 				>;
 			};
 
-			timing-20400000 {
+			timing-1 {
 				clock-frequency = <20400000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -2411,7 +3313,7 @@ timing-20400000 {
 				>;
 			};
 
-			timing-40800000 {
+			timing-2 {
 				clock-frequency = <40800000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -2579,7 +3481,7 @@ timing-40800000 {
 				>;
 			};
 
-			timing-68000000 {
+			timing-3 {
 				clock-frequency = <68000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -2747,7 +3649,7 @@ timing-68000000 {
 				>;
 			};
 
-			timing-102000000 {
+			timing-4 {
 				clock-frequency = <102000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -2915,7 +3817,7 @@ timing-102000000 {
 				>;
 			};
 
-			timing-204000000 {
+			timing-5 {
 				clock-frequency = <204000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -3083,7 +3985,7 @@ timing-204000000 {
 				>;
 			};
 
-			timing-300000000 {
+			timing-6 {
 				clock-frequency = <300000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -3251,7 +4153,7 @@ timing-300000000 {
 				>;
 			};
 
-			timing-396000000 {
+			timing-7 {
 				clock-frequency = <396000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -3419,7 +4321,7 @@ timing-396000000 {
 				>;
 			};
 
-			timing-528000000 {
+			timing-8 {
 				clock-frequency = <528000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -3587,7 +4489,7 @@ timing-528000000 {
 				>;
 			};
 
-			timing-600000000 {
+			timing-9 {
 				clock-frequency = <600000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -3755,7 +4657,7 @@ timing-600000000 {
 				>;
 			};
 
-			timing-792000000 {
+			timing-10 {
 				clock-frequency = <792000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -3924,10 +4826,10 @@ timing-792000000 {
 			};
 		};
 
-		emc-timings-6 {
+		emc-timings-2 {
 			nvidia,ram-code = <6>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -4095,7 +4997,7 @@ timing-12750000 {
 				>;
 			};
 
-			timing-20400000 {
+			timing-1 {
 				clock-frequency = <20400000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -4263,7 +5165,7 @@ timing-20400000 {
 				>;
 			};
 
-			timing-40800000 {
+			timing-2 {
 				clock-frequency = <40800000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -4431,7 +5333,7 @@ timing-40800000 {
 				>;
 			};
 
-			timing-68000000 {
+			timing-3 {
 				clock-frequency = <68000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -4599,7 +5501,7 @@ timing-68000000 {
 				>;
 			};
 
-			timing-102000000 {
+			timing-4 {
 				clock-frequency = <102000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -4767,7 +5669,7 @@ timing-102000000 {
 				>;
 			};
 
-			timing-204000000 {
+			timing-5 {
 				clock-frequency = <204000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -4935,7 +5837,7 @@ timing-204000000 {
 				>;
 			};
 
-			timing-300000000 {
+			timing-6 {
 				clock-frequency = <300000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -5103,7 +6005,7 @@ timing-300000000 {
 				>;
 			};
 
-			timing-396000000 {
+			timing-7 {
 				clock-frequency = <396000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -5271,7 +6173,7 @@ timing-396000000 {
 				>;
 			};
 
-			timing-528000000 {
+			timing-8 {
 				clock-frequency = <528000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -5439,7 +6341,7 @@ timing-528000000 {
 				>;
 			};
 
-			timing-600000000 {
+			timing-9 {
 				clock-frequency = <600000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -5607,7 +6509,7 @@ timing-600000000 {
 				>;
 			};
 
-			timing-792000000 {
+			timing-10 {
 				clock-frequency = <792000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -5776,878 +6678,6 @@ timing-792000000 {
 			};
 		};
 	};
-
-	memory-controller@70019000 {
-		emc-timings-1 {
-			nvidia,ram-code = <1>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emem-configuration = <
-					0x40040001 /* MC_EMEM_ARB_CFG */
-					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x77e30303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-20400000 {
-				clock-frequency = <20400000>;
-
-				nvidia,emem-configuration = <
-					0x40020001 /* MC_EMEM_ARB_CFG */
-					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x76230303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-40800000 {
-				clock-frequency = <40800000>;
-
-				nvidia,emem-configuration = <
-					0xa0000001 /* MC_EMEM_ARB_CFG */
-					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x74a30303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-68000000 {
-				clock-frequency = <68000000>;
-
-				nvidia,emem-configuration = <
-					0x00000001 /* MC_EMEM_ARB_CFG */
-					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x74230403 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-102000000 {
-				clock-frequency = <102000000>;
-
-				nvidia,emem-configuration = <
-					0x08000001 /* MC_EMEM_ARB_CFG */
-					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0403 /* MC_EMEM_ARB_DA_COVERS */
-					0x73c30504 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-204000000 {
-				clock-frequency = <204000000>;
-
-				nvidia,emem-configuration = <
-					0x01000003 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0405 /* MC_EMEM_ARB_DA_COVERS */
-					0x73840a06 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-300000000 {
-				clock-frequency = <300000000>;
-
-				nvidia,emem-configuration = <
-					0x08000004 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
-					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
-					0x77450e08 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-396000000 {
-				clock-frequency = <396000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000005 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
-					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
-					0x7586120a /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-528000000 {
-				clock-frequency = <528000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000007 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
-					0x0000000d /* MC_EMEM_ARB_TIMING_RC */
-					0x00000008 /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
-					0x0010090d /* MC_EMEM_ARB_DA_COVERS */
-					0x7428180e /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-600000000 {
-				clock-frequency = <600000000>;
-
-				nvidia,emem-configuration = <
-					0x00000009 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
-					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
-					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
-					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
-					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
-					0x73a91b0f /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-792000000 {
-				clock-frequency = <792000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000b /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
-					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
-					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
-					0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
-					0x734c2414 /* MC_EMEM_ARB_MISC0 */
-					0x70000f02 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-		};
-
-		emc-timings-4 {
-			nvidia,ram-code = <4>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emem-configuration = <
-					0x40040001 /* MC_EMEM_ARB_CFG */
-					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
-					0x77e30303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-20400000 {
-				clock-frequency = <20400000>;
-
-				nvidia,emem-configuration = <
-					0x40020001 /* MC_EMEM_ARB_CFG */
-					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
-					0x77430303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-40800000 {
-				clock-frequency = <40800000>;
-
-				nvidia,emem-configuration = <
-					0xa0000001 /* MC_EMEM_ARB_CFG */
-					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
-					0x75e30303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-68000000 {
-				clock-frequency = <68000000>;
-
-				nvidia,emem-configuration = <
-					0x00000001 /* MC_EMEM_ARB_CFG */
-					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
-					0x75430403 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-102000000 {
-				clock-frequency = <102000000>;
-
-				nvidia,emem-configuration = <
-					0x08000001 /* MC_EMEM_ARB_CFG */
-					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
-					0x74e30504 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-204000000 {
-				clock-frequency = <204000000>;
-
-				nvidia,emem-configuration = <
-					0x01000003 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0504 /* MC_EMEM_ARB_DA_COVERS */
-					0x74a40a05 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-300000000 {
-				clock-frequency = <300000000>;
-
-				nvidia,emem-configuration = <
-					0x08000004 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
-					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
-					0x77450e08 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-396000000 {
-				clock-frequency = <396000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000005 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
-					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
-					0x7586120a /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-528000000 {
-				clock-frequency = <528000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000007 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
-					0x0000000c /* MC_EMEM_ARB_TIMING_RC */
-					0x00000007 /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
-					0x0010090c /* MC_EMEM_ARB_DA_COVERS */
-					0x7488180d /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-600000000 {
-				clock-frequency = <600000000>;
-
-				nvidia,emem-configuration = <
-					0x00000009 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
-					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
-					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
-					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
-					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
-					0x74691b0f /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-792000000 {
-				clock-frequency = <792000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000b /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
-					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
-					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
-					0x00170e13 /* MC_EMEM_ARB_DA_COVERS */
-					0x746c2414 /* MC_EMEM_ARB_MISC0 */
-					0x70000f02 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-		};
-
-		emc-timings-6 {
-			nvidia,ram-code = <6>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emem-configuration = <
-					0x40040001 /* MC_EMEM_ARB_CFG */
-					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x77e30303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-20400000 {
-				clock-frequency = <20400000>;
-
-				nvidia,emem-configuration = <
-					0x40020001 /* MC_EMEM_ARB_CFG */
-					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x76230303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-40800000 {
-				clock-frequency = <40800000>;
-
-				nvidia,emem-configuration = <
-					0xa0000001 /* MC_EMEM_ARB_CFG */
-					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x74a30303 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-68000000 {
-				clock-frequency = <68000000>;
-
-				nvidia,emem-configuration = <
-					0x00000001 /* MC_EMEM_ARB_CFG */
-					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
-					0x74230403 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-102000000 {
-				clock-frequency = <102000000>;
-
-				nvidia,emem-configuration = <
-					0x08000001 /* MC_EMEM_ARB_CFG */
-					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0403 /* MC_EMEM_ARB_DA_COVERS */
-					0x73c30504 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-204000000 {
-				clock-frequency = <204000000>;
-
-				nvidia,emem-configuration = <
-					0x01000003 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
-					0x000a0405 /* MC_EMEM_ARB_DA_COVERS */
-					0x73840a06 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-300000000 {
-				clock-frequency = <300000000>;
-
-				nvidia,emem-configuration = <
-					0x08000004 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
-					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
-					0x77450e08 /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-396000000 {
-				clock-frequency = <396000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000005 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
-					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
-					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
-					0x7586120a /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-528000000 {
-				clock-frequency = <528000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000007 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
-					0x0000000d /* MC_EMEM_ARB_TIMING_RC */
-					0x00000008 /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
-					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
-					0x0010090d /* MC_EMEM_ARB_DA_COVERS */
-					0x7428180e /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-600000000 {
-				clock-frequency = <600000000>;
-
-				nvidia,emem-configuration = <
-					0x00000009 /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
-					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
-					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
-					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
-					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
-					0x73a91b0f /* MC_EMEM_ARB_MISC0 */
-					0x70000f03 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-
-			timing-792000000 {
-				clock-frequency = <792000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000b /* MC_EMEM_ARB_CFG */
-					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
-					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
-					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
-					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
-					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
-					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
-					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
-					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
-					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
-					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
-					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
-					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
-					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
-					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
-					0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
-					0x734c2414 /* MC_EMEM_ARB_MISC0 */
-					0x70000f02 /* MC_EMEM_ARB_MISC1 */
-					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
-				>;
-			};
-		};
-	};
 };
 
 &emc_icc_dvfs_opp_table {
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
index 35c98734d35f..fdafb9d15bce 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
@@ -1,65 +1,75 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	clock@60006000 {
-		emc-timings-1 {
+		emc-timings-0 {
 			nvidia,ram-code = <1>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-20400000 {
+
+			timing-1 {
 				clock-frequency = <20400000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-40800000 {
+
+			timing-2 {
 				clock-frequency = <40800000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-68000000 {
+
+			timing-3 {
 				clock-frequency = <68000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-102000000 {
+
+			timing-4 {
 				clock-frequency = <102000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-204000000 {
+
+			timing-5 {
 				clock-frequency = <204000000>;
 				nvidia,parent-clock-frequency = <408000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
 				clock-names = "emc-parent";
 			};
-			timing-300000000 {
+
+			timing-6 {
 				clock-frequency = <300000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
 				clock-names = "emc-parent";
 			};
-			timing-396000000 {
+
+			timing-7 {
 				clock-frequency = <396000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
 				clock-names = "emc-parent";
 			};
+
 			/* TODO: Add 528MHz frequency */
-			timing-600000000 {
+
+			timing-9 {
 				clock-frequency = <600000000>;
 				nvidia,parent-clock-frequency = <600000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
 				clock-names = "emc-parent";
 			};
-			timing-792000000 {
+
+			timing-10 {
 				clock-frequency = <792000000>;
 				nvidia,parent-clock-frequency = <792000000>;
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
@@ -68,11 +78,303 @@ timing-792000000 {
 		};
 	};
 
+	memory-controller@70019000 {
+		emc-timings-0 {
+			nvidia,ram-code = <1>;
+
+			timing-0 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001
+					0x8000000a
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0402
+					0x77e30303
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-1 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001
+					0x80000012
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0402
+					0x76230303
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-2 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001
+					0x80000017
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0402
+					0x74a30303
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-3 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001
+					0x8000001e
+					0x00000001
+					0x00000001
+					0x00000002
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0402
+					0x74230403
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-4 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001
+					0x80000026
+					0x00000001
+					0x00000001
+					0x00000003
+					0x00000000
+					0x00000002
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000003
+					0x00000006
+					0x06030203
+					0x000a0403
+					0x73c30504
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-5 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003
+					0x80000040
+					0x00000001
+					0x00000001
+					0x00000005
+					0x00000002
+					0x00000004
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000003
+					0x00000002
+					0x00000004
+					0x00000006
+					0x06040203
+					0x000a0405
+					0x73840a06
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-6 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004
+					0x80000040
+					0x00000001
+					0x00000002
+					0x00000007
+					0x00000004
+					0x00000005
+					0x00000001
+					0x00000002
+					0x00000007
+					0x00000002
+					0x00000002
+					0x00000004
+					0x00000006
+					0x06040202
+					0x000b0607
+					0x77450e08
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-7 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005
+					0x80000040
+					0x00000001
+					0x00000002
+					0x00000009
+					0x00000005
+					0x00000007
+					0x00000001
+					0x00000002
+					0x00000008
+					0x00000002
+					0x00000002
+					0x00000004
+					0x00000006
+					0x06040202
+					0x000d0709
+					0x7586120a
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-8 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007
+					0x80000040
+					0x00000002
+					0x00000003
+					0x0000000d
+					0x00000008
+					0x0000000a
+					0x00000001
+					0x00000002
+					0x00000009
+					0x00000002
+					0x00000002
+					0x00000005
+					0x00000006
+					0x06050202
+					0x0010090d
+					0x7428180e
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-9 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009
+					0x80000040
+					0x00000003
+					0x00000004
+					0x0000000e
+					0x00000009
+					0x0000000b
+					0x00000001
+					0x00000003
+					0x0000000b
+					0x00000002
+					0x00000002
+					0x00000005
+					0x00000007
+					0x07050202
+					0x00130b0e
+					0x73a91b0f
+					0x70000f03
+					0x001f0000
+				>;
+			};
+
+			timing-10 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b
+					0x80000040
+					0x00000004
+					0x00000005
+					0x00000013
+					0x0000000c
+					0x0000000f
+					0x00000002
+					0x00000003
+					0x0000000c
+					0x00000002
+					0x00000002
+					0x00000006
+					0x00000008
+					0x08060202
+					0x00160d13
+					0x734c2414
+					0x70000f02
+					0x001f0000
+				>;
+			};
+		};
+	};
+
 	external-memory-controller@7001b000 {
-		emc-timings-1 {
+		emc-timings-0 {
 			nvidia,ram-code = <1>;
 
-			timing-12750000 {
+			timing-0 {
 				clock-frequency = <12750000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -240,7 +542,7 @@ timing-12750000 {
 				>;
 			};
 
-			timing-20400000 {
+			timing-1 {
 				clock-frequency = <20400000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -408,7 +710,7 @@ timing-20400000 {
 				>;
 			};
 
-			timing-40800000 {
+			timing-2 {
 				clock-frequency = <40800000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -576,7 +878,7 @@ timing-40800000 {
 				>;
 			};
 
-			timing-68000000 {
+			timing-3 {
 				clock-frequency = <68000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -744,7 +1046,7 @@ timing-68000000 {
 				>;
 			};
 
-			timing-102000000 {
+			timing-4 {
 				clock-frequency = <102000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -912,7 +1214,7 @@ timing-102000000 {
 				>;
 			};
 
-			timing-204000000 {
+			timing-5 {
 				clock-frequency = <204000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1080,7 +1382,7 @@ timing-204000000 {
 				>;
 			};
 
-			timing-300000000 {
+			timing-6 {
 				clock-frequency = <300000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1248,7 +1550,7 @@ timing-300000000 {
 				>;
 			};
 
-			timing-396000000 {
+			timing-7 {
 				clock-frequency = <396000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1416,7 +1718,7 @@ timing-396000000 {
 				>;
 			};
 
-			timing-600000000 {
+			timing-9 {
 				clock-frequency = <600000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1584,7 +1886,7 @@ timing-600000000 {
 				>;
 			};
 
-			timing-792000000 {
+			timing-10 {
 				clock-frequency = <792000000>;
 
 				nvidia,emc-auto-cal-config = <0xa1430000>;
@@ -1754,299 +2056,6 @@ timing-792000000 {
 
 		};
 	};
-
-	memory-controller@70019000 {
-		emc-timings-1 {
-			nvidia,ram-code = <1>;
-
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emem-configuration = <
-					0x40040001
-					0x8000000a
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x77e30303
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-20400000 {
-				clock-frequency = <20400000>;
-
-				nvidia,emem-configuration = <
-					0x40020001
-					0x80000012
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x76230303
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-40800000 {
-				clock-frequency = <40800000>;
-
-				nvidia,emem-configuration = <
-					0xa0000001
-					0x80000017
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x74a30303
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-68000000 {
-				clock-frequency = <68000000>;
-
-				nvidia,emem-configuration = <
-					0x00000001
-					0x8000001e
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x74230403
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-102000000 {
-				clock-frequency = <102000000>;
-
-				nvidia,emem-configuration = <
-					0x08000001
-					0x80000026
-					0x00000001
-					0x00000001
-					0x00000003
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0403
-					0x73c30504
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-204000000 {
-				clock-frequency = <204000000>;
-
-				nvidia,emem-configuration = <
-					0x01000003
-					0x80000040
-					0x00000001
-					0x00000001
-					0x00000005
-					0x00000002
-					0x00000004
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040203
-					0x000a0405
-					0x73840a06
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-300000000 {
-				clock-frequency = <300000000>;
-
-				nvidia,emem-configuration = <
-					0x08000004
-					0x80000040
-					0x00000001
-					0x00000002
-					0x00000007
-					0x00000004
-					0x00000005
-					0x00000001
-					0x00000002
-					0x00000007
-					0x00000002
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040202
-					0x000b0607
-					0x77450e08
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-396000000 {
-				clock-frequency = <396000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000005
-					0x80000040
-					0x00000001
-					0x00000002
-					0x00000009
-					0x00000005
-					0x00000007
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000002
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040202
-					0x000d0709
-					0x7586120a
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-528000000 {
-				clock-frequency = <528000000>;
-
-				nvidia,emem-configuration = <
-					0x0f000007
-					0x80000040
-					0x00000002
-					0x00000003
-					0x0000000d
-					0x00000008
-					0x0000000a
-					0x00000001
-					0x00000002
-					0x00000009
-					0x00000002
-					0x00000002
-					0x00000005
-					0x00000006
-					0x06050202
-					0x0010090d
-					0x7428180e
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-600000000 {
-				clock-frequency = <600000000>;
-
-				nvidia,emem-configuration = <
-					0x00000009
-					0x80000040
-					0x00000003
-					0x00000004
-					0x0000000e
-					0x00000009
-					0x0000000b
-					0x00000001
-					0x00000003
-					0x0000000b
-					0x00000002
-					0x00000002
-					0x00000005
-					0x00000007
-					0x07050202
-					0x00130b0e
-					0x73a91b0f
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-792000000 {
-				clock-frequency = <792000000>;
-
-				nvidia,emem-configuration = <
-					0x0e00000b
-					0x80000040
-					0x00000004
-					0x00000005
-					0x00000013
-					0x0000000c
-					0x0000000f
-					0x00000002
-					0x00000003
-					0x0000000c
-					0x00000002
-					0x00000002
-					0x00000006
-					0x00000008
-					0x08060202
-					0x00160d13
-					0x734c2414
-					0x70000f02
-					0x001f0000
-				>;
-			};
-		};
-	};
 };
 
 &emc_icc_dvfs_opp_table {
-- 
2.34.1

