Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D04C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 10:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbhLGKQu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 05:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234871AbhLGKQt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 05:16:49 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89745C061574;
        Tue,  7 Dec 2021 02:13:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so1822581wms.3;
        Tue, 07 Dec 2021 02:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+JSq2Mn+ndF3BDUlZbvnwRro8FYuW+wTgLGEUsIFszc=;
        b=jx4vsmpJlRL074I/J2khBzcVl5m+1afbeYi72dwZPUupG98kokfO3XTPVgz59dtlJD
         bm5S6qKOKKRC+k4A87EI1ZosDPcW5RyPIzGZtUZ4VIa/QScE073YVf9+Uhe8UXsbeqJR
         horMcOhuBABYe+iv0r7KxL55c0teTAJSKiIvBhQpDJqm4DjTJddeHFqbsu/fiqn3/gvI
         zxCEYBojma1csyauLtOldMnJW6rAzVhTPxvOcF9eNw1XUl5sc2rW65s3TGjRO2OA2D/a
         4w8MD6kfU5BCIkn+2IAcO3E6vtENiJLx5LC7skswbMFiicrA4WYK8GlT+xmY8y8UvG8P
         Y4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+JSq2Mn+ndF3BDUlZbvnwRro8FYuW+wTgLGEUsIFszc=;
        b=RkogOFfGEe73pcLYYs53yQ+geXILIurAnN+ex8ZdyJBaViLgiBjoRWJx5+lOFsObR4
         NPTv/SN07pG/Ce9ihCkEF8Xg5vh2Ovq1FiuJ9uUsJ0evRUS2PHYyk4M0oZZYfzNrkf82
         fCTNQw1aiH+0x5k4VGubAYlDbmhQ1tqPHgq5RYiAXtPYpEArIFUgdKTU4B6cSLP5lWuL
         f2UZhwTIqk8r8yjHtKihQ/hPOX/59sU4cqhCS8VhUAZNnltiukNDR2z6FM926FeX5k92
         ifWI8dq141UrSqu/weqewYUWRpo2o1VSEVT3eLuSZ5f0jkyooVq6UzZ3Yw/tx/43SOlZ
         npqQ==
X-Gm-Message-State: AOAM532r2+8gAHyyZ8sMTsxy1LqxjAbpQieMiEPKFMVmB4bhEyR8Dlk5
        naHo+sC+78phJHhcwmOtepyDmzyWjQAJvw==
X-Google-Smtp-Source: ABdhPJyAyeeCGiwEblNflI2r7vGjggtsr/ghbekDzsgeWyZFdFBTBJDV9gQud36CcCPcWBG8wjQTNg==
X-Received: by 2002:a1c:f60a:: with SMTP id w10mr5794742wmc.53.1638871998138;
        Tue, 07 Dec 2021 02:13:18 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id y6sm2056345wma.37.2021.12.07.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 02:13:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] ARM: tegra: Drop reg-shift for Tegra HS UART
Date:   Tue,  7 Dec 2021 11:13:16 +0100
Message-Id: <20211207101316.381031-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
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
2.33.1

