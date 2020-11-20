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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE68C2D0E4
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2219223BE
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 16:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYHejRMc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgKTQOD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 11:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728296AbgKTQOD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 11:14:03 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7EBC0613CF
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 08:14:03 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id x13so3209522wmj.1
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 08:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVLwWNTpbnmOxq+82O+H1wy9f1AD4n5oBw21UK9+VVg=;
        b=FYHejRMciOb7EpoG4Zr3zK3wlzmveDGTR8GHI1CigRzSo64kqxB9EIIBJCKWoVyJ7j
         G4C6diJf4FZ+ZIXTBrrdD1MKMXnzUr4gYMzgwWcYiSutd2CY/AIvyyKo6NA7p0gfEUR5
         kfaKDggldQe4iZEEVnqcUof+mpM/BOuMPYeX6KwmMTrLN+Xq1uQqG1dl3d8Ay2ShYvI0
         h5/VZR2eMO4mP0lPHhLsnjql+ABruF/WrJwuBEQ/VsNwykzd/zLgkzce327GIP6CwlhQ
         OiFDH8A3dBlz6iALdy8UR10klB3twhqqMFM06sRr2YwWWv0ZrwkxQvtYvpARluVTKNYI
         3FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVLwWNTpbnmOxq+82O+H1wy9f1AD4n5oBw21UK9+VVg=;
        b=O6ORqZwYnP59Tmxjl86M+0jZG+4VYMfuBblb8dM7096/Le4rNb+8Ru+nlx6ivFtkk5
         VrJ806CZjYX6xpCfEsk3MRTonPaGc3b+DL8wTrikL+ObO+mx3UQ1awzu95d4awF9VGbD
         r6flBeCmFV+TQJOEZCqVbRlLRtKdaocDxqBOaW5TMljLT5jNJcQHrwNUzVPJcSvkgcTZ
         WKJl8i3BfbE1rWlrrTHaITHWMoXxL/jB0fnWy9NPXvzfKYXMXbiFQkjj7N2GXu7PIvPA
         MqHRtmnbEPUW1CFb63idSL1/84gXNQEmycQg+JKWJsvNI9S5E3SSNUlPqlmFzU4fkWsY
         7SSg==
X-Gm-Message-State: AOAM530kuQP9gI+lRbdR7/g0Jlb6UTSlUrepgCd/RVpacWNz1+TjgTa7
        gRAHTV5yGGl3JBzQNWdcfCQ=
X-Google-Smtp-Source: ABdhPJx7yzxLtQdXl93zFaRy3M6egCgoplkjHTD/q43rsGvoMNAu1+8PHUXrj/2Fys+hUBy8TvLqQw==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr10743197wme.0.1605888841932;
        Fri, 20 Nov 2020 08:14:01 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id p4sm5702508wrm.51.2020.11.20.08.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:14:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] ARM: tegra: Hook up edp interrupt on Tegra124 SOCTHERM
Date:   Fri, 20 Nov 2020 17:13:55 +0100
Message-Id: <20201120161356.3880457-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For some reason this was never hooked up. Do it now so that over-current
interrupts can be logged.

Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 64f488ba1e72..d2714419d823 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -898,7 +898,9 @@ soctherm: thermal-sensor@700e2000 {
 		reg = <0x0 0x700e2000 0x0 0x600>, /* SOC_THERM reg_base */
 		      <0x0 0x60006000 0x0 0x400>; /* CAR reg_base */
 		reg-names = "soctherm-reg", "car-reg";
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "thermal", "edp";
 		clocks = <&tegra_car TEGRA124_CLK_TSENSOR>,
 			<&tegra_car TEGRA124_CLK_SOC_THERM>;
 		clock-names = "tsensor", "soctherm";
-- 
2.29.2

