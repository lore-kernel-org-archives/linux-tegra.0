Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C10C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242829AbhLIR2y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242945AbhLIR2v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:51 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C7EC0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:17 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso7109515wms.3
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2kUnaropDSfgAFAoPXYMrt/i70qqRLbXmDJJOmkmxTA=;
        b=UY7Q0hMmgf5ByDdHsaU5DbWdEwbifXL19W18Vo+g4rpsCUekAWmSjj3iplJmXFOxd/
         HT2cqkPmknqxxf4hIcO2puMhu8U+QtHMW7G8uDefAHQIdivvq2eV3cdEOhtsrHBJSeM7
         n+DHilYYSoPVcBnc9NBVYpuJxW2tTIN/D38NEZlJ7eMoh53czacPOv/kvd4ZcA0NkWv3
         eW45Kni1LIfFDNFkjBawgGiIizH0nkfgXlwZWSr94KfFVjMufWXUOjg+qSsGnyOss47D
         uszOp+aWCyKZ8POULWuB4h4qsOgEFxVJTG6WeHy/1chbycIk3jYF2Z0Hy9Dc1yjcdtUi
         C6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2kUnaropDSfgAFAoPXYMrt/i70qqRLbXmDJJOmkmxTA=;
        b=A02kbK2Ui6G+iQ/VCgvAtYzx61R9Kzy3SOHQd4zUCbfRYbIDc49NA1L53KlCQlbc5J
         iMrJN/KyXkJdjnbYTy7YekeDfd+AOgHW/AIRMxZaELl4vjw29B2P4SJQ/QBBeALlgABJ
         u6mrDMrhH4mRwTC9Jkyl0+Y4euiya99V3xKVbXGA0RE+gyET4dnYktBsOTwpyEbDsxdr
         wNMW8XIK94BIBJEOkp+rsphQNuowe6EA3OAb0dDSRElrJ/XVaChFMkqDuiPNXr/x1u5o
         Fb37XNRjN42o3Aq0sXOTbZItaR+szlCSZVRuePKwTukVT1tS4QOlvlX/Sd4KEN4lnfPW
         ympA==
X-Gm-Message-State: AOAM530MJXwquCk527Xh2/yJxSc/O0GKnr/ZhlzVGoyxj3y68Xirj1G+
        ehBCzS7wLW8z6iNnfZ3QGSE=
X-Google-Smtp-Source: ABdhPJy/W80L/RhPWYKUOB0onQNZyiimNKQZBS9Xi2uAYeF0w7iU+b7mYS9AyXrhyMM4VHqoYXJkQA==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr8991170wmc.58.1639070716101;
        Thu, 09 Dec 2021 09:25:16 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id z6sm275953wrm.93.2021.12.09.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:15 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 04/30] arm64: tegra: Fix unit-addresses on Norrin
Date:   Thu,  9 Dec 2021 18:24:37 +0100
Message-Id: <20211209172503.617716-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The AS3722 pinmux device tree node doesn't have a "reg" property and
therefore must not have a unit-address, so drop it.

While at it, add missing unit-addresses for the charger and smart
battery IC's on the ChromeOS embedded controller's I2C tunnel bus.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index c84ed1cb9a8c..f9604968c01f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -564,7 +564,7 @@ as3722: pmic@40 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&as3722_default>;
 
-			as3722_default: pinmux@0 {
+			as3722_default: pinmux {
 				gpio0 {
 					pins = "gpio0";
 					function = "gpio";
@@ -770,7 +770,7 @@ i2c_20: i2c-tunnel {
 
 				google,remote-bus = <0>;
 
-				charger: bq24735 {
+				charger: bq24735@9 {
 					compatible = "ti,bq24735";
 					reg = <0x9>;
 					interrupt-parent = <&gpio>;
@@ -781,7 +781,7 @@ TEGRA_GPIO(J, 0)
 							GPIO_ACTIVE_HIGH>;
 				};
 
-				battery: smart-battery {
+				battery: smart-battery@b {
 					compatible = "sbs,sbs-battery";
 					reg = <0xb>;
 					sbs,i2c-retry-count = <2>;
-- 
2.34.1

