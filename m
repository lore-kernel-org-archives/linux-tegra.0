Return-Path: <SRS0=F6W0=CD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B1AC433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Aug 2020 14:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBF712072D
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Aug 2020 14:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilLeVCiL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgHYObF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Aug 2020 10:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgHYObF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Aug 2020 10:31:05 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1592DC061574
        for <linux-tegra@vger.kernel.org>; Tue, 25 Aug 2020 07:31:04 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id k25so11393628edj.13
        for <linux-tegra@vger.kernel.org>; Tue, 25 Aug 2020 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Djp14USfvpYT1zsr5IEolXY6Uvk4OEQv1Milhu2LcVk=;
        b=ilLeVCiLFNfbmGIGhiypWMNJXz09yR8OBU6eNHcp1rksRUcRk4ipzHJdQBUUmrrkJl
         NKX4YZR70Qy0w1T5Z4QrwvJLD2I4lpyU4IsSkdnC1NRng19TEGj967JacI3szKSZZz/p
         0zz4fde2NHV2xKaPaBbDO+BmTTi0gR338P3prp5XI7gnD9lUcuqWcCyhI303BF/ZUdrB
         s31mfkeahJ6b/+80JHNBPrT0FRXvvTdsq9reFOBQIdDgOIqHodEX5y0ZC8VfVAefS645
         VPZdx4MZMDUlK90bd3fLTVM5Zv1G5fketjLTjZPAuQU7dOzb+QYQfk+Jwm99LBT7b0gK
         JQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Djp14USfvpYT1zsr5IEolXY6Uvk4OEQv1Milhu2LcVk=;
        b=J+GFS5gv18p3aPNd7bs67pZUuaTHW1vdU5tUL45c3Egl9XP9X/SrDJXIDdYJvH7Wh0
         HXfhZcRLIvLteLGNMjehRLkqyROUCyjPElGocPEdnvCjGUw43kwQefIRH6eB9oPpmVty
         tjQk5wl2mcbLpTiQD00eXvRFltVpQAn/o8gKyXOVRD7kOgB/0ZJELTehmAmsTAX8iQb6
         K3XzxWuo+7+EY/mFIscGwSYMgoD9xvaTRD92pQkfGu5g7i5U3FFHBaSUz76Zh/x4rEXR
         CgEccUkSkCr2ZsZiHG/kD5FLaQBpN1x8zpfBxLb+JfZ7cv5yJyQ5tH46Bth1O4wz8LyI
         j9Yg==
X-Gm-Message-State: AOAM531IMHnm6dbg8nlzoiNIFeRlk6Ur/xMkH1KCoGN5l9vRDQZJExZ4
        /9bL5vMGhSL8qpPKoMUlq6I=
X-Google-Smtp-Source: ABdhPJzy59OuIlJlrK2KF60RjoXW3776KvTjB+eF3yr0H/Ntgiiyn2Laweercgv14Q+Qilt2lVvE2A==
X-Received: by 2002:a50:bac2:: with SMTP id x60mr10780366ede.210.1598365862696;
        Tue, 25 Aug 2020 07:31:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d2sm13924247ejm.19.2020.08.25.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 07:31:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Use the correct names for DPAUX pinctrl states
Date:   Tue, 25 Aug 2020 16:30:57 +0200
Message-Id: <20200825143057.1358321-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The default and idle states need to be called "default" and "idle",
respectively, for the driver core to select them at the right time.

Fixes: fff67b5c73c1 ("arm64: tegra: Wire up pinctrl states for all DPAUX controllers")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 94c65ca8345a..dc6ae42b3027 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -348,7 +348,7 @@ dp_aux_ch1_i2c: i2c@3190000 {
 			reset-names = "i2c";
 			pinctrl-0 = <&state_dpaux1_i2c>;
 			pinctrl-1 = <&state_dpaux1_off>;
-			pinctrl-names = "i2c", "off";
+			pinctrl-names = "default", "idle";
 			status = "disabled";
 		};
 
@@ -365,7 +365,7 @@ dp_aux_ch0_i2c: i2c@31b0000 {
 			reset-names = "i2c";
 			pinctrl-0 = <&state_dpaux0_i2c>;
 			pinctrl-1 = <&state_dpaux0_off>;
-			pinctrl-names = "i2c", "off";
+			pinctrl-names = "default", "idle";
 			status = "disabled";
 		};
 
@@ -382,7 +382,7 @@ dp_aux_ch2_i2c: i2c@31c0000 {
 			reset-names = "i2c";
 			pinctrl-0 = <&state_dpaux2_i2c>;
 			pinctrl-1 = <&state_dpaux2_off>;
-			pinctrl-names = "i2c", "off";
+			pinctrl-names = "default", "idle";
 			status = "disabled";
 		};
 
@@ -399,7 +399,7 @@ dp_aux_ch3_i2c: i2c@31e0000 {
 			reset-names = "i2c";
 			pinctrl-0 = <&state_dpaux3_i2c>;
 			pinctrl-1 = <&state_dpaux3_off>;
-			pinctrl-names = "i2c", "off";
+			pinctrl-names = "default", "idle";
 			status = "disabled";
 		};
 
-- 
2.28.0

