Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0E6C001B0
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjGQQbZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbjGQQbP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:31:15 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9636D10E6
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 09:30:56 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-521662a6c9cso4787447a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611441; x=1692203441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+6phzlyk9W/amav360WyGK5I/Ac9LQEydcq2azpQFI=;
        b=cyOi6bq/P9v+9mvlyA7cXQtEOTddh49zWBu5X0Q6sM+CnY/6GOPBb4ZM/ubuxYTqLs
         dPSuw/II+B84uYOm1FpNFdCoRMuug/z2t1Gq8va38hAIb5vSF/4Y5CEYS90oemGFqSNc
         Cs+ahCtsQfITV7mBCs+FNvYk7lZUlUnKOGXktoAli6U0u2mgvHjQhG+DJSscP5NMfiz2
         Bvo9jJYD20wWzA8nCbCNka58E2VVUzcrYwe947K2xSATyRGjB5us06VtOCDV71mQqxEJ
         EGsLAWNkipMNyHkzYAzAoLaQ4SOeODXtpO7wdHrL6YxItFXG8Pfzh3TiAD7lUogLquRz
         L3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611441; x=1692203441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+6phzlyk9W/amav360WyGK5I/Ac9LQEydcq2azpQFI=;
        b=gbUrmDnTMP6XhXTnuyZ9bXHeu1UG4VO7J2V5yd4/SQqHaHUC9Ik/pXoMpoVazmknC3
         CG4hlQ7bCIR3cHUc+hXr6vhSdQHxCiV7h7pDkt2qZ9PuQmzhaLu55t+wEAgKJSd1ax9B
         v6kvEVrdw2SODDcapAA8aQ0J4l9GBP08vWNq68NwUxxClcLrykBwJWFlxdlAyVJJd5PC
         jIKd/WGYhgOIHYAs7i8FPDBMEEhmbxRIyCz7RonyrydG98wbpAT7n9lhBNs1VQ73UlBJ
         ZVFM4CCvGiu27Lvk7QP1czWLOZToDPxAlULbM+D0wb9a5gqMPI+LIdamfrpDHMSQCoji
         vUyQ==
X-Gm-Message-State: ABy/qLavn9WeFzOikHUAQdFqg7AzZVXyGKLMsHYVo9z1rvZaPFSIk35m
        YpNHxo8YneBwburDeLvfuLti/tQR18M=
X-Google-Smtp-Source: APBJJlHsgfVzUjL9ixP6IfKHeTwfiFE474jrClzdwHp8d66lPqkAEUCNtrUPIXrQlKV8Atb3ZUTApg==
X-Received: by 2002:a17:906:5195:b0:973:daa0:2f6 with SMTP id y21-20020a170906519500b00973daa002f6mr11311825ejk.3.1689611441333;
        Mon, 17 Jul 2023 09:30:41 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qw5-20020a170906fca500b00992ed412c74sm9326908ejb.88.2023.07.17.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:30:41 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Yi-Wei Wang <yiweiw@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH] =?UTF-8?q?arm64:=20tegra:=20Add=2035=C2=B0C=20trip=20poin?= =?UTF-8?q?t=20for=20Jetson=20Orin=20NX/Nano?=
Date:   Mon, 17 Jul 2023 18:30:37 +0200
Message-ID: <20230717163037.1033429-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

It turns out that these devices can get quite hot to the touch with the
standard cooling configuration, so add another trip point at 35°C along
with a cooling map to help keep the system reasonably cool at very low
system load.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi            | 8 +++++++-
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts    | 7 ++++++-
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts    | 7 ++++++-
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index a8aa6e7d8fbc..5f592f1d81e2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -106,12 +106,18 @@ tj-thermal {
 
 			trips {
 				tj_trip_active0: active-0 {
-					temperature = <74000>;
+					temperature = <35000>;
 					hysteresis = <4000>;
 					type = "active";
 				};
 
 				tj_trip_active1: active-1 {
+					temperature = <74000>;
+					hysteresis = <4000>;
+					type = "active";
+				};
+
+				tj_trip_active2: active-2 {
 					temperature = <95000>;
 					hysteresis = <4000>;
 					type = "active";
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 2de2f8ac640d..072e45ce2631 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -205,7 +205,7 @@ key-suspend {
 	};
 
 	pwm-fan {
-		cooling-levels = <0 187 255>;
+		cooling-levels = <0 88 187 255>;
 	};
 
 	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
@@ -233,6 +233,11 @@ map-active-1 {
 					cooling-device = <&fan 1 2>;
 					trip = <&tj_trip_active1>;
 				};
+
+				map-active-2 {
+					cooling-device = <&fan 2 3>;
+					trip = <&tj_trip_active2>;
+				};
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
index 9b86aa6f7dbe..9e9bb9ca8be4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dts
@@ -12,7 +12,7 @@ / {
 	model = "NVIDIA Jetson Orin Nano Developer Kit";
 
 	pwm-fan {
-		cooling-levels = <0 187 255>;
+		cooling-levels = <0 88 187 255>;
 	};
 
 	thermal-zones {
@@ -27,6 +27,11 @@ map-active-1 {
 					cooling-device = <&fan 1 2>;
 					trip = <&tj_trip_active1>;
 				};
+
+				map-active-2 {
+					cooling-device = <&fan 2 3>;
+					trip = <&tj_trip_active2>;
+				};
 			};
 		};
 	};
-- 
2.41.0

