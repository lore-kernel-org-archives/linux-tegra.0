Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A203FC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242942AbhLIR2v (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242969AbhLIR2s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:48 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C40C061A72
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:09 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p18so4778496wmq.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=njc6iBCIIcJEfBBmmi88h1svGLtR5R9x889jLiMbnc4=;
        b=WAGsYADCPH1KHkzvwQI6PBwxpAwVi0sg9KYjGD9Mnjohc0nCcNbaihIhSH2PFnhp1U
         Pb+SejMJK7q3MB8zY+Jn3a1QoL9rqSp/APDKAbr805KlD45UAxDs2Ub8EfMs+lTJ8VkS
         YmYc+xghWinFcbaH2TodCCpYcAEBoqys9zW5ScU/TmkJkPe1THBXtlzfwy9Aq+vE68Z2
         8dp+SUGEBLulz/vVYmYF5apr9Ow4FRCXnuKF87KYSuBeDVjXAwqnAKewmtV9W3AkkRXQ
         nX6YJWEWlv/GsqmVpEUgZQWMMI5K7Zr8qliQPlHL47gQDSce/NDHuaZyNnA0qDGDdUFr
         xkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=njc6iBCIIcJEfBBmmi88h1svGLtR5R9x889jLiMbnc4=;
        b=uWmSTDnMoC2W3Cgz3N/vKNrFGJ5jhEUr4DYiOhx7A5DGlkIJnCWfaP2hKAz0rNIIrz
         TiA6ki9e6HIOEckjFgUb1Vx0x3DYeh59uPf8tmpvDZmromf82cThng5bxC5N4Bogb5p9
         TiHyZO8i9LGt4NosL7gVuuzvOH9gfjZsUy57TWi3KydeZ72A7ONGXNZ6Rae8Sa75ecNN
         r7ysUQN6Le2PFlX6eVLRetmke7y6996ko2V3cirubdnFft/J84Ks3RhPRx33CdYRJpwL
         r5P6KxvHKqeBX12+dM5/np/2mt5LQBNSyomaXwE9y1V6dMeTxGum73QSu7PmnrpTzsgr
         JVCA==
X-Gm-Message-State: AOAM530Ljk50ZpY39ynHSpQktYKERd1giUK/NpAYZ505iu5ueIo8cs4H
        uTid1sY5Ip43F7mS/qFGyoRcL976I6VsMQ==
X-Google-Smtp-Source: ABdhPJyThK80AEu7SSCweDHmSi7AqXmLZm2c2cU6txy2arIRq+0RXb5lqHb29NlXmd/X54gddAzB1A==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr9151132wmf.192.1639070708365;
        Thu, 09 Dec 2021 09:25:08 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l26sm439210wms.15.2021.12.09.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 01/30] arm64: tegra: Rename top-level clocks
Date:   Thu,  9 Dec 2021 18:24:34 +0100
Message-Id: <20211209172503.617716-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Clocks defined at the top level in device tree are no longer part of a
simple bus and therefore don't have a reg property. Nodes without a reg
property shouldn't have a unit-address either, so drop the unit address
from the node names. To ensure nodes aren't duplicated (in which case
they would end up merged in the final DTB), append the name of the clock
to the node name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 8a51751526ee..ecd58bd2770f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -1023,7 +1023,7 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 6077d572d828..d3e622c4a439 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -301,7 +301,7 @@ mmc@700b0600 {
 		vqmmc-supply = <&vdd_1v8>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index 58aa0518965e..0a70daeffd85 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -40,7 +40,7 @@ mmc@700b0600 {
 		non-removable;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 41beab626d95..ed73c3a0c140 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1586,7 +1586,7 @@ mmc@700b0600 {
 		status = "okay";
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 030f264eccd5..cbd8cda48f37 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -1645,7 +1645,7 @@ flash@0 {
 		};
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 131c064d6991..43ff5e4bda19 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1726,7 +1726,7 @@ interrupt-controller@702f9000 {
 		};
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
-- 
2.34.1

