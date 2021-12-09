Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B29C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242916AbhLIR3w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242909AbhLIR3w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:52 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8DBC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:18 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m25-20020a7bcb99000000b0033aa12cdd33so5669080wmi.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDLIj84vPIUnNZTjAH0DOp2B4tU0LFC4Wkl4B2dIBao=;
        b=lr6+oavRVDPhRo9de65JL5RUT3XodPJoQLQq4PcHp2NmV2NkEi6U928h1Efq064XIH
         X/HRfs0aFKebXd84bmP4yhxUHE3RZ/Ww3fVqZMoZoT9Yo48YL3GVOHNQGl8bOQ5WFNGn
         oQDZJYXyoAGOAJXDZ3OPXVtENLO4j9aYRzdrgbucqVTJ9lJxke8vHOrG8jXrMdS2w2B3
         WxJ4o62AoMa8yK/vmXtIGSlv5Kt4PgQeLBV2Qo/CE9QjuxMT/DamZxcI9SEGYIvG3+6D
         r4LtbQcx1gB0XC2IX3HdHDhljeaAs0l4ObaWvPd+QCJ0Pka1TSzFxeo7/DeAV9DmmWkp
         1lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDLIj84vPIUnNZTjAH0DOp2B4tU0LFC4Wkl4B2dIBao=;
        b=v8T1QmkfvC40DxBW4lqmVLq9B/Lp6CvNo1xN+CU64uFk6wOu6JKq/712NNXRdCQwAa
         khB4c6xq3K8FDnkPXPRmCpagsiXfocXbN0CcsR8AsJ7eRA8pNPpKOadek4FccAvK/mMC
         shhNxD3piqpPVdrHydyabQ8IlWFXgPbSORqyufh8G5aIYUiet3Cnb1vh7GxselHgFx1Q
         C3CFFmqzsSYzk3CKyCsP5YBYFgOOemD/48GITj+Kya/ZheJ3d0FB/suKPr+pbTAA5vqB
         L9y9OC1wWIZJUK/VGheJIWRoqYuBx0DcFEkBTtI/Z5sXXRS/rVEQyTfhvgyc97IavDK9
         d7MQ==
X-Gm-Message-State: AOAM532OOsJgbWltjgigTu2eB4n1G1QOsuaXjGzl9ISKdrPst7Xjs14Q
        zYguQq6n36/d6HnxvD1f5YISgv3xgUrHvw==
X-Google-Smtp-Source: ABdhPJyHeWdxaHn0C2MPdSC7KO+U2oMpLL8kHeipPQTqnTCOQY0voQ8Y0+rKtRDqcjshPfY+UEls9w==
X-Received: by 2002:a1c:5414:: with SMTP id i20mr9247507wmb.88.1639070777441;
        Thu, 09 Dec 2021 09:26:17 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o4sm414167wry.80.2021.12.09.09.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:16 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 27/30] arm64: tegra: Add missing TSEC properties on Tegra210
Date:   Thu,  9 Dec 2021 18:25:00 +0100
Message-Id: <20211209172503.617716-28-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add missing interrupts, clocks, clock-names, reset and reset-names
properties for the TSEC blocks found on Tegra210.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index af9237ad03c1..a49a12fd84b1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -181,6 +181,12 @@ csi@838 {
 		tsec@54100000 {
 			compatible = "nvidia,tegra210-tsec";
 			reg = <0x0 0x54100000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA210_CLK_TSEC>;
+			clock-names = "tsec";
+			resets = <&tegra_car 83>;
+			reset-names = "tsec";
+			status = "disabled";
 		};
 
 		dc@54200000 {
@@ -283,6 +289,11 @@ nvenc@544c0000 {
 		tsec@54500000 {
 			compatible = "nvidia,tegra210-tsec";
 			reg = <0x0 0x54500000 0x0 0x00040000>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA210_CLK_TSECB>;
+			clock-names = "tsec";
+			resets = <&tegra_car 206>;
+			reset-names = "tsec";
 			status = "disabled";
 		};
 
-- 
2.34.1

