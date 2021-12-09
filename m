Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839CBC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbhLIRhm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243080AbhLIRhm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:42 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A00C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:08 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so4689668wmc.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TRYX0MX6Wpoz4clCvnqMMkys1UkfE+UyT5Be/4aVqPA=;
        b=S7YIIgDwA1kv/1GfJisrb+ZryQ4TTxhB+v1Hsr4kXutvmzklVwWxbksSxSdZgQt68t
         Yp0Xd+/wIMZY5izQE7ZzU+tHbXAX6mfR85HANjus8d3rIEE1CC301JgEkMraadIBk9C2
         nwg1iS4cEVf9JE8RuaFZamuj6koj71Xenl7HzpKv/3JNP+a1ZyjoNzOlluEfl4HmxQWc
         Q1qRiFvX+aTVKJaDaB3jsF2q3/QoFpdBZ45NRTT47L01GFl+FLaZKTkStQeJII18V9Rc
         BIXU6QOdLGWVGY2zZ48Q9DrYhzvBZUEolXPebgNsfxRuuBLr5A+3iu7zeBTx6ddb+fKc
         d5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TRYX0MX6Wpoz4clCvnqMMkys1UkfE+UyT5Be/4aVqPA=;
        b=TCt2Roh7iPLFDqZwNYWWm0T7ybjjMRzfPbvL44wFgAuCyGZcN/xAQbyyQVWcCCqT9U
         fX+YJGccCOjgIx8XRJf2Cv9m7iBdLovuMW3+scmi2Zl3kLyG+BQRSDToDNM6aBtImp6I
         uTCEzDtusGV8dGNoXfzhsK5H09Oao7qZHO66xAOP3ldChePm3zKp37QLhHRDs5EOTtZZ
         hWHrg9AarK72Ja4aDPi55QTqCXyVWcgyQsXyxccqAuBWlwTezG64ILIG2vBK4w3Jmvdf
         wlhSITMIZLyI2Co3GD5uKgUJefV8qflfh6T6yuKymWQoGTz9Y8gJMge3eaSgqadikI5g
         ePCQ==
X-Gm-Message-State: AOAM532isOmFXNjYGDhNcQexFmSK9KZb2KCgGNRZ4WbSoBFC4HT4h/fu
        j/yLR2AFPDZ8DrjvENTm61E=
X-Google-Smtp-Source: ABdhPJy7fA2if/RXFypCRoRqOhmwBoFRlFiVj+aAOi6msnX93ttsgNNO49OEKe8HL60Lo5s76yOyeg==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr9131682wmi.61.1639071246842;
        Thu, 09 Dec 2021 09:34:06 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id t17sm10119196wmq.15.2021.12.09.09.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:05 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 02/25] ARM: tegra: Specify correct PMIC compatible on Tegra114 boards
Date:   Thu,  9 Dec 2021 18:33:33 +0100
Message-Id: <20211209173356.618460-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PMIC found on Dalmore, TN7 and Roth is a TPS65913, so add the
specific compatible string in addition to the generic Palmas series
compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts | 2 +-
 arch/arm/boot/dts/tegra114-roth.dts    | 2 +-
 arch/arm/boot/dts/tegra114-tn7.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 7fd901f8d39a..82caefe5928c 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -894,7 +894,7 @@ ldo2 {
 		};
 
 		palmas: tps65913@58 {
-			compatible = "ti,palmas";
+			compatible = "ti,tps65913", "ti,palmas";
 			reg = <0x58>;
 			interrupts = <0 86 IRQ_TYPE_LEVEL_HIGH>;
 
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 07960171fabe..71a2806c0f59 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -801,7 +801,7 @@ regulator@43 {
 		};
 
 		palmas: pmic@58 {
-			compatible = "ti,palmas";
+			compatible = "ti,tps65913", "ti,palmas";
 			reg = <0x58>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 745d234b105b..753130b1e37b 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -62,7 +62,7 @@ i2c@7000d000 {
 		clock-frequency = <400000>;
 
 		palmas: pmic@58 {
-			compatible = "ti,palmas";
+			compatible = "ti,tps65913", "ti,palmas";
 			reg = <0x58>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
2.34.1

