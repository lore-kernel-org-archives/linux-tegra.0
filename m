Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F1AC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243077AbhLIRhw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbhLIRhw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:52 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B57C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:18 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id o13so10923981wrs.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y17Q1MwjIxSwAZ/k/R5pZfeRbVMQiZdNdGzVwqoAfh0=;
        b=GCM+D1uhPH069La/a4cjV3CyLMHOIVVR2jWxBmfgCFCPkscsH+XIPkeGNo/0YY+gct
         MNZeqDfQ92m3JXTaRZFBk7fZt/M3SYRP5CEpXG5Q/V3T3mFIdh90abGo0xTuIXuXYDab
         gsHBOdwTO89LAkgwgxlC9xpFg6F93ZaAdLXwys0HzDxB+bXhONI01RLdGy2G+XzKpwQW
         o6CEWCbts54hKEw+01L0hvu9FYq7+Wtz3ysfXeDlvdl8lFuqvWFtWUx1iw76aSgiCEgL
         VgCCoRaQMWBOWDO67lHt6QX0QMB1FisG6EQKFwqhnsU7fuH+IBtFIB0zIBsMCGbhh5Mw
         l2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y17Q1MwjIxSwAZ/k/R5pZfeRbVMQiZdNdGzVwqoAfh0=;
        b=Phs16juWfsCLhnp7nu3GahHmMxRozdDJUFwM38W8CT/DovujaB5xipi+WA6vWe0DIf
         17n18aqxb/vzUAL8+N2cEHYOYa2+LR+zeEniE0rrg2jlJm7nIdFPo1qstmPPAJDJXsGo
         v7wHX12CQdCT3EZHm9XnpDmMH/F+hvcDlTLJuwmWUDyBZ5a9oATEMaUB8L0nCDkSZTj9
         xJRs1Ols2LKgL+tLmWw4hr2UeaWYL/JOiSgsPjswxDsnAcxwK10w8ssa37I3jKq8Pv9O
         66/gAZwAGa+4u11UmWtOB6Cdl8E7j3h/nXTpta67f63au0qAGtpD0zjsz+xY8fMR1Fr3
         USfA==
X-Gm-Message-State: AOAM532ljkCR7CQ7/HxbYJZXY+XqhUNff6/tuzinUjls6SV7y/NAQbL+
        +G6CJ5ghN8w+zX9UO6/S/HwdTSNRJeJ0cw==
X-Google-Smtp-Source: ABdhPJxlQ9qfNnbsG1foBpURtEnBrSUHv82zK1O2ntkUDj5aVjqGZS/4bCyOePd4uI6ldxhc0PxQZw==
X-Received: by 2002:adf:f088:: with SMTP id n8mr7745157wro.411.1639071257186;
        Thu, 09 Dec 2021 09:34:17 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w22sm397860wmi.27.2021.12.09.09.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:16 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 06/25] ARM: tegra: Fix compatible string for Tegra30+ timer
Date:   Thu,  9 Dec 2021 18:33:37 +0100
Message-Id: <20211209173356.618460-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The TKE (time-keeping engine) found on Tegra30 and later is not
backwards compatible with the version found on Tegra20, so update the
compatible string list accordingly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 +-
 arch/arm/boot/dts/tegra124.dtsi | 2 +-
 arch/arm/boot/dts/tegra30.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 546272e396b4..328425dba023 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -164,7 +164,7 @@ lic: interrupt-controller@60004000 {
 	};
 
 	timer@60005000 {
-		compatible = "nvidia,tegra114-timer", "nvidia,tegra30-timer", "nvidia,tegra20-timer";
+		compatible = "nvidia,tegra114-timer", "nvidia,tegra30-timer";
 		reg = <0x60005000 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 63a64171b422..f4ac0c327c2e 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -259,7 +259,7 @@ lic: interrupt-controller@60004000 {
 	};
 
 	timer@60005000 {
-		compatible = "nvidia,tegra124-timer", "nvidia,tegra30-timer", "nvidia,tegra20-timer";
+		compatible = "nvidia,tegra124-timer", "nvidia,tegra30-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index ae3df73c20a7..4c04b9c28484 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -342,7 +342,7 @@ lic: interrupt-controller@60004000 {
 	};
 
 	timer@60005000 {
-		compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
+		compatible = "nvidia,tegra30-timer";
 		reg = <0x60005000 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1

