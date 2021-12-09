Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA6EC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242852AbhLIR3M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbhLIR3K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:10 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21094C061353
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:37 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id c4so10908449wrd.9
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjVbF73Laz/jD7z4kFZ5sxr8u+wTExAo6yrVP8PBWKw=;
        b=ZItBa/3IiXTgR0Rvcq9jAXhrS7v6D1CKY08mWOrJEi1VqXPzx/NkK92EPXRwLltuhE
         7DBRtEmvD1kSdupPGTHqnHC3ZfnEp0Dh8dtinfvk8AOPSMGSaoE8OhwFljJY/t+S/uHe
         dBdPUljjLE5lXqNBtql6vO6jDlfZqFxkaCsftlo8+CCGNQVEbItFd9geVGAauftyvNI8
         H2P9wxpK6AMHUvdmicSf3aiSfOmccerNrFDyYbf3HXbHZnPsVESqDFSJ1r0a8qhNIvD/
         TDkZ57xq9iv9P8iLOejq3x6zpQD52udKFbgDLIPW65fR/rGog/c1l4kcL4fG8wEzFRgT
         T+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjVbF73Laz/jD7z4kFZ5sxr8u+wTExAo6yrVP8PBWKw=;
        b=QCx70nPcRN0YxrUAc038hSsOFNuCbYjxKkvosTb1Y4umuY2dPlZ9erzTCnL5CufkbT
         JDTpeUZ9c/Fgdr2eV1fBDEEU0cqJCq2e6gMmDad/MyrwEPoo9FlpIqPfYL2H8qvA2Cl+
         3fdPJUiH9ytmPVZt03NIsdh1OIic8EJARal49L/C1G+4Z7KuTX6xGkJANPzHk8FeC/d9
         2u8K8akkxFsg04HfXvEpMUgOQf8RIuAxCukeBgzBkE7W909zFIXwfbbs8GvPfA09PcOi
         EAJGCSVODVlosfwxx9DeTQj/pYjU6nUJFAxJa1jk/UJJqYHW6/U+6d7jyDsMDdzPhpqr
         BQFw==
X-Gm-Message-State: AOAM530M8Rmjmpe0azLjrj3uh7pVpxAbUMKM8Zm49ka78tkVltXZg52L
        GKuGYCrtgPO99s9Z7Sl0nzr6KmDhuxyIWQ==
X-Google-Smtp-Source: ABdhPJzYKZnFfPCQm6FKHDa2jaKXNrQgGLjqVuKnyNfSFBbglz9bnCnMyIrCBgPvRW7zqJPEZr3atw==
X-Received: by 2002:adf:e747:: with SMTP id c7mr8067043wrn.38.1639070735694;
        Thu, 09 Dec 2021 09:25:35 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g18sm290187wrv.42.2021.12.09.09.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:35 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 12/30] arm64: tegra: Rename power-monitor input nodes
Date:   Thu,  9 Dec 2021 18:24:45 +0100
Message-Id: <20211209172503.617716-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Child nodes of the TI INA3221 power monitor device tree node should be
called input@* according to the DT schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts   | 12 ++++++------
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi       | 12 ++++++------
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 2883049c4edf..c4dee05f330c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -1945,19 +1945,19 @@ power-monitor@42 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			channel@0 {
+			input@0 {
 				reg = <0x0>;
 				label = "VDD_MUX";
 				shunt-resistor-micro-ohms = <20000>;
 			};
 
-			channel@1 {
+			input@1 {
 				reg = <0x1>;
 				label = "VDD_5V0_IO_SYS";
 				shunt-resistor-micro-ohms = <5000>;
 			};
 
-			channel@2 {
+			input@2 {
 				reg = <0x2>;
 				label = "VDD_3V3_SYS";
 				shunt-resistor-micro-ohms = <10000>;
@@ -1970,19 +1970,19 @@ power-monitor@43 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			channel@0 {
+			input@0 {
 				reg = <0x0>;
 				label = "VDD_3V3_IO_SLP";
 				shunt-resistor-micro-ohms = <10000>;
 			};
 
-			channel@1 {
+			input@1 {
 				reg = <0x1>;
 				label = "VDD_1V8_IO";
 				shunt-resistor-micro-ohms = <10000>;
 			};
 
-			channel@2 {
+			input@2 {
 				reg = <0x2>;
 				label = "VDD_M2_IN";
 				shunt-resistor-micro-ohms = <10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 4917b43995b0..3d8878c0ec03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -73,19 +73,19 @@ power-monitor@40 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			channel@0 {
+			input@0 {
 				reg = <0x0>;
 				label = "VDD_SYS_GPU";
 				shunt-resistor-micro-ohms = <10000>;
 			};
 
-			channel@1 {
+			input@1 {
 				reg = <0x1>;
 				label = "VDD_SYS_SOC";
 				shunt-resistor-micro-ohms = <10000>;
 			};
 
-			channel@2 {
+			input@2 {
 				reg = <0x2>;
 				label = "VDD_3V8_WIFI";
 				shunt-resistor-micro-ohms = <10000>;
@@ -98,19 +98,19 @@ power-monitor@41 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			channel@0 {
+			input@0 {
 				reg = <0x0>;
 				label = "VDD_IN";
 				shunt-resistor-micro-ohms = <5000>;
 			};
 
-			channel@1 {
+			input@1 {
 				reg = <0x1>;
 				label = "VDD_SYS_CPU";
 				shunt-resistor-micro-ohms = <10000>;
 			};
 
-			channel@2 {
+			input@2 {
 				reg = <0x2>;
 				label = "VDD_5V0_DDR";
 				shunt-resistor-micro-ohms = <10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 33e707ef883b..6cc51083adb7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -81,22 +81,22 @@ power-monitor@40 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			channel@0 {
+			input@0 {
 				reg = <0>;
 				label = "VDD_IN";
 				shunt-resistor-micro-ohms = <5>;
 			};
 
-			channel@1 {
+			input@1 {
 				reg = <1>;
 				label = "VDD_CPU_GPU";
 				shunt-resistor-micro-ohms = <5>;
 			};
 
-			channel@2 {
+			input@2 {
 				reg = <2>;
 				label = "VDD_SOC";
-				shunt-resistor-micro-ohms = <>;
+				shunt-resistor-micro-ohms = <5>;
 			};
 		};
 	};
-- 
2.34.1

