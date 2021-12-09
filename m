Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8AEC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243084AbhLIRiC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243080AbhLIRiC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:02 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D53C0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:28 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d24so11097455wra.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nR81Vi5lI7w9Y1IvWxvBfKoT2kMxtXOkdyq2d0wN2vU=;
        b=aPr/DXOxIBZ8B+j05gzaMcpEFB6Nu3AK1RaKezzbf3IVI2V20lzaZjWJnuVwFhll1b
         K7KYAwa/bFTnxqU321uON+xxrwX0kHCXOTLvW3fPgjcYZDsAAtb1JgsRhSTJpEHlkPm4
         zpE5iVRXxS+1oqQZA8nOY+TItfnNbUaay5ITe/wWHlXtO99UJbxA2eJHPHIqhyC3R3LN
         Nleyhg4d5vmFdA/3D1DvfUzMem4jzrP45sZKWPJlRA9yyHA2osL1JedU2VMGKVBL40Tv
         kq0M8lR+gd4Gk/RnVmfZ8OX6V70nDeTi3CBUvHfjQ22HdTyHt9UZTELd7QJTwJ1p947h
         X7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nR81Vi5lI7w9Y1IvWxvBfKoT2kMxtXOkdyq2d0wN2vU=;
        b=3hcNd0lYZz+rQMk7jB3T8nBQ7QYLRcuzkHq4HVR2auP+LOBZ9pQghDZ8xSmTCdwfll
         skzuCilwVMOUflomBSd+yFgoOBZUzmJFRBeDBIQB4KReX15nV7sP3aIKHWu/kkXoK6J4
         3AzAb++UGA5AJ3VrV8/qqDmeVwxR2OFnAhg3EaDN1U3prylATOdzsfvX+U1rwNylY7Bo
         tI3o82b+cQzi46F0wn+HFRQHwWwjmKSt7h6Auwy1MzuMiPaTusZ30lNB8imThKKZ6xBl
         583ESKBEesLt0e9MIscucFBq8bkAi5DrP7dwv/Ap/wrF4voH1CEkojgW2VrmSFnj7Fde
         uvog==
X-Gm-Message-State: AOAM532eO8z6XUvpjZeC1y8SXEmPCOayoVTLv8/pa6GSP3kzWtHHEcN1
        3PkEWFL7eUgXI5OQI/msjDU=
X-Google-Smtp-Source: ABdhPJyht0yShlsjxxOeOQkWk5pEsaLjJ7RzyWLqmiIUHCrP07/lAUiYuZqnSxCJgeEeV7tro53ryw==
X-Received: by 2002:adf:e109:: with SMTP id t9mr7779486wrz.387.1639071267260;
        Thu, 09 Dec 2021 09:34:27 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 10sm436039wrb.75.2021.12.09.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:26 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 10/25] ARM: tegra: Drop reg-shift for Tegra HS UART
Date:   Thu,  9 Dec 2021 18:33:41 +0100
Message-Id: <20211209173356.618460-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When the Tegra High-Speed UART is used instead of the regular UART, the
reg-shift property is implied from the compatible string and should not
be explicitly listed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi               | 3 +++
 arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 ++
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 ++
 arch/arm/boot/dts/tegra30-colibri.dtsi                    | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index f00ef4d08fd4..b952b272afc0 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1539,14 +1539,17 @@ sdmmc3-clk-lb-out-pee4 { /* NC */
 
 	serial@70006040 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 	};
 
 	serial@70006200 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 	};
 
 	hdmi_ddc: i2c@7000c700 {
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index e056e737abdf..f76f4e13458a 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1389,6 +1389,7 @@ dsi_b {
 	 */
 	serial@70006000 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 		status = "okay";
 	};
 
@@ -1401,6 +1402,7 @@ serial@70006000 {
 	 */
 	serial@70006040 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 3fbb57d517c4..f3d14d8dd87f 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -804,11 +804,13 @@ drive_gma {
 
 	uartb: serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 		/* GPS BCM4751 */
 	};
 
 	uartc: serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 		status = "okay";
 
 		nvidia,adjust-baud-rates = <0 9600 100>,
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 03b930bce479..e89b4e5a238d 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -701,10 +701,12 @@ pv0 {
 
 	serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
+		/delete-property/ reg-shift;
 	};
 
 	hdmi_ddc: i2c@7000c700 {
-- 
2.34.1

