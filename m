Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335B5C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhLIRiN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRiN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:13 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278F8C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:39 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d24so11098204wra.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=krbyAktj7SyFwQPSlYLai67LwLG2H2lkARH3cT60d6w=;
        b=of4pxsuLstcHBuSnhiYCQ3WIavEY952nYATcZLqzE25r1bPb6XS7Qjv8iveb3lBzBp
         ulkcYiW69WT7eSVinLyDd0w6fg+PyjyWOkTPOH8szkoEOE0zZZ8q6aS8ulcwxQJV5hYV
         knXrDsYYnhf3mqiHN3ILcauiK8S42tRVczsekLLpkMG0IgDVjn2XTgyaegDTZhFjVcv5
         p4tsboh0tenLshcbk27mXyPpSArron7rsbPfGbjm9dVKfAPwYKp0nxxXL0a64OARU4rr
         re/Fn0S6s4VbpaLeQ6VyP92MB3gK6RvvbCOgp78zp8++KmQpL0PrCQ0dw5rQEtV9pije
         nZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=krbyAktj7SyFwQPSlYLai67LwLG2H2lkARH3cT60d6w=;
        b=h6VXOIepo0uMs09kSGAUq2LJQq/d+1MzEpfFBrEUQglfwxwVVzSE1QsLPPZeffHrGg
         mF6EeQkDQ97w45EqYuOWgjbuOWqHbJOnnmGN0xVVrM4AksI67kpgao5nplRXFb0YRMp2
         030KT+AY+EF7kUgBgS7JYAgi67P6Ut0IKTu26hVJsKO+mmlT2m8+l4u89Y+FLoCQhF9i
         viHRQnFbD4zDlVH2ycCR82pcA/yomYtvSd73tilvsXaW7HyvlDLbzD+8NAdg0tYYVHlf
         w+bES8FkeqmKa4tvdQ5d3xCo83wXk5QSpuhsq6J2a/K5gAh0vOprnCea6KviVtvskHZt
         FcTQ==
X-Gm-Message-State: AOAM531Z/m/6r/SCJsPYILoXbnEpvjcYLHPxxp3rKFbG9MfmxUAynysX
        Z0hMBTnwtD2a7V0YqSyxLgM=
X-Google-Smtp-Source: ABdhPJwytTIpNkWpCEUyPlp7u8la9u/3mxtmbdcBBz2zAZqVWQU3UOr10DYMbwfiYOjGuGAKophnaA==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr8113257wrm.269.1639071277695;
        Thu, 09 Dec 2021 09:34:37 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id bg12sm519365wmb.5.2021.12.09.09.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:36 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 14/25] ARM: tegra: Drop unused AHCI clocks on Tegra124
Date:   Thu,  9 Dec 2021 18:33:45 +0100
Message-Id: <20211209173356.618460-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The CML1 and PLL_E clocks are never explicitly used by the AHCI
controller found on Tegra124, so drop them from the corresponding device
tree node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 0e0a769fb30f..36566a777e49 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -672,10 +672,8 @@ sata@70020000 {
 		      <0x0 0x70020000 0x0 0x7000>; /* SATA */
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SATA>,
-			 <&tegra_car TEGRA124_CLK_SATA_OOB>,
-			 <&tegra_car TEGRA124_CLK_CML1>,
-			 <&tegra_car TEGRA124_CLK_PLL_E>;
-		clock-names = "sata", "sata-oob", "cml1", "pll_e";
+			 <&tegra_car TEGRA124_CLK_SATA_OOB>;
+		clock-names = "sata", "sata-oob";
 		resets = <&tegra_car 124>,
 			 <&tegra_car 129>,
 			 <&tegra_car 123>;
-- 
2.34.1

