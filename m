Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C4EC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhLIRiG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhLIRiF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:05 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CDAC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:31 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso4677136wmr.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UFQUMYHv1QTMgBFhemHqwlKMXXaou1an8xXgcGwe6VI=;
        b=kfMrxs1Z/tf4qpjj69uZZ5iZRymt/q9kGmChdA/kmutw2CKxl8V9cvDKfkWuhFHZhE
         yd5xTr8/P/JAXi8rK9HZNXNuu9E0+jaK686D3EFzQJEtzIgWkcFsPbweeYtQUCDcwDU2
         x8wPD8hryjdbwu8wozNqOE1OGzhEN9UUOWkBmP/VweegYLm6T5ZvjOrzn/3iuRuIJOcB
         Gkfh+9C0IaXSP6uOUJhMCdIxsXnoxVPs/H4V7hL3V3oDOtjzjv83gJTFR2XnMTOmA5BR
         V3thiqgvmUio6Q0UrXGWnK2nzxzP+/LnGme0JYvVlnpCl3fCnOc8unTOHNC87Y/tO1Vp
         zTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UFQUMYHv1QTMgBFhemHqwlKMXXaou1an8xXgcGwe6VI=;
        b=JzitX6WBJVnCuyuKD4MfRkXC7sQh84nlz5a9JW6One/UA2K3Hsqo76EmWORGWon3LY
         9m5C/pvf/lbKEqWaWZyr9/j85mbzeDJgNYLdiV7f5yP7cUbJpvMULeG8QSrkL4h553hU
         mxHmts/hvu3UKr71vu1FD94ndzg5iHI8KAbv3ZDLjfn9+rpDgJ+qejdSrJvh+c+dpKsu
         2mXW8rc2kVXJ1g41YiSZG7fVwY5mJpF+1xaHFTN+Zclt+A4IVEuT9FhbfT2QIgE0PA+9
         ubaNxbjuMhVhZ5caX/yo5XkY88NjhgAFZqW7Nn5JlBORxFLXtuom0/Cir+gN1tY5+ojV
         SD8A==
X-Gm-Message-State: AOAM533q4TxKquJJomcI2wIGr+LCMtEYzTYPSCeBxz5+pW/KTdpbyy/T
        zGfbxWQeNewpSLCOKsAnzwU=
X-Google-Smtp-Source: ABdhPJxubXjfiBycRl134Kp6BdkynFkTWuKq5KYNK7scNbUonXs44Ql+ItuH0Hge2cfmCXf7zDj5vQ==
X-Received: by 2002:a05:600c:19cc:: with SMTP id u12mr9174392wmq.24.1639071269849;
        Thu, 09 Dec 2021 09:34:29 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id y6sm329407wrh.18.2021.12.09.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:29 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 11/25] ARM: tegra: Rename thermal zone nodes
Date:   Thu,  9 Dec 2021 18:33:42 +0100
Message-Id: <20211209173356.618460-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The DT schema requires that nodes representing thermal zones include a
"-thermal" suffix in their name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 6 +++---
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 6 +++---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts   | 6 +++---
 arch/arm/boot/dts/tegra124.dtsi             | 8 ++++----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index b952b272afc0..f5440ae14cb4 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -2024,7 +2024,7 @@ sound {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			trips {
 				cpu-shutdown-trip {
 					temperature = <101000>;
@@ -2034,7 +2034,7 @@ cpu-shutdown-trip {
 			};
 		};
 
-		mem {
+		mem-thermal {
 			trips {
 				mem-shutdown-trip {
 					temperature = <101000>;
@@ -2044,7 +2044,7 @@ mem-shutdown-trip {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			trips {
 				gpu-shutdown-trip {
 					temperature = <101000>;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index e6d25813b416..f168fbbe2a6d 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -2013,7 +2013,7 @@ sound {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			trips {
 				cpu-shutdown-trip {
 					temperature = <101000>;
@@ -2023,7 +2023,7 @@ cpu-shutdown-trip {
 			};
 		};
 
-		mem {
+		mem-thermal {
 			trips {
 				mem-shutdown-trip {
 					temperature = <101000>;
@@ -2033,7 +2033,7 @@ mem-shutdown-trip {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			trips {
 				gpu-shutdown-trip {
 					temperature = <101000>;
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index f76f4e13458a..0d1c17b3d655 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -2047,7 +2047,7 @@ sound {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			trips {
 				cpu-shutdown-trip {
 					temperature = <101000>;
@@ -2057,7 +2057,7 @@ cpu-shutdown-trip {
 			};
 		};
 
-		mem {
+		mem-thermal {
 			trips {
 				mem-shutdown-trip {
 					temperature = <101000>;
@@ -2067,7 +2067,7 @@ mem-shutdown-trip {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			trips {
 				gpu-shutdown-trip {
 					temperature = <101000>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index d0ec1a30ff54..752a28268024 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -1242,7 +1242,7 @@ pmu {
 	};
 
 	thermal-zones {
-		cpu {
+		cpu-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
@@ -1270,7 +1270,7 @@ map0 {
 			};
 		};
 
-		mem {
+		mem-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
@@ -1298,7 +1298,7 @@ cooling-maps {
 			};
 		};
 
-		gpu {
+		gpu-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
@@ -1326,7 +1326,7 @@ map0 {
 			};
 		};
 
-		pllx {
+		pllx-thermal {
 			polling-delay-passive = <1000>;
 			polling-delay = <1000>;
 
-- 
2.34.1

